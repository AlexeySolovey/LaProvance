<?php

require_once 'mc_core.php';

class mc_Message {
	private $db;
	private $table;
	private $table_id;
	private $id;
	private $data;
	private $primary_key;
	
	// Параметры:
	// 1) var table (string, int) - таблица в базе
	//    Примеры: 'Subdivision', 'Message2023' или 2023, 'User'
	// 2) var id (string, int) - значение уникального поля
	//    Примеры: 100, 'Ololo' (подразумевается что данная строка уникальная для заданного primary_key)
	//    Значение по умолчанию: -1 (создаётся новая строчка в базе)
	// 3) var primary_key (string) - первичный ключ-поле в базе
	//    Значение по умолчанию: 'Message_ID'
	//    Примеры: 'Subdivision_ID', 'Message_ID', 'User_ID'
	// 4) var fields (string, array) - получаемые поля из базы, которые преобразуются в поля класса
	//    Значение по умолчанию: null (берутся все поля из базы)
	//    Примеры: 'MyField', array('MyField1', 'MyField2', 'Created', 'Checked')
    public function __construct($table, $id = -1, $primary_key = 'Message_ID', $fields = null) {
        // Доступ к Б.Д.
        $mc_core = mc_Core::shared_instance();
        $this->db = $mc_core->db;
        
	    // Название таблицы в базе и её id (только для таблиц типа MessageXXXX)
	    $this->table_id = -1;
	    
	    if (is_numeric($table)) {
		    $this->table_id = $table;
		    
		    $table = "Message$table";
	    } else {
		    // Если таблица вида 'MessageXXXX'
		    if (strpos($table, 'Message') !== false ) {
			    // То вычленим 'XXXX'
		    	$this->table_id = intval(str_replace('Message', '', $table));
		    }
	    }
	    
        $this->table = $table;
        
        // ID записи в таблице
        $this->id = $id;
        
        // Первичный ключ
        $this->primary_key = $primary_key;
        
        // Определим какие поля из базы нужно выбирать
        if (is_null($fields)) {
	        // Получим имена полей из базы
	        $fields = $this->db->query_col("DESCRIBE $table");
        } else {
			// Если строковая переменная - преобразуем в массив
			if (is_string($fields)) {
				$fields = array($fields);
			}
        }
        
		// Добавим кавычки для исключения ошибок в запросе
		$fields = mc_DB::escape_fields_in_array($fields);
        
        $fields = implode(',', $fields);
        
		// Если ID не был передан, то создадим новую пустую строчку в данной таблице
		if ($id == -1) {
			$this->db->query("INSERT INTO `$this->table` (`Checked`) VALUES ('1')");
			
			$this->id = $this->db->last_insert_id();
		}
		
        // Данные полей
        $this->data = $this->db->query_row("SELECT $fields FROM `$this->table` WHERE `$this->primary_key`='$this->id'");
    }
    
    // Примеры использования:
    // echo $message->Created;
    // $a = $b + $message->Checked;
    public function __get($field) {
        return $this->data[$field];
    }
    
    // Примеры использования:
    // $message->Created = 'Ololo1';
    // $message->Checked = 0;
    public function __set($field, $value) {
        if(array_key_exists($field, $this->data)) {
            $this->data[$field] = $value;
        }
    }
    
    // Устанавливаем изображение в поле
    public function set_image($path_to_image, $field) {
	    // Проверим есть ли файл
	    if (!file_exists($path_to_image)) {
		    return false;
	    }
	    
	    // Проверим, обрабатываем ли мы таблицу вида 'MessageXXXX' или нет
	    if ($this->table_id == -1) {
		    return false;
	    }
	    
	    // Проверим есть ли поле для изображения в компоненте
	    if (!array_key_exists($field, $this->data)) {
		    return false;
	    }
	    
	    // Проверим есть ли в компоненте поля, необходимые для изменения изображения
	    if (!array_key_exists('Subdivision_ID', $this->data) || 
	        !array_key_exists('Sub_Class_ID', $this->data) || 
	        !array_key_exists('Message_ID', $this->data)) {
		    return false;
	    }
	    
	    // id записи, id раздела и id инфоблока
	    $message_id = $this->data['Message_ID'];
		$subdivision_id = $this->data['Subdivision_ID'];
		$sub_class_id = $this->data['Sub_Class_ID'];
	    
	    // Удалим старое изображение (если оно есть)
		$path_to_old_image = nc_file_path($this->table_id, $message_id, $field);
			
		if (strlen($path_to_old_image) > 0) {
			unlink($_SERVER['DOCUMENT_ROOT'].$path_to_old_image);
		}
	    
	    // Определим тип изображения
		$image_mime_type = mime_content_type($path_to_image);
		
		// Определим размер изображения
		$image_size = filesize($path_to_image);
		
		// Расширение изображения
		$image_extension = mc_Helper::detect_image_extension($path_to_image);
		
		// Наименование файла, относительный путь от корня WWW папки, и путь к изображению от корня после переноса
		$image_name = null;
		$path_to_new_image_relative = null;
		$path_to_new_image_absolute = null;
		
		// Будем подбирать пути к изображению пока не найдём свободный путь
		$counter = 0;
		
		do {
			// Новое имя файла
			$additional = '';
			
			if ($counter > 0) {
				$additional = '_'.$counter;
			}
			
			$image_name = $subdivision_id.'_'.$sub_class_id.'_'.$message_id.$additional.'.'.$image_extension;
		
			// Относительный путь где будет лежать файл
			$path_to_new_image_relative = $subdivision_id.'/'.$sub_class_id.'/'.$image_name;
			
			// Абсолютный путь от корня
			$path_to_new_image_absolute = $_SERVER['DOCUMENT_ROOT'].'/netcat_files/'.$path_to_new_image_relative;
			
			$counter++;
		} while(file_exists($path_to_new_image_absolute));
		
		// Значение поля для изображении
		$image_field_value = $image_name.':'.$image_mime_type.':'.$image_size.':'.$path_to_new_image_relative;
		
		// Создадим директорию если её еще нет
		$path_to_new_image_absolute_folder = dirname($path_to_new_image_absolute);
		
		if (!file_exists($path_to_new_image_absolute_folder)) {
		    mkdir($path_to_new_image_absolute_folder, 0777, true);
		}
		
		// Копируем изображение на новое место
		copy($path_to_image, $path_to_new_image_absolute);
		
		// Заполняем поле данными
		$this->data[$field] = $image_field_value;
		
		return true;
    }
    
    // Перебор по всем или только по выборочным записям
    public static function each($table, $primary_key = 'Message_ID', $query_where = null, $fields = null, $function) {
	    // Определим таблицу выборки
	    if (is_numeric($table)) {
		    $table = "Message$table";
	    }
	    
	    // Составим SQL запрос на выборку ID записей из базы
	    $query = "SELECT `$primary_key` FROM `$table`";
	    
	    if (!is_null($query_where)) {
		    $query .= " WHERE $query_where";
	    }
	    
	    $mc_core = mc_Core::shared_instance();
	    
	    // Для каждого ID создадим объект
	    $ids = $mc_core->db->query_col($query);
	    
	    foreach ($ids as $id) {
		    $row = new mc_Message($table, $id, $primary_key, $fields);
		    
		    // Обработаем объект
		    $function($row);
	    }
    }
    
    // Сохранение данных в базу
    public function save() {
		$keys_and_values = array();
		
		foreach ($this->data as $key=>$value) {
			$keys_and_values[]= "`$key`='$value'";
		}
		
		$keys_and_values = implode(',', $keys_and_values);
		
		$this->db->query("UPDATE `$this->table` SET $keys_and_values WHERE `$this->primary_key`='".$this->id."'");
    }
    
    // Выводим поля и их значения
    public function dump() {
	    print "<hr><xmp>".print_r($this->data, 1)."</xmp><hr>";
    }
}

?>
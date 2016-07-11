<?php

require_once 'mc_pdo.php';

class mc_DB {
	private $pdo;
	private $has_connection = false;
	
	public function __construct($host, $username, $password, $database, $charset = 'utf8') {
		$this->has_connection = true;
		
		try {
			$this->pdo = new mc_PDO($host, $username, $password, $database, $charset);
			
			$this->pdo->exec("SET NAMES $charset");
		} catch (PDOException $exc) {
			echo 'Connection error: '.$exc->getMessage().'<br>';
			
			$this->has_connection = false;
		}
	}
	
	public function has_connection() {
		return $this->has_connection;
	}
	
	// Получение сырых данных
	public function query($query, $field_key = null, $field_value = null) {
		$stmt = $this->pdo->query($query);
		
		// Если в результате запроса есть данные - вернем их
		if ($stmt->columnCount() != 0) {
			$result = $stmt->fetchAll();
			
			// Если пустые данные (пустая строка или пустой массив) - вернём null
			if (empty($result)) {
				return null;
			}
			
			// Сделаем результирующий массив ассоциативным
			if (!empty($field_key)) {
				// Заполним новый массив данными
				$result_new = array();
				
				// В качестве значения может быть как одиночное значение,
				// так и ассоциативный массив значений
				$is_single_value = false;
				
				if (is_null($field_value)) {
					// Если поле для значений пустое - возьмем все остальные поля
					$field_value = array_keys($result[0]);
					$field_value = array_values(array_diff($field_value, array($field_key)));
				} else if (is_array($field_value)) {
					// Массив из одного значения преобразуем в простое значение
					if (count($field_value) == 1) {
						$field_value = $field_value[0];
					}
				}
				
				if (is_string($field_value)) {
					$is_single_value = true;
				}
				
				foreach ($result as $row) {
					$key = $row[$field_key];
					
					$value = null;
					
					if ($is_single_value) {
						// Если одно значение - создадим пару "ключ" - "значение"
						$value = $row[$field_value];
					} else {
						// Если много значений - создадим пару "ключ" - "ассоциативный массив"
						$value = array();
						
						foreach ($field_value as $field) {
							$value[$field] = $row[$field];
						}
					}
					
					$result_new[$key] = $value;
				}
				
				// Удалим старый
				unset($result);
				
				// Переназначим массив
				$result = $result_new;
			}
			
			return $result;
		}
		
		return null;
	}
	
	// Получение одной строки
	public function query_row($query, $row = 0) {
		$result = $this->query($query);
		
		if (!empty($result)) {
			// Если данные есть
			if (!empty($result[$row])) {
				// Если есть строка с указанным индексом - то вернем её
				return $result[$row];
			}
		}
		
		return $result;
	}
	
	// Получение одного столбца
	public function query_col($query, $column = 0) {
		$result = $this->query($query);
		
		if (!empty($result)) {
			// Если данные есть
			if (is_numeric($column)) {
				// Если передан числовой индекс - преобразуем его в строковый
				$index = 0;
				
				foreach ($result[0] as $key => $value) {
					if ($index == $column) {
						$column = $key;
						
						break;
					}
					
					$index++;
				}
			}
			
			// Если есть строки с указанной колонкой - то вернем строки только с этой колонкой
			for ($i=0; $i<count($result); $i++) {
				$result[$i] = $result[$i][$column];
			}
		}
		
		return $result;
	}
	
	// Получение одной ячейки (на пересечении строки и столбца)
	public function query_cell($query, $row = 0, $column = 0) {
		$result = $this->query_col($query, $column);
		
		if (!empty($result)) {
			// Если данные есть
			$result = $result[$row];
		}
		
		return $result;
	}
	
	// Очистка таблицы к херам
	public function truncate($table) {
		$this->pdo->query("TRUNCATE TABLE $table");
	}
	
	// ID последней вставленной записи
	public function last_insert_id() {
		return $this->pdo->lastInsertId();
	}
	
	// Обрамление массива с полями MySQL кавычками
	public static function escape_fields_in_array($fields) {
		for ($i=0; $i<count($fields); $i++) {
			$fields[$i] = '`'.$fields[$i].'`';
		}
		
		return $fields;
	}
	
	// Делаем замены в строке
	public function escape($string) {
		$search = array("\\",  "\x00", "\n",  "\r",  "'",  '"', "\x1a");
		$replace = array("\\\\","\\0","\\n", "\\r", "\'", '\"', "\\Z");
		
		return str_replace($search, $replace, $string);
	}
}

?>
<?php

class mc_Helper {
	// Определяем расширение изображения по его содержимому
	public static function detect_image_extension($path_to_image) {
		$image_type_id = exif_imagetype($path_to_image);
	    
	    $extensions = array(
		    IMAGETYPE_GIF => 'gif',
			IMAGETYPE_JPEG => 'jpg',
			IMAGETYPE_PNG => 'png',
			IMAGETYPE_SWF => 'swf',
			IMAGETYPE_PSD => 'psd',
			IMAGETYPE_BMP => 'bmp',
			IMAGETYPE_ICO => 'ico'
	    );
	    
	    return $extensions[$image_type_id];
	}
	
	// Отсылаем письмо
	public static function send_mail($from_name, $from_email, $to, $subject, $message) {
		$headers = 
		'Content-type: text/html; charset=utf-8'."\r\n".
		'From: '.$from_name.' <'.$from_email.'>'."\r\n".
		'Reply-To: '.$from_email . "\r\n".
		'X-Mailer: PHP/'.phpversion();
		
		mail($to, $subject, $message, $headers);
	}
	
	// Преобразование даты в человеко-читаемый вид
	public static function format_date($date, $format = 'd.m.Y H:i') {
		$time = strtotime($date);
		
		return date($format, $time);
	}
	
	// Склонение имён
	public static function plural_form($n, $form1, $form2, $form5) {
		$n = abs($n) % 100;
		$n1 = $n % 10;
		
		if ($n > 10 && $n < 20) return $form5;
		
		if ($n1 > 1 && $n1 < 5) return $form2;
		
		if ($n1 == 1) return $form1;
		
		return $form5;
	}
	
	public static function generate_admin_button_edit($catalogue, $sub, $cc, $message, $icon = 'nc--edit', $inside_admin = 1) {
		echo '<a href="http://'.$_SERVER['SERVER_NAME'].'/netcat/message.php?inside_admin=1&amp;catalogue='.$catalogue.'&amp;sub='.$sub.'&amp;cc='.$cc.'&amp;message='.$message.'" onclick="parent.nc_form(this.href); return false;"><i title="изменить" class="nc-icon '.$icon.'"></i></a>';
	}
	
	public static function generate_admin_button_delete($catalogue, $sub, $cc, $message, $icon = 'nc--remove', $inside_admin = 1) {
		echo '<a href="http://'.$_SERVER['SERVER_NAME'].'/netcat/message.php?inside_admin=1&amp;catalogue='.$catalogue.'&amp;sub='.$sub.'&amp;cc='.$cc.'&amp;message='.$message.'&amp;delete=1" onclick="parent.nc_action_message(this.href); return false;"><i title="удалить" class="nc-icon '.$icon.'"></i></a>';
	}
	
	public static function image_src_from_field($field) {
		// Из поля выцепим относительный от папки netcat_files путь
		$path = explode(':', $field);
		$path = $path[3];
		
		return "/netcat_files/$path";
	}
}

?>
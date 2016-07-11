<?
	
	// Подключение функций и переменных NetCat
	require_once $_SERVER['DOCUMENT_ROOT'].'/netcat/connect_io.php';
	
	// Fast Getter
	foreach($_POST as $key => $value){
		$$key = $value;
	}
	
	$operatorMail = $db->get_var("SELECT OperatorEmail FROM Catalogue WHERE Catalogue_ID = 1");
	
	if($name && $phone){
		
		// Шлем письмо
		sendMail(
			$operatorMail,
			"Заявка на обратный звонок",
			"С сайта поступила новая заявка на обратный звонок:<br><br>".$name."<br>".$phone."<br>",
			"info@laprovence.com.ua",
			"LaProvence"
		);
	}
	
	// Функция отправки писем
	function sendMail($to, $subject, $message, $from_email, $from_name) {
		$headers = 
		'Content-type: text/html; charset=utf-8'."\r\n".
		'From: '.$from_name.' <'.$from_email.'>'."\r\n".
		'Reply-To: '.$from_email . "\r\n".
		'X-Mailer: PHP/'.phpversion();
		
		mail($to, $subject, $message, $headers);
	}
	
	// Уходим, шеф!
	header("Location: ".$_SERVER['HTTP_REFERER']."?sent=ok");

?>
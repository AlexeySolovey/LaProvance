<?
	
	// Подключение функций и переменных NetCat
	require_once $_SERVER['DOCUMENT_ROOT'].'/netcat/connect_io.php';
	require_once 'mc_connect.php';
	
	// Fast Getter
	foreach($_POST as $key => $value){
		$$key = $value;
	}
	
	$order = new mc_Message(24);
	$order->Subdivision_ID = 72;
	$order->Sub_Class_ID = 18;
	$order->User_ID = $user;
	$order->Goods = $order_json;
	$order->Name = $name;
	$order->Phone = $phone;
	$order->Email = $email;
	$order->save();
	
	$goods = $order_json;
	$goods = json_decode(str_replace("\\","",$goods));
	
	$goodsText = "<ol>";
    foreach($goods as $key=>$value){
        $good = $db->get_row("SELECT * FROM Message8 WHERE Message_ID = '".$key."'");
        $goodsText.= "<li><a target='_blank' href='".nc_message_link($key, 8)."'>".$good->Name."</a>, ".$value." шт. </li>";
    }
    $goodsText.= "<ol>";
	
	$orderMail = $db->get_var("SELECT OrderEmail FROM Catalogue WHERE Catalogue_ID = 1");
	
	if($name && $phone){
		
		// Шлем письмо
		sendMail(
			$orderMail,
			"Новый заказ на сайте",
			"Поступил новый заказ:<br><br>".
			$order->Name."<br>".
			$order->Phone."<br>".
			$order->Email."<br><br>".
			$goodsText,
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

	
	header("Location: ".$_SERVER['HTTP_REFERER'].'?ok=1');
	
?>
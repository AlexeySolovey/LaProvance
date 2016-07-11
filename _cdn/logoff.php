<?

	// Подключение функций и переменных NetCat
	require_once $_SERVER['DOCUMENT_ROOT'].'/netcat/connect_io.php';
		
	Unauthorize();
	
	header("Location: ".$_SERVER['HTTP_REFERER']);
	
?>
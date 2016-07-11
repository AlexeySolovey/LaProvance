<?
	
	// Подключение функций и переменных NetCat
	require_once $_SERVER['DOCUMENT_ROOT'].'/netcat/connect_io.php';
	
	// Fast Getter
	foreach($_POST as $key => $value){
		$$key = $value;
	}
	
	// Регистрация
	if($reg == 'true'){
		
		$name = $name." ".$surname;
		if(!$name){
			$name = $email;
		}
		
		// добавить нового пользователя
		$newUserID = $nc_core->user->add(
			array(
			),
			'2',
			$password,
			array(
				'Checked' => '1'
			)
		);
		
		// Обновить данные пользователя
		$query = 
			"UPDATE
				User
			SET
				Email = '".$email."',
				ForumName = '".$name."',
				City = '".$city."',
				Phone = '".$phone."'
			WHERE
				User_ID = '".$newUserID."'
			";
		$db->query($query);
		$nc_core->user->authorize_by_id($newUserID);
		
	}
	
	// Регистрация
	if($auth == 'true'){
		
		$password = md5($password);
		
		// Обновить данные пользователя
		$query = 
			"SELECT
				User_ID
			FROM
				User
			WHERE
				Email = '".$email."'
				AND
				Password = '".$password."'
			";
		$userID = $db->get_var($query);
		if($userID){
			$nc_core->user->authorize_by_id($userID);
		} else {
			header("Location: /enter/?wrong=1");
		}
		
	}

	header("Location: /");
	
?>
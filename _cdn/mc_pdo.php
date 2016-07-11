<?php

class mc_PDO extends PDO {	
	public function __construct($host, $username, $password, $database, $charset = 'utf8') {
		$dsn = "mysql:host=".$host.";dbname=".$database.";charset=".$charset;
		
		$opt = array(
			PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
			PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
		);
		
		parent::__construct($dsn, $username, $password, $opt);
	}
}

?>
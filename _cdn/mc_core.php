<?php

require_once 'mc_db.php';

class mc_Core {
	public $db;
	
	// Инициализиуем объекты
	private function constructor() {
		global $MYSQL_HOST;
		global $MYSQL_USER;
		global $MYSQL_PASSWORD;
		global $MYSQL_DB_NAME;
		
		$this->db = new mc_DB($MYSQL_HOST, $MYSQL_USER, $MYSQL_PASSWORD, $MYSQL_DB_NAME);
	}
	
	/*
	 * Методы и поля синглтона
	 */
	
	private static $shared_instance;
	
	public static function shared_instance() {
		if (!isset(self::$shared_instance)) {
			$class_name = __CLASS__;
			self::$shared_instance = new $class_name;
			
			self::$shared_instance->constructor();
		}
		
		return self::$shared_instance;
	}
	
	private function __construct() {
		
	}
	
	public function __clone() {
		
	}
	
	public function __wakeup() {
		
	}
}

?>

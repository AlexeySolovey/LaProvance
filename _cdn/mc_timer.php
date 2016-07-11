<?php

require_once 'mc_core.php';

class mc_Timer {
	private static $description = null;
	private static $t0 = 0;
	private static $t1 = 0;
	
	public static function start($description = 'Время выполнения') {
		self::$description = $description;
		
		self::$t0 = microtime(true);
	}
	
	public static function end() {
		self::$t1 = microtime(true);
	}
	
	public static function printResults() {
		$delta = (self::$t1 - self::$t0);
		
		$delta = round($delta, 6);
		
		dump(self::$description.': '.$delta.'  секунд.');
	}
}

?>
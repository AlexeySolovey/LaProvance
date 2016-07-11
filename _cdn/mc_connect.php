<?php

// Подключение функций и переменных NetCat
require_once $_SERVER['DOCUMENT_ROOT'].'/netcat/connect_io.php';

require_once 'mc_core.php';
require_once 'mc_helper.php';
require_once 'mc_message.php';
require_once 'mc_timer.php';

// Для быстрого обращения к DB
$mc_db = $mc_core->db;

?>
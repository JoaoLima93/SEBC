<?php
    try{
    	$HOST = "localhost";
    	$DATABASE ="sbec";
    	$USER = "root";
    	$PASS = "";

    	$PDO = NEW PDO("mysql:host=" . $HOST .";dbname=" .$DATABASE . ";charset=utf8", $USER, $SENHA)
	}catch (PDOExcepyion $erro){
		echo $erro->getMessege();
	}
?>
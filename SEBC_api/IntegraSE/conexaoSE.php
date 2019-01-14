<?php
    try{
    	$HOST = "localhost";
    	$DATABASE ="sbec";
    	$USER = "root";
    	$PASS = "";
    	$PDO = NEW PDO("mysql:host=" . $HOST .";dbname=" .$DATABASE . ";charset=utf8", $USER, $PASS);

	} catch (PDOException $erro) { 
		echo "Error: " . $erro->getMessage();
	}
?>
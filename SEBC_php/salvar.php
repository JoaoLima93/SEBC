<?php

	$id_cliente 	= $_GET['id_cliente'];
	$leitura	  	= $_GET['leitura'];
	$hora_consumo 	= $_GET['hora_consumo'];

	$sql = "INSERT INTO leituras (id_cliente, leitura, hora_consumo) VALUES (:id_cliente, :leitura, :hora_consumo)";

	$stmt = $PDO -> prepare($sql);
	$stmt -> bindParam(':id_cliente', $id_cliente);
	$stmt -> bindParam(':leitura', $leitura);
	$stmt -> bindParam(':hora_consumo', $hora_consumo);

?> 
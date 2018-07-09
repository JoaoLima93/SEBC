<?php
	include ('conexao.php');

	$id_cliente 	= $_GET['id_cliente'];
	$leitura_a	  	= $_GET['leitura'];
	$hora_a		 	= $_GET['hora_consumo'];

	$sql = "INSERT INTO leituras (id_cliente, leitura_a, hora_a) VALUES (:id_cliente, :leitura_a, :hora_a)";

	$stmt = $PDO -> prepare($sql);
	$stmt -> bindParam(':id_cliente', $id_cliente);
	$stmt -> bindParam(':leitura_a', $leitura_a);
	$stmt -> bindParam(':hora_a', $hora_a);

	if ($stmt -> execute()) {
		echo 'Ok';
	} else {
		echo "Error";
	}
?> 
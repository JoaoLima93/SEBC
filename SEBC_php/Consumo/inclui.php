<?php
	include ('conexao.php');

	$id_cliente 	= $_GET['id_cliente'];
	$leitura_a	  	= $_GET['leitura_a'];
	$leitura_b	  	= $_GET['leitura_b'];
	$hora_consumo 	= $_GET['hora_consumo'];

	$sql = "INSERT INTO leituras (id_cliente, leitura_a, leitura_b, hora_consumo) 
			VALUES (:id_cliente, :leitura_a, :leitura_b, :hora_consumo)";

	$stmt = $PDO -> prepare($sql);
	$stmt -> bindParam(':id_cliente', $id_cliente);
	$stmt -> bindParam(':leitura_a', $leitura_a);
	$stmt -> bindParam(':leitura_b', $leitura_b);
	$stmt -> bindParam(':hora_consumo', $hora_consumo);

	if ($stmt -> execute()) {
		echo 'Ok';
	} else {
		echo "Error";
	}
?> 
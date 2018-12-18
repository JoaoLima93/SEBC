<?php
header('Content-Type: text/html; charset=utf-8');

    include 'dbConnection.php';

    $conn = new mysqli($HostName, $HostUser,
    	 $HostPass, $DatabaseName);
    	 
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error) { // Será que é uma boa?

        die("Ops, falhou....: " . $conn->connect_error);
    }

    $sql = "SELECT * FROM usuario";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {

        echo "Com alguns registros....";
        
    } else {
    
        echo "Sem dados no momento...";
    }
    

    $conn->close();
    
?>
<?php
header('Content-Type: text/html; charset=utf-8');

$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST'){ 
    include 'C:\xampp\htdocs\sebc\IntegraAPI\ConexaoAPI.php';

    $conn = new mysqli($HostName, $HostUser,$HostPass, $DatabaseName);
         
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error) {

        die("Ops, falhou....: " . $conn->connect_error);
    }

    $data          = "'".$_POST['data']."'";
    $dia_util      = "'".$_POST['dia_util']."'";

    $sql_valida = "SELECT * FROM feriados WHERE data = $data";

    $sql_inserir  = "UPDATE feriados SET data     = $data,
                                         dia_util = $dia_util
                     WHERE DATA =$data";

    $result_valida = $conn->query($sql_valida);


    if ($result_valida->num_rows == 0) {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Feriado não cadastrado";

    }else{     
    
        $result2 = $conn->query($sql_inserir);

        $response["autorizado"]  = true;
        $response["mensagem"]    = "Feriado alterado";
    
    }
    
    echo json_encode($response);

    $conn->close();
}
?>
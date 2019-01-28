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

    $data        = "'".$_POST['data']."'";

    $sql_valida = "SELECT * FROM feriados WHERE data = $data";

    $sql_deleta = "DELETE FROM feriados WHERE data = $data";

    $result_valida = $conn->query($sql_valida);


    if ($result_valida->num_rows == 0) {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Nao foi encontrado feriados para deletar";

    }else{     
    
        $result2 = $conn->query($sql_deleta);

        $response["autorizado"]  = true;
        $response["mensagem"]    = "Feriado deletada";
    
    }
    
    echo json_encode($response);

    $conn->close();
}
?>
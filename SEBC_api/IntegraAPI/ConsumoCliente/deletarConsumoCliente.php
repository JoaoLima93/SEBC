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

    $id_cliente        = "'".$_POST['id_cliente']."'";
    $data_inicio       = "'".$_POST['data_inicio']."'";
    $data_fim          = "'".$_POST['data_fim']."'";

    $sql_valida = "SELECT * FROM calc_consumo WHERE id_cliente   = $id_cliente 
                                                and data_consumo > $data_inicio
                                                and data_consumo < $data_fim";

    $sql_deleta = "DELETE FROM calc_consumo WHERE id_cliente   = $id_cliente 
                                                and data_consumo > $data_inicio
                                                and data_consumo < $data_fim";

    $result_valida = $conn->query($sql_valida);


    if ($result_valida->num_rows == 0) {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Não foi encontrado consumo para deletar";

    }else{     
    
        $result2 = $conn->query($sql_deleta);

        $response["autorizado"]  = true;
        $response["mensagem"]    = "Tarifa deletada";
    
    }
    
    echo json_encode($response);

    $conn->close();
}
?>
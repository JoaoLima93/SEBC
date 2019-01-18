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

    $id_tarifa        = "'".$_POST['id_tarifa']."'";
    $nome_tarifa      = "'".$_POST['nome_tarifa']."'";

    $sql_valida = "SELECT * FROM tarifas WHERE id_tarifa = $id_tarifa or nome_tarifa =$nome_tarifa";

    $sql_deleta = "DELETE FROM tarifas WHERE id_tarifa = $id_tarifa or nome_tarifa =$nome_tarifa";

    $result_valida = $conn->query($sql_valida);


    if ($result_valida->num_rows > 0) {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Não foi encontrado tarifa para deletar";

    }else{     
    
        $result2 = $conn->query($sql_deleta);

        $response["autorizado"]  = true;
        $response["mensagem"]    = "Tarifa deletada";
    
    }
    
    echo json_encode($response);

    $conn->close();
}
?>
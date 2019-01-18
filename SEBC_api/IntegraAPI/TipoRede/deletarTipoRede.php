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

    $id        = "'".$_POST['id']."'";
    $nome      = "'".$_POST['nome']."'";

    $sql_valida = "SELECT * FROM tipo_rede WHERE id = $id or nome =$nome";

    $sql_deleta = "DELETE FROM tipo_rede WHERE id = $id or nome =$nome";

    $result_valida = $conn->query($sql_valida);


    if ($result_valida->num_rows > 0) {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Nao foi encontrado tipo_rede para deletar";

    }else{     
    
        $result2 = $conn->query($sql_deleta);

        $response["autorizado"]  = true;
        $response["mensagem"]    = "tipo_rede deletada";
    
    }
    
    echo json_encode($response);

    $conn->close();
}
?>
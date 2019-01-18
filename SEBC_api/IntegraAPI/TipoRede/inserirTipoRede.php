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

    $nome          = "'".$_POST['nome']."'";
    $qtnd_fases    = "'".$_POST['qtnd_fases']."'";
    $qtnd_fios     = "'".$_POST['qtnd_fios']."'";

    $sql_valida = "SELECT * FROM tipo_rede WHERE nome = $nome";

    $sql_inserir  = "INSERT INTO tipo_rede (nome,qtnd_fases,qtnd_fios)
                          VALUES ($nome, $qtnd_fases, $qtnd_fios)";

    $result_valida = $conn->query($sql_valida);


    if ($result_valida->num_rows > 0) {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Tipo_rede ja existente";

    }else{     
    
        $result2 = $conn->query($sql_inserir);

        $response["autorizado"]  = true;
        $response["mensagem"]    = "Tipo_rede criado";
    
    }
    
    echo json_encode($response);

    $conn->close();
}
?>
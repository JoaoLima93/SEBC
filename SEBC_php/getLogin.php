<?php
header('Content-Type: text/html; charset=utf-8');

$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST'){

include 'dbConnection.php';

    $conn = new mysqli($HostName, $HostUser,$HostPass, $DatabaseName);
    	 
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error) {

        die("Ops, falhou....: " . $conn->connect_error);
    }

    $login     = "'".$_POST['login']."'";
    $senha     = "'".$_POST['senha']."'";

    $sql = "SELECT * FROM cadastro_cliente WHERE login = $login AND senha = $senha";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {

        $dados_usuario = mysqli_fetch_array($result);

        $response["id"]  = $dados_usuario['id'];
        $response["autorizado"]  = true;
        $response["mensagem"]  = "Acesso Permitido";
        $response["login"]  = $dados_usuario['login'];
        $response["senha"]  = $dados_usuario['senha'];
        $response["perfil"]  = $dados_usuario['perfil'];
        $response["nome"]  = $dados_usuario['nome'];
        $response["num_medidor"]  = $dados_usuario['num_medidor'];
        $response["tipo_rede"]  = $dados_usuario['tipo_rede'];

    } else {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Usuario ou Senha estao errados";

    }
    
    echo json_encode($response);

    $conn->close();
}
?>
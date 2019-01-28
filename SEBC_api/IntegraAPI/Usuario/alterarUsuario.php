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
    
    $nome         = "'".$_POST['nome']."'";
    $num_medidor  = "'".$_POST['num_medidor']."'";
    $tipo_rede    = "'".$_POST['tipo_rede']."'";
    $login        = "'".$_POST['login']."'";
    $senha        = "'".$_POST['senha']."'";
    $perfil       = "'".$_POST['perfil']."'";
    $termos_uso   = "'".$_POST['termos_uso']."'";
    $rede         = "'".$_POST['rede']."'";
    $senha_rede   = "'".$_POST['senha_rede']."'";
    $ativo        = "'".$_POST['ativo']."'";


    $sql_valida = "SELECT * FROM cadastro_cliente WHERE login = $login";

    $sql_inserir  = "UPDATE cadastro_cliente SET nome        = $nome,
                                                 num_medidor = $num_medidor,
                                                 tipo_rede   = $tipo_rede,
                                                 termos_uso  = $termos_uso,
                                                 login       = $login,
                                                 senha       = $senha,
                                                 perfil      = $perfil,
                                                 rede        = $rede,
                                                 senha_rede  = $senha_rede,
                                                 ativo       = $ativo
                     WHERE login = $login";

    $result_valida = $conn->query($sql_valida);


    if ($result_valida->num_rows == 0) {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Usuario não existente";

    }else{     
    
        $result2 = $conn->query($sql_inserir);

        $response["autorizado"]  = true;
        $response["mensagem"]    = "Usuario alterado";
    
    }
    
    echo json_encode($response);

    $conn->close();
}
?>
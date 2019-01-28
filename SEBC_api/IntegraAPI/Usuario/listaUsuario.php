<?php
header('Content-Type: text/html; charset=utf-8');

$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'GET'){

    include 'C:\xampp\htdocs\sebc\IntegraAPI\ConexaoAPI.php';

    date_default_timezone_set('America/Sao_Paulo');

    $conn = new mysqli($HostName, $HostUser,$HostPass, $DatabaseName);
    	 
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error) {

        die("Ops, falhou....: " . $conn->connect_error);
    }

    $id           = "'".$_GET['id']."'";
    $nome         = "'".$_GET['nome']."'";
    $num_medidor  = "'".$_GET['num_medidor']."'";

    $sql = "SELECT * FROM cadastro_cliente WHERE id          = $id 
                                              or nome        = $nome
                                              or num_medidor = $num_medidor";

    $result = $conn->query($sql);
    $rows = array();

    if ($result->num_rows > 0) {   
        while($row = mysqli_fetch_assoc($result)) {    
                  $id                  = $row['id'];
                  $nome                = $row['nome'];
                  $num_medidor         = $row['num_medidor'];
                  $tipo_rede           = $row['tipo_rede'];
                  $login               = $row['login'];
                  $senha               = $row['senha'];
                  $perfil              = $row['perfil'];
                  $rede                = $row['rede'];
                  $senha_rede          = $row['senha_rede'];
                  $ativo               = $row['ativo'];

              $rows['clientes'][] = array('id'          => $id,
                                         'nome'         => $nome, 
                                         'num_medidor'  => $num_medidor,
                                         'tipo_rede'    => $tipo_rede,
                                         'login'        => $login,
                                         'senha'        => $senha, 
                                         'perfil'       => $perfil,
                                         'rede'         => $rede,
                                         'senha_rede'   => $senha_rede, 
                                         'ativo'        => $ativo
                                         );
        }
    }

    echo json_encode($rows);    

    $conn->close();
}
?>
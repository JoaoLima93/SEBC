<?php
header('Content-Type: text/html; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] == 'GET'){

    include 'C:\xampp\htdocs\sebc\IntegraAPI\ConexaoAPI.php';

    date_default_timezone_set('America/Sao_Paulo');

    $conn = new mysqli($HostName, $HostUser,$HostPass, $DatabaseName);
       
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error) {

        die("Ops, falhou....: " . $conn->connect_error);

    }

    $num_medidor  = "'".$_GET['num_medidor']."'";

    $sql = "SELECT * FROM CADASTRO_CLIENTE WHERE num_medidor = $num_medidor";

    $result = $conn->query($sql);

    $rows = array();

    if ($result->num_rows > 0) {   
        while($row = mysqli_fetch_assoc($result)) {    
                  $id          = $row['id'];
                  $rede        = $row['rede'];
                  $senha_rede  = $row['senha_rede'];
        }
    }

    echo $id;
    echo "_";
    echo $rede;
    echo "_";
    echo $senha_rede;        
  
    $conn->close();
}
?>

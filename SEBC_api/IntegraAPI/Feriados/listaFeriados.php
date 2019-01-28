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

    $data_inicio           = "'".$_GET['data_inicio']."'";
    $data_fim              = "'".$_GET['data_fim']."'";

    $sql = "SELECT * FROM feriados WHERE data > $data_inicio and data < $data_fim";

    $result = $conn->query($sql);
    $rows = array();

    if ($result->num_rows > 0) {   
        while($row = mysqli_fetch_assoc($result)) {    
                  $id                  = $row['id'];
                  $data                = $row['data'];
                  $dia_util            = $row['dia_util'];

              $rows['tipo_rede'][] = array('id'          => $id,
                                          'nome'         => $nome, 
                                          'qtnd_fases'   => $qtnd_fases,
                                          'qtnd_fios'    => $qtnd_fios
                                         );
        }
    }

    echo json_encode($rows);    

    $conn->close();
}
?>
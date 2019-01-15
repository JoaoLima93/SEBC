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

    $id_tarifa         = "'".$_GET['id_tarifa']."'";
    $tarifa_dinamica   = "'".$_GET['tarifa_dinamica']."'";
    $date              = date('H:i:s');
 
    $sql = "SELECT * FROM tarifas WHERE id_tarifa = $id_tarifa 
                                        and inicio_periodo < time(now())
                                        and fim_periodo > time(now())";

    $result = $conn->query($sql);
    $rows = array();

    if ($result->num_rows > 0) {   
        while($row = mysqli_fetch_assoc($result)) {    
                  $id_tarifa = $row['id_tarifa'];
                  $nome_tarifa = $row['nome_tarifa'];
                  $tarifa_dinamica = $row['tarifa_dinamica'];
                  $periodo_consumo = $row['periodo_consumo'];
                  $preco_kwh = $row['preco_kwh'];
                  $inicio_periodo = $row['inicio_periodo'];
                  $fim_periodo = $row['fim_periodo'];
                  $aceita_Bandeira = $row['aceita_Bandeira'];
              
              $rows['tarifas'][] = array('id_tarifa'        => $id_tarifa,
                                         'nome_tarifa'      => $nome_tarifa, 
                                         'tarifa_dinamica'  => $tarifa_dinamica,
                                         'periodo_consumo'  => $periodo_consumo,
                                         'preco_kwh'        => $preco_kwh,
                                         'inicio_periodo'   => $inicio_periodo, 
                                         'fim_periodo'      => $fim_periodo,
                                         'aceita_Bandeira'  => $aceita_Bandeira
                                         );
              $rows['data']      = $date;
        }
    }

    echo json_encode($rows);    

    $conn->close();
}
?>
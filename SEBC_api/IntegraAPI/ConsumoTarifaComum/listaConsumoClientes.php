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

    $id_cliente        = "'".$_GET['id_cliente']."'";
    $date              = date('H:i:s');
 
    $sql = "SELECT cc.id                as id_cliente,
                   c_now.consumo        as consumo_atual, 
                   sum(c_dia.consumo)   as consumo_dia,
                   sum(c_mes.consumo)   as consumo_mes
            FROM cadastro_cliente cc
            LEFT JOIN calc_consumo c_now on c_now.id_cliente           = cc.id
                                         and c_now.data_consumo        > (now() - 100) 
            LEFT JOIN calc_consumo c_dia on c_dia.id_cliente           = cc.id 
                                         and date(c_dia.data_consumo)  = date(now()) 
            LEFT JOIN calc_consumo c_mes on c_mes.id_cliente           = cc.id 
                                         and month(c_mes.data_consumo) = month(now())
                                         and year(c_mes.data_consumo)  = year(now())
            WHERE cc.id_cliente = $id_cliente
            group by cc.id";
            
    $result = $conn->query($sql);
    $rows = array();

    if ($result->num_rows > 0) {   
        while($row = mysqli_fetch_assoc($result)) {    
                  $id_cliente = $row['id_cliente'];
                  $consumo_atual = $row['consumo_atual'];
                  $consumo_dia = $row['consumo_dia'];
                  $consumo_mes = $row['consumo_mes'];
              
              $rows['tarifas'][] = array('id_cliente'       => $id_cliente,
                                         'consumo_atual'    => $consumo_atual, 
                                         'consumo_dia'      => $tarifa_dinamica,
                                         'consumo_mes'      => $consumo_mes
                                         );
              $rows['data']      = $date;
        }
    }

    echo json_encode($rows);    

    $conn->close();
}
?>
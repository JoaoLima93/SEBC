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
 
    $sql = "SELECT cc.id                            as id_cliente,
                   c_now.custo_tarifa_branca        as custo_atual, 
                   sum(c_dia.custo_tarifa_branca)   as custo_dia,
                   sum(c_mes.custo_tarifa_branca)   as custo_mes
            FROM cadastro_cliente cc
            LEFT JOIN calc_consumo c_now on c_now.id_cliente           = cc.id
                                         and c_now.data_consumo        > (now() - 100) 
            LEFT JOIN calc_consumo c_dia on c_dia.id_cliente           = cc.id 
                                         and date(c_dia.data_consumo)  = date(now()) 
            LEFT JOIN calc_consumo c_mes on c_mes.id_cliente           = cc.id 
                                         and month(c_mes.data_consumo) = month(now())
                                         and year(c_mes.data_consumo)  = year(now())
            WHERE cc.id = $id_cliente
            group by cc.id";

    $result = $conn->query($sql);
    $rows = array();

    if ($result->num_rows > 0) {   
        while($row = mysqli_fetch_assoc($result)) {    
                  $id_cliente = $row['id_cliente'];
                  $custo_atual = $row['custo_atual'];
                  $custo_dia = $row['custo_dia'];
                  $custo_mes = $row['custo_mes'];
              
              $rows['custos_branca'][] = array('id_cliente'      => $id_cliente,
                                         'custo_atual'    => $custo_atual, 
                                         'custo_dia'      => $custo_dia,
                                         'custo_mes'      => $custo_mes
                                         );
              $rows['data']      = $date;
        }
    }

    echo json_encode($rows);    

    $conn->close();
}
?>
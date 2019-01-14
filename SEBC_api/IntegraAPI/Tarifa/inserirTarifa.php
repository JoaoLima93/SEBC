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

    $id_tarifa        = "'".$_POST['id_tarifa']."'";
    $nome_tarifa      = "'".$_POST['nome_tarifa']."'";
    $tarifa_dinamica  = "'".$_POST['tarifa_dinamica']."'";
    $periodo_consumo  = "'".$_POST['periodo_consumo']."'";
    $preco_kwh        = "'".$_POST['preco_kwh']."'";
    $inicio_periodo   = "'".$_POST['inicio_periodo']."'";
    $fim_periodo      = "'".$_POST['fim_periodo']."'";
    $aceita_bandeira  = "'".$_POST['aceita_bandeira']."'";

    $sql_valida = "SELECT * FROM tarifas WHERE id_tarifa = $id_tarifa or nome_tarifa =$nome_tarifa ";

    $sql_inserir  = "INSERT INTO tarifas (id_tarifa,nome_tarifa,tarifa_dinamica,periodo_consumo,preco_kwh,inicio_periodo,fim_periodo,aceita_bandeira)
                   VALUES ($id_tarifa,$nome_tarifa,$tarifa_dinamica,$periodo_consumo,$preco_kwh,$inicio_periodo,$fim_periodo,$aceita_bandeira)";

    $result_valida = $conn->query($sql_valida);


    if ($result_valida->num_rows > 0) {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Id ou nome da Tarifa ja existe";

    }else{     
    
        if($fim_periodo<$inicio_periodo){
              $response["autorizado"]  = false;
              $response["mensagem"]    = "Horario final maior que inicial";
        }else{

            $result2 = $conn->query($sql_inserir);

            $response["autorizado"]  = true;
            $response["mensagem"]    = "Tarifa criada";
        }
    
    }
    
    echo json_encode($response);

    $conn->close();
}
?>
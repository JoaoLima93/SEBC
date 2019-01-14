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

    $id_tarifa     = "'".$_GET['id_tarifa']."'";
    $tarifa_dinamica  = "'".$_GET['tarifa_dinamica']."'";
    $date          = date('H:i:s');

    if ($tarifa_dinamica == 'T'){
        $sql = "SELECT * FROM tarifas WHERE id_tarifa = $id_tarifa 
                                        and inicio_periodo < $date and fim_periodo > $date";
    }else{
        $sql = "SELECT * FROM tarifas WHERE id_tarifa = $id_tarifa"; 
    }

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {

        $dados_usuario = mysqli_fetch_array($result);

        $response["id_tarifa"]        = $dados_usuario['id_tarifa'];
        $response["nome_tarifa"]      = $dados_usuario['nome_tarifa'];
        $response["tarifa_dinamica"]  = $dados_usuario['tarifa_dinamica'];
        $response["periodo_consumo"]  = $dados_usuario['periodo_consumo'];
        $response["preco_kwh"]        = $dados_usuario['preco_kwh'];
        $response["inicio_periodo"]   = $dados_usuario['inicio_periodo'];
        $response["fim_periodo"]      = $dados_usuario['fim_periodo'];
        $response["aceita_Bandeira"]  = $dados_usuario['aceita_Bandeira'];
        $response["data"]             = $date;

    } else {

        $response["autorizado"]  = false;
        $response["mensagem"]    = "Nenhuma periodo de consumo encontrado para essa tarifa no horario atual";
        $response["data"]        = $date;
    }
    
    echo json_encode($response);

    $conn->close();
}
?>
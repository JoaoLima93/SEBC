<?php
$ambiente = false;

if ($ambiente) { // Ambiente de Produção

    $HostName = "";
    $HostUser = "";
    $HostPass = "";
    $DatabaseName = "";    
    
} else { // Ambiente de Desenvolvimento

    $HostName = "localhost";
    $HostUser = "root";
    $HostPass = "SenhaDoMaddo";
    $DatabaseName = "youtube";
    
}
?>
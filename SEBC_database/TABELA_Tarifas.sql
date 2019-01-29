CREATE TABLE `tarifas` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `id_tarifa` int(11) NOT NULL,
 `nome_tarifa` varchar(25) NOT NULL,
 `tarifa_dinamica` varchar(1) NOT NULL,
 `periodo_consumo` varchar(25) NOT NULL,
 `preco_kwh` decimal(10,4) NOT NULL,
 `inicio_periodo` time NOT NULL,
 `fim_periodo` time NOT NULL,
 `aceita_Bandeira` varchar(1) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `id_tarifa` (`id_tarifa`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1
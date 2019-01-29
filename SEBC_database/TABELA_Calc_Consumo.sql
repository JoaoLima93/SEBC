CREATE TABLE `calc_consumo` (
 `id_cliente` int(11) NOT NULL,
 `consumo` decimal(10,4) NOT NULL,
 `custo_tarifa_normal` decimal(10,2) NOT NULL,
 `custo_tarifa_branca` decimal(10,2) NOT NULL,
 `data_consumo` datetime NOT NULL,
 PRIMARY KEY (`id_cliente`),
 CONSTRAINT `calc_consumo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `leituras` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `leituras` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `id_cliente` int(11) NOT NULL,
 `leitura_a` decimal(11,2) NOT NULL,
 `leitura_b` decimal(11,2) NOT NULL,
 `leitura_c` decimal(11,2) NOT NULL,
 `hora_consumo` time NOT NULL,
 `data_web` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 UNIQUE KEY `id` (`id`),
 KEY `id_cliente` (`id_cliente`),
 CONSTRAINT `leituras_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cadastro_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19014 DEFAULT CHARSET=latin1
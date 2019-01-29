CREATE TABLE `cadastro_cliente` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `nome` varchar(50) NOT NULL,
 `num_medidor` int(11) NOT NULL,
 `tipo_rede` int(11) NOT NULL,
 `termos_uso` tinyint(1) NOT NULL,
 `login` varchar(100) NOT NULL,
 `senha` varchar(10) NOT NULL,
 `perfil` varchar(1) NOT NULL,
 `rede` varchar(25) NOT NULL,
 `senha_rede` varchar(25) NOT NULL,
 `ativo` varchar(1) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `tipo_rede` (`tipo_rede`),
 CONSTRAINT `cadastro_cliente_ibfk_1` FOREIGN KEY (`tipo_rede`) REFERENCES `tipo_rede` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COMMENT='Tbl destinado a cadastro de cliente'
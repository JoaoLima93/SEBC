CREATE TABLE `feriados` (
 `id_data` int(11) NOT NULL AUTO_INCREMENT,
 `data` date NOT NULL,
 `dia_util` varchar(1) NOT NULL,
 PRIMARY KEY (`id_data`),
 UNIQUE KEY `data` (`data`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1

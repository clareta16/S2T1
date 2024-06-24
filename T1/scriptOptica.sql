-- `Cul d'ampolla`.proveidor definition

CREATE TABLE `proveidor` (
  `id_proveidor` varchar(15) NOT NULL,
  `tlfn` int(9) NOT NULL,
  `fax` int(5) DEFAULT NULL,
  `nif` varchar(15) NOT NULL,
  `carrer` varchar(15) NOT NULL,
  `numero` tinyint(4) NOT NULL,
  `pis` tinyint(4) NOT NULL,
  `porta` tinyint(4) NOT NULL,
  `ciutat` varchar(15) NOT NULL,
  `codiPostal` tinyint(5) NOT NULL,
  `pais` varchar(15) NOT NULL,
  PRIMARY KEY (`id_proveidor`)
  
) 

-- `Cul d'ampolla`.client definition

CREATE TABLE `client` (
  `id_client` varchar(10) NOT NULL,
  `adrecaPostal` tinyint(4) NOT NULL,
  `tlfn` int(12) NOT NULL,
  UNIQUE INDEX `correuElectronic` varchar(15) NOT NULL,
  `dataRegistre` date NOT NULL,
  `clientRecomanat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `client_unique` (`correuElectronic`),
  KEY `clientRecomanat` (`clientRecomanat`),
  CONSTRAINT `clientRecomanat` FOREIGN KEY (`clientRecomanat`) REFERENCES `client` (`id_client`)
) 

-- `Cul d'ampolla`.ulleres definition

CREATE TABLE `ulleres` (
  `id_marca` varchar(15) NOT NULL,
  `graduacioVidreEix` decimal(5,2) NOT NULL,
  `graduacioVidre2Eix` decimal(5,2) NOT NULL,
  `cilindre` decimal(5,2) NOT NULL,
  `cilindre2` decimal(5,2) NOT NULL,
  `esfera` decimal(5,2) NOT NULL,
  `esfera2` decimal(5,2) NOT NULL,
  `prisma` decimal(5,2) NOT NULL,
  `prisma2` decimal(5,2) NOT NULL,
  `tipusMuntura` enum('flotant','pasta','metalica') NOT NULL,
  `colorVidre1` varchar(10) NOT NULL,
  `colorVidre2` varchar(10) NOT NULL,
  `preu` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_marca`)
) 

-- `Cul d'ampolla`.venda definition

CREATE TABLE `venda` (
  `id_venedor` varchar(15) NOT NULL,
  `data` date NOT NULL,
  `id_marca` varchar(100) DEFAULT NULL,
  `id_client` varchar(100) DEFAULT NULL,
  `id_proveidor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_venedor`),
  KEY `venda_proveidor_FK` (`id_proveidor`),
  KEY `venda_client_FK` (`id_client`),
  KEY `venda_ulleres_FK` (`id_marca`),
  CONSTRAINT `venda_client_FK` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `venda_proveidor_FK` FOREIGN KEY (`id_proveidor`) REFERENCES `proveidor` (`id_proveidor`),
  CONSTRAINT `venda_ulleres_FK` FOREIGN KEY (`id_marca`) REFERENCES `ulleres` (`id_marca`)
) 

ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- Pizzeria.client definition

CREATE TABLE Pizzeria.client (
	id_client INT auto_increment NOT NULL,
	nom varchar(10) NOT NULL,
	cognoms varchar(20) NOT NULL,
	adreca varchar(100) NOT NULL,
	codiPostal TINYINT(5) NOT NULL,
	tlfn INT(12) NULL,
	localitat_id INT NULL,
	provincia_id INT NULL,
	CONSTRAINT client_pk PRIMARY KEY (id_client),
	CONSTRAINT client_localitat_FK FOREIGN KEY (localitat_id) REFERENCES Pizzeria.localitat(id_localitat),
	CONSTRAINT client_provincia_FK FOREIGN KEY (provincia_id) REFERENCES Pizzeria.provincia(id_provincia)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS Pizzeria.client;
CREATE INDEX client_id_client_IDX USING BTREE ON Pizzeria.client (id_client,cognoms);

-- Pizzeria.localitat definition

CREATE TABLE Pizzeria.localitat (
	id_localitat INT auto_increment NOT NULL,
	nomLocalitat varchar(15) NOT NULL,
	provincia_id varchar(100) NULL,
	CONSTRAINT localitat_unique UNIQUE KEY (id_localitat),
	CONSTRAINT localitat_provincia_FK FOREIGN KEY (provincia_id) REFERENCES Pizzeria.provincia(id_provincia)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS Pizzeria.localitat;
CREATE INDEX localitat_nomLocalitat_IDX USING BTREE ON Pizzeria.localitat (nomLocalitat);

-- Pizzeria.provincia definition

CREATE TABLE Pizzeria.provincia (
	id_provincia INT auto_increment NOT NULL,
	nomProvincia varchar(15) NOT NULL,
	CONSTRAINT provincia_pk PRIMARY KEY (id_provincia)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS Pizzeria.provincia;
CREATE INDEX provincia_nomProvincia_IDX USING BTREE ON Pizzeria.provincia (nomProvincia);

-- Pizzeria.comanda definition

CREATE TABLE Pizzeria.comanda (
	id_comanda INT auto_increment NOT NULL,
	dataHora DATETIME NOT NULL,
	tipusComanda ENUM('domicili', 'botiga') NOT NULL,
	preu DECIMAL(4,2) NOT NULL,
	categoria varchar(100) NULL,
	producte_id varchar(100) NULL,
	reparto_id varchar(100) NULL,
	client_id varchar(100) NULL,
	CONSTRAINT comanda_pk PRIMARY KEY (id_comanda),
	CONSTRAINT comanda_ComandaDomicili_FK FOREIGN KEY (reparto_id) REFERENCES Pizzeria.ComandaDomicili(id_reparto),
	CONSTRAINT comanda_client_FK FOREIGN KEY (client_id) REFERENCES Pizzeria.client(id_client)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS Pizzeria.comanda;
CREATE INDEX comanda_categoria_IDX USING BTREE ON Pizzeria.comanda (categoria);

-- Pizzeria.productesDemanats definition

CREATE TABLE Pizzeria.productesDemanats (
	id_producteDemanat INT auto_increment NOT NULL,
	nomProducte varchar(20) NOT NULL,
	id_comanda INT auto_increment NOT NULL,
	quantitat TINYINT(10) NOT NULL,
	id_producte varchar(100) NULL,
	CONSTRAINT productesDemanats_pk PRIMARY KEY (id_producteDemanat),
	CONSTRAINT productesDemanats_comanda_FK FOREIGN KEY (id_comanda) REFERENCES Pizzeria.comanda(id_comanda),
	CONSTRAINT productesDemanats_tipusProducte_FK FOREIGN KEY (id_producte) REFERENCES Pizzeria.tipusProducte(id_producte)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS Pizzeria.productesDemanats;
CREATE INDEX productesDemanats_id_producte_IDX USING BTREE ON Pizzeria.productesDemanats (id_producteDemanat);

-- Pizzeria.tipusProducte definition

CREATE TABLE `tipusProducte` (
  `id_producte` int(11) NOT NULL AUTO_INCREMENT,
  `tipusProducte` varchar(100) NOT NULL,
  `descripcio` text DEFAULT NULL,
  `imatge.jpg` varchar(200) NOT NULL,
  `preu` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_producte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Pizzeria.ComandaDomicili definition

CREATE TABLE Pizzeria.ComandaDomicili (
	id_reparto INT auto_increment NOT NULL,
	id_repartidor INT auto_increment NOT NULL,
	`data` DATE NOT NULL,
	treballador_id varchar(100) NULL,
	CONSTRAINT ComandaDomicili_PK PRIMARY KEY (id_reparto),
	CONSTRAINT ComandaDomicili_treballador_FK FOREIGN KEY (treballador_id) REFERENCES Pizzeria.treballador(id_treballador)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS Pizzeria.ComandaDomicili;

-- Pizzeria.categoriaPizza definition

CREATE TABLE Pizzeria.categoriaPizza (
	id_categoria VARCHAR(15) NOT NULL,
	id_pizza INT auto_increment NOT NULL,
	nomPizza varchar(10) NOT NULL,
	CONSTRAINT categoriaPizza_pk_1 PRIMARY KEY (id_categoria)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS Pizzeria.categoriaPizza;
CREATE INDEX categoriaPizza_nomPizza_IDX USING BTREE ON Pizzeria.categoriaPizza (nomPizza);

-- Pizzeria.botiga definition

CREATE TABLE Pizzeria.botiga (
	id_botiga INT auto_increment NOT NULL,
	adreca varchar(100) NOT NULL,
	codiPostal TINYINT(5) NOT NULL,
	localitat_id varchar(100) NULL,
	provincia_id varchar(100) NULL,
	CONSTRAINT botiga_pk PRIMARY KEY (id_botiga),
	CONSTRAINT botiga_localitat_FK FOREIGN KEY (localitat_id) REFERENCES Pizzeria.localitat(id_localitat),
	CONSTRAINT botiga_provincia_FK FOREIGN KEY (provincia_id) REFERENCES Pizzeria.provincia(id_provincia)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS Pizzeria.botiga;

-- Pizzeria.treballador definition

CREATE TABLE Pizzeria.treballador (
	id_treballador INT auto_increment NOT NULL,
	nom varchar(15) NOT NULL,
	cognoms varchar(100) NOT NULL,
	nif varchar(15) NOT NULL,
	tlfn INT(12) NOT NULL,
	CONSTRAINT treballador_pk PRIMARY KEY (id_treballador)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS Pizzeria.treballador;
CREATE UNIQUE INDEX treballador_id_treballador_IDX USING BTREE ON Pizzeria.treballador (id_treballador);
CREATE UNIQUE INDEX treballador_nif_IDX USING BTREE ON Pizzeria.treballador (nif);












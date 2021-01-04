DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Maestro;
DROP TABLE IF EXISTS Attivita;
DROP TABLE IF EXISTS LezSci;
DROP TABLE IF EXISTS LezSnow;
DROP TABLE IF EXISTS CartaFedelta;
DROP TABLE IF EXISTS Sconto;
DROP TABLE IF EXISTS Noleggio;
DROP TABLE IF EXISTS Vendita;
DROP TABLE IF EXISTS NolSci;
DROP TABLE IF EXISTS NolSnow;
DROP TABLE IF EXISTS NolBiciclette;
DROP TABLE IF EXISTS NolPattini;
DROP TABLE IF EXISTS NolAltro;
DROP TABLE IF EXISTS NolScarponiSci;
DROP TABLE IF EXISTS NolBastoncini;
DROP TABLE IF EXISTS NolScarponiSnow;
DROP TABLE IF EXISTS Abbigliamento;
DROP TABLE IF EXISTS VenSci;
DROP TABLE IF EXISTS VenSnow;
DROP TABLE IF EXISTS VenBiciclette;
DROP TABLE IF EXISTS VenPattini;
DROP TABLE IF EXISTS VenAltro;
DROP TABLE IF EXISTS VenScarponiSci;
DROP TABLE IF EXISTS VenBastoncini;
DROP TABLE IF EXISTS VenScarponiSnow;
DROP TABLE IF EXISTS Fattura;
DROP TABLE IF EXISTS Scontrino;
DROP TABLE IF EXISTS Skipass;
DROP TABLE IF EXISTS Anagrafica;

CREATE TABLE Sconto 
(
	NomeSconto VARCHAR (30) NOT NULL,
	CognomeSconto VARCHAR (30) NOT NULL,
	PuntiAcc INT NOT NULL,
	CodiceSconto CHAR(20) PRIMARY KEY NOT NULL,
	FOREIGN KEY (CodiceSconto) REFERENCES Vendita(Sconto) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CartaFedelta
(
	NomeCarta VARCHAR (30) NOT NULL,
	CognomeCarta VARCHAR (30) NOT NULL,
	IDCarta CHAR (20) PRIMARY KEY NOT NULL,
	DataInizio DATE NOT NULL,
	FOREIGN KEY (NomeCarta) REFERENCES Sconto(NomeSconto) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CognomeCarta) REFERENCES Sconto(CognomeSconto) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Cliente(
	Nome VARCHAR (30) NOT NULL,
	Cognome VARCHAR (30) NOT NULL,
	CF CHAR (16) PRIMARY KEY NOT NULL,
	Livello VARCHAR(20) NOT NULL,
	Nazione VARCHAR (30) NOT NULL,
	DataNascita DATE NOT NULL,
	FOREIGN KEY (Nome) REFERENCES CartaFedelta(NomeCarta) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Cognome) REFERENCES CartaFedelta(CognomeCarta) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Maestro
(
	Nome VARCHAR (30) NOT NULL,
	Cognome VARCHAR (30) NOT NULL,
	CF CHAR (16) NOT NULL,
	Tessera INT NOT NULL,
	Disciplina VARCHAR (20) NOT NULL,
	LinguaTed ENUM ('SI', 'NO') NOT NULL,
	LinguaFra ENUM ('SI', 'NO') NOT NULL,
	PRIMARY KEY (CF, Tessera, Disciplina),
	FOREIGN KEY (Disciplina) REFERENCES Attivita(Tipologia) ON DELETE NO ACTION,
	FOREIGN KEY (Nome) REFERENCES Attivita(NomeMaestro) ON DELETE CASCADE,
	FOREIGN KEY (Cognome) REFERENCES Attivita(CognomeMaestro) ON DELETE CASCADE
);

CREATE TABLE Attivita 
(
	NomeMaestro VARCHAR (30) NOT NULL,
	CognomeMaestro VARCHAR (30) NOT NULL,
	NomeCliente VARCHAR (30) NOT NULL,
	CognomeCliente VARCHAR (30) NOT NULL,
	Tipologia VARCHAR (30) NOT NULL,
	NazioneCliente VARCHAR (30) NOT NULL,
	PRIMARY KEY (NomeMaestro,CognomeMaestro,NomeCliente,CognomeCliente),
	FOREIGN KEY (Tipologia) REFERENCES LezSci(TipologiaSci) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (NomeCliente) REFERENCES Cliente(Nome) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CognomeCliente) REFERENCES Cliente(Cognome) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (NazioneCliente) REFERENCES Cliente(Nazione) ON UPDATE CASCADE ON DELETE CASCADE
); 

CREATE TABLE LezSci
(
	NomeMaestro VARCHAR (30) NOT NULL,
	CognomeMaestro VARCHAR (30) NOT NULL,
	NomeCliente VARCHAR (30) NOT NULL,
	CognomeCliente VARCHAR (30) NOT NULL,
	TipologiaSci VARCHAR (30) NOT NULL,
	TipoCliente ENUM('Bambini', 'Adulti') NOT NULL,
	DataLez DATE NOT NULL,
	NumOre SMALLINT NOT NULL,
	Prezzo INT NOT NULL,
	PRIMARY KEY (NomeMaestro,CognomeMaestro,NomeCliente,CognomeCliente)
);

CREATE TABLE LezSnow
(
	NomeMaestro VARCHAR (30) NOT NULL,
	CognomeMaestro VARCHAR (30) NOT NULL,
	NomeCliente VARCHAR (30) NOT NULL,
	CognomeCliente VARCHAR (30) NOT NULL,
	TipologiaSnow VARCHAR (30) NOT NULL,
	TipoCliente ENUM('Bambini', 'Adulti') NOT NULL,
	DataLez DATE NOT NULL,
	NumOre SMALLINT NOT NULL,
	Prezzo INT NOT NULL,
	PRIMARY KEY (NomeMaestro,CognomeMaestro,NomeCliente,CognomeCliente)
);

CREATE TABLE Noleggio 
(
	NomeNol VARCHAR (30) NOT NULL,
	CognomeNol VARCHAR (30) NOT NULL,
	CartaIdentita VARCHAR (9) PRIMARY KEY NOT NULL,
	DataInizio DATE NOT NULL,
	DataFine DATE NOT NULL,
	IDNoleggio UNSIGNED NOT NULL,
	PrezzoTotale FLOAT NOT NULL
);

CREATE TABLE NolSci
(
	IDSci UNSIGNED PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Altezza INT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipologia ENUM ('Alpinismo', 'Discesa', 'Fondo', 'Telemark') NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDSci) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE NolSnow
(
	IDSnow UNSIGNED PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Altezza INT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDSnow) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE NolBiciclette
(
	IDBici UNSIGNED PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Misura ENUM('Bambino', 'Adulto') NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Tipologia ENUM('Elettrica', 'Non Elettrica') NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDBici) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE NolPattini
(
	IDPattini UNSIGNED PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia ENUM ('35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48') NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDPattini) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE NolAltro
(
	IDAltro UNSIGNED PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Tipologia ENUM ('Ciaspole', 'Slitte') NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDAltro) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE NolBastoncini
(
	IDBast UNSIGNED PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Altezza INT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipologia ENUM ('Alpinismo', 'Discesa', 'Fondo', 'Telemark') NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDBast) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE NolScarponiSci
(
	IDScarp UNSIGNED PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia ENUM ('35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48') NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipologia ENUM ('Alpinismo', 'Discesa', 'Fondo', 'Telemark') NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDScarp) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE NolScarponiSnow
(
	IDScarpSnow UNSIGNED PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia ENUM ('35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48') NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipologia ENUM ('Alpinismo', 'Discesa', 'Fondo', 'Telemark') NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDScarp) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Vendita
(
	NomeVen VARCHAR (30),
	CognomeVen VARCHAR (30),
	IDVendita UNSIGNED NOT NULL,
	PrezzoTotale FLOAT NOT NULL
);

CREATE TABLE Fattura
(
	PIVA INT NOT NULL,
	CF VARCHAR (16), 
	CodUnivoco UNSIGNED NOT NULL,
	PEC CHAR (100) NOT NULL,
	Nome VARCHAR (30) NOT NULL,
	Cognome VARCHAR (30) NOT NULL
	
);

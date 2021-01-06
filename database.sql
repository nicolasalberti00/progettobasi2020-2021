SET session_replication_role = 'replica';
DROP TABLE IF EXISTS Lezione;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Maestro;
DROP TABLE IF EXISTS Sconto;
DROP TABLE IF EXISTS CartaFedelta;
DROP TABLE IF EXISTS NolSci;
DROP TABLE IF EXISTS NolSnow;
DROP TABLE IF EXISTS NolBiciclette;
DROP TABLE IF EXISTS NolPattini;
DROP TABLE IF EXISTS NolAltro;
DROP TABLE IF EXISTS NolScarponiSci;
DROP TABLE IF EXISTS NolBastoncini;
DROP TABLE IF EXISTS NolScarponiSnow;
DROP TABLE IF EXISTS Noleggio;
DROP TABLE IF EXISTS VenSci;
DROP TABLE IF EXISTS VenSnow;
DROP TABLE IF EXISTS VenBiciclette;
DROP TABLE IF EXISTS VenPattini;
DROP TABLE IF EXISTS VenAltro;
DROP TABLE IF EXISTS VenScarponiSci;
DROP TABLE IF EXISTS VenBastoncini;
DROP TABLE IF EXISTS VenScarponiSnow;
DROP TABLE IF EXISTS Fattura;
DROP TABLE IF EXISTS Vendita;
DROP TABLE IF EXISTS Abbigliamento;
DROP TABLE IF EXISTS Scontrino;
DROP TABLE IF EXISTS Skipass;
DROP TYPE IF EXISTS Disciplina;
DROP TYPE IF EXISTS TipoBici;
DROP TYPE IF EXISTS Lingua;
DROP TYPE IF EXISTS TagliaScarpa;
DROP TYPE IF EXISTS TagliaMaglia;
DROP TYPE IF EXISTS TipoColore;
DROP TYPE IF EXISTS TipoAbbigliamento;
DROP TYPE IF EXISTS Persona;
DROP TYPE IF EXISTS TipoAltro;
DROP TYPE IF EXISTS TipoSkipass;

CREATE TYPE Disciplina AS ENUM ('Alpinismo', 'Discesa', 'Fondo', 'Snowboard', 'Telemark');

CREATE TYPE TipoBici AS ENUM ('Elettrica', 'Non elettrica');

CREATE TYPE Lingua AS ENUM ('SI', 'NO');

CREATE TYPE TagliaScarpa AS ENUM ('35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48');

CREATE TYPE TagliaMaglia AS ENUM ('XS', 'S', 'M', 'L', 'XL', 'U');

CREATE TYPE TipoColore AS ENUM ('Blu', 'Verde', 'Rosso', 'Nero', 'Arancione', 'Viola', 'Giallo', 'Rosa', 'Grigio', 'Azzurro', 'Bianco', 'Oro');

CREATE TYPE TipoAbbigliamento AS ENUM ('Giacche', 'Intimo Termico', 'Pantaloni', 'Copricapi', 'Accessori', 'Protezioni', 'Dispositivi di Sicurezza');

CREATE TYPE Persona AS ENUM ('Bambino', 'Adulto');

CREATE TYPE TipoAltro AS ENUM ('Ciaspole', 'Slitte');

CREATE TYPE TipoSkipass AS ENUM ('Ciaspole', 'Slitte');

CREATE TABLE Cliente(
	Nome VARCHAR (30) NOT NULL,
	Cognome VARCHAR (30) NOT NULL,
	CF VARCHAR (16) PRIMARY KEY NOT NULL,
	Livello VARCHAR(20) NOT NULL,
	Nazione VARCHAR (30) NOT NULL,
	DataNascita DATE NOT NULL
);

CREATE TABLE Vendita
(
	NomeVen VARCHAR (30) NOT NULL,
	CognomeVen VARCHAR (30) NOT NULL,
	IDVendita INT PRIMARY KEY NOT NULL,
	IDOggetto INT NOT NULL UNIQUE,
	Sconto VARCHAR (20) NOT NULL UNIQUE,
	PrezzoTotale FLOAT NOT NULL
);

CREATE TABLE CartaFedelta
(
	NomeCarta VARCHAR (30) NOT NULL,
	CognomeCarta VARCHAR (30) NOT NULL,
	IDCarta VARCHAR (20) PRIMARY KEY NOT NULL UNIQUE,
	DataInizio DATE NOT NULL
);

CREATE TABLE Sconto 
(
	IDCarta VARCHAR (20) NOT NULL,
	PuntiAcc INT NOT NULL,
	CodiceSconto VARCHAR(20) PRIMARY KEY NOT NULL,
	FOREIGN KEY (CodiceSconto) REFERENCES Vendita(Sconto) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (IDCarta) REFERENCES CartaFedelta(IDCarta)
);

CREATE TABLE Maestro
(
	Nome VARCHAR (30) NOT NULL,
	Cognome VARCHAR (30) NOT NULL,
	Tessera VARCHAR (3) NOT NULL,
	Tipologia Disciplina NOT NULL,
	LinguaTed Lingua NOT NULL,
	LinguaFra Lingua NOT NULL,
	PRIMARY KEY (Tessera)
);

CREATE TABLE Lezione
(
	TesseraMaestro VARCHAR(25) NOT NULL,
	CodiceCliente VARCHAR (16) NOT NULL,
	Tipologia Disciplina NOT NULL,
	TipoCliente Persona NOT NULL,
	NumOre SMALLINT NOT NULL,
	DataLez DATE NOT NULL,
	PRIMARY KEY (TesseraMaestro, CodiceCliente),
	FOREIGN KEY (CodiceCliente) REFERENCES Cliente(CF) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (TesseraMaestro) REFERENCES Maestro(Tessera) ON UPDATE CASCADE ON DELETE CASCADE
); 

CREATE TABLE Noleggio 
(
	NomeNol VARCHAR (30) NOT NULL,
	CognomeNol VARCHAR (30) NOT NULL,
	CartaIdentita VARCHAR (9) PRIMARY KEY NOT NULL,
	DataInizio DATE NOT NULL,
	DataFine DATE NOT NULL,
	ID INT NOT NULL,
	PrezzoTotale FLOAT NOT NULL,
	UNIQUE(ID)
);

CREATE TABLE NolSci
(
	IDSci INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Altezza INT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipo Disciplina NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDSci) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE NolSnow
(
	IDSnow INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Altezza INT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDSnow) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE NolBiciclette
(
	IDBici INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Misura Persona NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Tipologia TipoBici NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDBici) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE NolPattini
(
	IDPattini INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia TagliaScarpa NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDPattini) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE NolAltro
(
	IDAltro INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Tipologia TipoAltro NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDAltro) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE NolBastoncini
(
	IDBast INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Altezza VARCHAR (3) NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipologia Disciplina NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDBast) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE NolScarponiSci
(
	IDScarp INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia TagliaScarpa NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipologia Disciplina NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDScarp) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE NolScarponiSnow
(
	IDScarpSnow INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia TagliaScarpa NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDScarpSnow) REFERENCES Noleggio(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Fattura
(
	PIVA INT NOT NULL,
	CF VARCHAR (16), 
	CodUnivoco INT NOT NULL,
	PEC CHAR (100) NOT NULL,
	Nome VARCHAR (30) NOT NULL,
	Cognome VARCHAR (30) NOT NULL,
	Via VARCHAR (100) NOT NULL,
	NumeroCivico INT NOT NULL,
	Citta VARCHAR (100) NOT NULL,
	Provincia VARCHAR (2) NOT NULL,
	CAP INT NOT NULL,
	Stato VARCHAR (2) NOT NULL DEFAULT 'IT',
	NumFattura INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (NumFattura) REFERENCES Vendita(IDVendita)
);

CREATE TABLE Scontrino
(
	IDScontrino INT PRIMARY KEY NOT NULL,
	DataVen DATE NOT NULL,
	PrezzoScontrino FLOAT NOT NULL,
	Articolo VARCHAR (50) NOT NULL,
	Quantita INT NOT NULL
);

CREATE TABLE Skipass
(
	IDSkipass INT PRIMARY KEY NOT NULL,
	PrezzoBambini FLOAT NOT NULL,
	PrezzoAdulti FLOAT NOT NULL,
	Tipologia TipoSkipass NOT NULL
);

CREATE TABLE VenSci
(
	IDSci INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Altezza INT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipologia Disciplina NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDSci) REFERENCES Vendita(IDVendita) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE VenSnow
(
	IDSnow INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Altezza INT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDSnow) REFERENCES Vendita(IDVendita) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE VenBiciclette
(
	IDBici INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Misura Persona NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Tipologia TipoBici NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDBici) REFERENCES Vendita(IDVendita) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE VenPattini
(
	IDPattini INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia TagliaScarpa NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDPattini) REFERENCES Vendita(IDVendita) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE VenAltro
(
	IDAltro INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Tipologia TipoAltro NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDAltro) REFERENCES Vendita(IDVendita) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE VenBastoncini
(
	IDBast INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Altezza VARCHAR (3) NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipologia Disciplina NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDBast) REFERENCES Vendita(IDVendita) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE VenScarponiSci
(
	IDScarp INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia TagliaScarpa NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (25) NOT NULL,
	Tipologia Disciplina NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDScarp) REFERENCES Vendita(IDVendita) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE VenScarponiSnow
(
	IDScarpSnow INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia TagliaScarpa NOT NULL,
	Marca VARCHAR (20) NOT NULL,
	Modello VARCHAR (50) NOT NULL,
	Quantita SMALLINT NOT NULL,
	FOREIGN KEY (IDScarpSnow) REFERENCES Vendita(IDVendita) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Abbigliamento
(
	IDAbb INT PRIMARY KEY NOT NULL,
	Prezzo FLOAT NOT NULL,
	Taglia TagliaMaglia NOT NULL,
	Colore TipoColore NOT NULL,
	Modello VARCHAR (50) NOT NULL,
	Tipologia TipoAbbigliamento NOT NULL,
	Marca VARCHAR (25) NOT NULL,
	Quantita INT NOT NULL
	--FOREIGN KEY (IDAbb) REFERENCES Vendita(IDOggetto) ON UPDATE CASCADE ON DELETE NO ACTION
);

INSERT INTO Cliente(Nome, Cognome, DataNascita, CF, Livello, Nazione) VALUES
('Amedeo', 'Minghi', '1978-06-12', 'MNGMDA78H12F205G', 'Avanzato', 'ITA'),
('Davide', 'Zambelli', '1999-01-27', 'ZMBDVD99A27L378P', 'Intermedio', 'ITA'),
('Ermanno', 'Cervino', '1994-07-02', 'CRVRNN94L02F205J', 'Principiante', 'ITA'),
('Diana', 'Rossi', '1990-03-26', 'RSSDNI90C66L736G', 'Avanzato', 'ITA'),
('Rick', 'Astley', '1980-02-06', 'STLRCK80B06H501R', 'Avanzato', 'UK'),
('Tina', 'Turner', '1955-11-26', 'TRNTNI55S66H501N', 'Principiante', 'USA'),
('Joanna', 'Gaines', '1978-11-19', 'GNSJNN78S54H501X', 'Intermedio', 'USA'),
('Chip', 'Gaines', '1974-11-14', 'GNSCHP74S14H501H', 'Principiante', 'USA'),
('Franzl', 'Lang', '1960-12-28', 'LNGFNZ60T28A952H', 'Avanzato', 'DE'),
('Sabine', 'Petzl', '1965-08-09', 'PTZSBN65M49A952O', 'Intermedio', 'A'),
('Lev', 'Tolstoj', '1970-10-10', 'TLSLVE70R10L424Q', 'Principiante', 'RU'),
('Nancy', 'Greene', '1943-05-11', 'GRNNCY43E51F839M', 'Avanzato', 'CDN'),
('Federica', 'Pellegrini', '1988-08-05', 'PLLFRC88M45L781B', 'Intermedio', 'ITA'),
('Valeria', 'Alberti', '1984-05-09', 'LBRVLR84E49L840R', 'Avanzato', 'ITA'),
('Valeria', 'Golino', '2001-10-22', 'GLNVLR01R62D969E', 'Intermedio', 'ITA'),
('Furio', 'Zoccano', '2004-01-21', 'ZCCFRU04A21H501N', 'Principiante', 'ITA'),
('Charles', 'DeGaulle', '1975-03-30', 'DGLCRL75C30A326P', 'Intermedio', 'FR'),
('Ferenc', 'Molnar', '1978-01-12', 'MLNFNC78A12A271Q', 'Avanzato', 'H'),
('Greta', 'Thunberg', '2003-01-03', 'THNGRT03A43G388A', 'Intermedio', 'SE'),
('Ella', 'Gaines', '2007-12-13', 'GNSLLE07T53H501J', 'Intermedio', 'USA'),
('Aurelia', 'Polese', '2015-05-31', 'PLSRLA15E71H703V', 'Principiante', 'ITA'),
('Karola', 'Meyer', '2010-09-30', 'MYRKRL10P70A952R', 'Principiante', 'A'),
('Pietro', 'Eccher', '2008-04-20', 'CCHPTR08D20L378D', 'Principiante', 'ITA'),
('Giulia', 'Santini', '2007-02-08', 'SNTGLI07B48L378C', 'Intermedio', 'ITA');

INSERT INTO Maestro(Nome, Cognome, Tessera, Tipologia, LinguaTed, LinguaFra) VALUES
('Zeno', 'Colò', 'M01', 'Discesa', 'NO', 'SI'),
('Gustav', 'Thoni', 'M02', 'Discesa', 'SI', 'NO'),
('Piero', 'Gros', 'M04', 'Discesa', 'NO', 'SI'),
('Federica', 'Brignone', 'M05', 'Discesa', 'NO', 'SI'),
('Edwin', 'Coratti', 'M06', 'Snowboard', 'NO', 'NO'),
('Francesco', 'DeFabiani', 'M07', 'Fondo', 'NO', 'SI'),
('Maurilio', 'DeZolt', 'M08', 'Fondo', 'SI', 'NO'),
('Dorotea', 'Wierer', 'M09', 'Fondo', 'SI', 'NO'),
('Hanna', 'Oberg', 'M10', 'Fondo', 'NO', 'NO'),
('Amelie', 'Reymond', 'M11', 'Telemark', 'SI', 'SI'),
('Philippe', 'Lau', 'M12', 'Telemark', 'NO', 'SI'),
('Michela', 'Moioli', 'M13', 'Snowboard', 'SI', 'NO'),
('Omar', 'Visintin', 'M14', 'Snowboard', 'SI', 'NO'),
('Raffaella', 'Brutto', 'M15', 'Snowboard', 'NO', 'SI');

INSERT INTO CartaFedelta(NomeCarta, CognomeCarta, IDCarta, DataInizio) VALUES
('Davide', 'Zambelli', 'CF01', '2016-12-01'),
('Diana', 'Rossi', 'CF02', '2005-11-02'),
('Rick', 'Astley', 'CF03', '2010-12-03'),
('Joanna', 'Gaines', 'CF04', '2018-09-04'),
('Sabine', 'Petzl', 'CF05', '2007-12-05'),
('Nancy', 'Greene', 'CF06', '2000-01-06'),
('Federica', 'Pellegrini', 'CF07', '2006-02-07'),
('Valeria', 'Alberti', 'CF08', '2002-10-08'),
('Furio', 'Zoccano', 'CF09', '2004-01-09'),
('Giulia', 'Capuleti', 'CF10', '2016-12-10'),
('Michelangelo', 'Merisi', 'CF11', '2005-12-11'),
('Andrea', 'Vesalio', 'CF12', '2010-09-12'),
('Enrico', 'Brignano', 'CF13', '2007-08-13'),
('Richard', 'Meier', 'CF14', '2000-07-14'),
('Andrea', 'Palladio', 'CF15', '2006-08-15');

INSERT INTO Abbigliamento(Tipologia, Marca, Modello, Colore, Taglia, Prezzo, Quantita, IDAbb) VALUES
('Giacche', 'Kappa', '6cento612Fisi', 'Blu', 'XS', '450', '5', '0001'),
('Giacche', 'Kappa', '6cento612Fisi', 'Blu', 'S', '450', '5', '0002'),
('Giacche', 'Kappa', '6cento612Fisi', 'Blu', 'M', '450', '5', '0003'),
('Giacche', 'Kappa', '6cento612Fisi', 'Blu', 'L', '450', '5', '0004'),
('Giacche', 'Kappa', '6cento612Fisi', 'Blu', 'XL', '450', '5', '0005'),
('Giacche', 'CMP', 'Mondrian', 'Rosso', 'XS', '300', '5', '0006'),
('Giacche', 'CMP', 'Mondrian', 'Rosso', 'S', '300', '5', '0007'),
('Giacche', 'CMP', 'Mondrian', 'Rosso', 'M', '300', '5', '0008'),
('Giacche', 'CMP', 'Mondrian', 'Rosso', 'L', '300', '5', '0009'),
('Giacche', 'CMP', 'Mondrian', 'Rosso', 'XL', '300', '5', '0010'),
('Giacche', 'TNF', 'CoreFire', 'Viola', 'XS', '450', '5', '0011'),
('Giacche', 'TNF', 'CoreFire', 'Viola', 'S', '450', '5', '0012'),
('Giacche', 'TNF', 'CoreFire', 'Viola', 'M', '450', '5', '0013'),
('Giacche', 'TNF', 'CoreFire', 'Viola', 'L', '450', '5', '0014'),
('Giacche', 'TNF', 'CoreFire', 'Viola', 'XL', '450', '5', '0015'),
('Giacche', 'RH+', 'Saslong', 'Giallo', 'XS', '500', '5', '0016'),
('Giacche', 'RH+', 'Saslong', 'Giallo', 'S', '500', '5', '0017'),
('Giacche', 'RH+', 'Saslong', 'Giallo', 'M', '500', '5', '0018'),
('Giacche', 'RH+', 'Saslong', 'Giallo', 'L', '500', '5', '0019'),
('Giacche', 'RH+', 'Saslong', 'Giallo', 'XL', '500', '5', '0020'),
('Intimo Termico', 'XBionic', 'Energizer', 'Nero', 'U', '70', '10', '0101'),
('Intimo Termico', 'Sportful', 'Thermal', 'Nero', 'U', '40', '10', '0102'),
('Intimo Termico', 'Odlo', 'ActiveWarm', 'Nero', 'U', '60', '10', '0103'),
('Intimo Termico', 'Patagonia', 'RetroFleece', 'Azzurro', 'S', '180', '10', '0104'),
('Intimo Termico', 'Patagonia', 'RetroFleece', 'Azzurro', 'M', '180', '10', '0105'),
('Intimo Termico', 'Patagonia', 'RetroFleece', 'Azzurro', 'L', '180', '10', '0106'),
('Intimo Termico', 'CMP', 'KnitTech', 'Verde', 'S', '70', '10', '0107'),
('Intimo Termico', 'CMP', 'KnitTech', 'Verde', 'M', '70', '10', '0108'),
('Intimo Termico', 'CMP', 'KnitTech', 'Verde', 'L', '70', '10', '0109'),
('Pantaloni', 'Kappa', '6Cento622Fisi', 'Rosso', 'S', '250', '5', '0201'),
('Pantaloni', 'Kappa', '6Cento622Fisi', 'Rosso', 'M', '250', '5', '0202'),
('Pantaloni', 'Kappa', '6Cento622Fisi', 'Rosso', 'L', '250', '5', '0203'),
('Pantaloni', 'Montura', 'Vertigo', 'Blu', 'S', '130', '5', '0204'),
('Pantaloni', 'Montura', 'Vertigo', 'Blu', 'M', '130', '5', '0205'),
('Pantaloni', 'Montura', 'Vertigo', 'Blu', 'L', '130', '5', '0206'),
('Pantaloni', 'Karpos', 'Ramezza', 'Grigio', 'S', '130', '5', '0207'),
('Pantaloni', 'Karpos', 'Ramezza', 'Grigio', 'M', '130', '5', '0208'),
('Pantaloni', 'Karpos', 'Ramezza', 'Grigio', 'L', '130', '5', '0209'),
('Pantaloni', 'Colmar', 'CimAlp', 'Bianco', 'S', '60', '10', '0210'),
('Pantaloni', 'Colmar', 'CimAlp', 'Bianco', 'M', '60', '10', '0211'),
('Pantaloni', 'Colmar', 'CimAlp', 'Bianco', 'L', '60', '10', '0212'),
('Copricapi', 'Kappa', '6CentoBladeFisi', 'Verde', 'U', '20', '10', '0301'),
('Copricapi', 'Eisbar', 'Flag', 'Bianco', 'U', '30', '5', '0302'),
('Copricapi', 'Kappa', '6CentoFlockFisi', 'Blu', 'U', '30', '10', '0303'),
('Copricapi', 'Poc', 'Fornix', 'Bianco', 'S', '65', '10', '0304'),
('Copricapi', 'Poc', 'Fornix', 'Bianco', 'M', '65', '10', '0305'),
('Copricapi', 'Poc', 'Fornix', 'Bianco', 'L', '65', '10', '0306'),
('Copricapi', 'Uvex', 'Race+', 'Verde', 'S', '150', '5', '0307'),
('Copricapi', 'Uvex', 'Race+', 'Verde', 'M', '150', '5', '0308'),
('Copricapi', 'Uvex', 'Race+', 'Verde', 'L', '150', '5', '0309'),
('Accessori', 'Grivel', 'Rampon', 'Giallo', 'U', '160', '10', '0401'),
('Accessori', 'Ferrino', 'Ghette', 'Nero', 'U', '30', '10', '0402'),
('Accessori', 'Salice', 'Ita', 'Nero', 'U', '100', '5', '0403'),
('Accessori', 'Slokker', 'Tonale', 'Bianco', 'U', '80', '10', '0404'),
('Accessori', 'Level', 'WorldCup', 'Giallo', 'S', '160', '5', '0405'),
('Accessori', 'Level', 'WorldCup', 'Giallo', 'M', '160', '5', '0406'),
('Accessori', 'Level', 'WorldCup', 'Giallo', 'L', '160', '5', '0407'),
('Accessori', 'Reusch', 'RaceWarrior', 'Rosso', 'S', '100', '5', '0408'),
('Accessori', 'Reusch', 'RaceWarrior', 'Rosso', 'M', '100', '5', '0409'),
('Accessori', 'Reusch', 'RaceWarrior', 'Rosso', 'L', '100', '5', '0410'),
('Accessori', 'Millet', 'Ubic30L', 'Rosso', 'U', '100', '10', '0411'),
('Accessori', 'Cassin', 'Moschettone', 'Giallo', 'U', '8', '15', '0412'),
('Accessori', 'Camp', 'Spectrum8,9mm', 'Verde', 'U', '115', '5', '0413'),
('Protezioni', 'Dainese', 'SoftHex', 'Nero', 'S', '200', '5', '0501'),
('Protezioni', 'Dainese', 'SoftHex', 'Nero', 'M', '200', '5', '0502'),
('Protezioni', 'Dainese', 'SoftHex', 'Nero', 'L', '200', '5', '0503'),
('Protezioni', 'EnergiaPura', 'Kristoffersen', 'Blu', 'S', '130', '5', '0504'),
('Protezioni', 'EnergiaPura', 'Kristoffersen', 'Blu', 'M', '130', '5', '0505'),
('Protezioni', 'EnergiaPura', 'Kristoffersen', 'Blu', 'L', '130', '5', '0506'),
('Protezioni', 'Komperdell', 'Parastinchi', 'Verde', 'S', '90', '5', '0507'),
('Protezioni', 'Komperdell', 'Parastinchi', 'Verde', 'M', '90', '5', '0508'),
('Protezioni', 'Komperdell', 'Parastinchi', 'Verde', 'L', '90', '5', '0509'),
('Protezioni', 'Komperdell', 'ProteggiAvambracci', 'Verde', 'S', '70', '5', '0510'),
('Protezioni', 'Komperdell', 'ProteggiAvambracci', 'Verde', 'M', '70', '5', '0511'),
('Protezioni', 'Komperdell', 'ProteggiAvambracci', 'Verde', 'L', '70', '5', '0512'),
('Dispositivi di Sicurezza', 'Ortovox', 'ValangaPack', 'Blu', 'U', '250', '5', '0601'),
('Dispositivi di Sicurezza', 'Recco', 'RiflettoreRescue', 'Nero', 'U', '315', '5', '0602'),
('Dispositivi di Sicurezza', 'Arva', 'Localizzatore', 'Rosso', 'U', '280', '5', '0603'),
('Dispositivi di Sicurezza', 'Midland', 'WalkieTalkie', 'Nero', 'U', '50', '10', '0604'),
('Dispositivi di Sicurezza', 'Salewa', 'SurvivalBlanket', 'Oro', 'U', '5', '15', '0605');

INSERT INTO VenAltro (Tipologia, Marca, Prezzo, Quantita, IDAltro) VALUES
('Ciaspole', 'TSL', '200', '5', '0701'),
('Ciaspole', 'Alpidex', '100', '10', '0702'),
('Slitte', 'Biemme', '80', '10', '0801');

INSERT INTO VenBiciclette (Tipologia, Misura, Marca, Prezzo, Quantita, IDBici) VALUES
('Non elettrica', 'Adulto', 'Specialized', '750', '5', '0901'),
('Non elettrica', 'Bambino', 'Specialized', '400', '5', '0902'),
('Non elettrica', 'Adulto', 'Scott', '3000', '5', '0903'),
('Elettrica', 'Adulto', 'Bianchi', '5000', '3', '0904'),
('Elettrica', 'Adulto', 'FatBike', '2500', '3', '0905');

INSERT INTO VenPattini (Taglia, Prezzo, Quantita, IDPattini) VALUES
('35', '55', '2', '1001'),
('36', '55', '2', '1002'),
('37', '55', '2', '1003'),
('38', '55', '2', '1004'),
('39', '55', '2', '1005'),
('40', '55', '2', '1006'),
('41', '55', '2', '1007'),
('42', '55', '2', '1008'),
('43', '55', '2', '1009'),
('44', '55', '2', '1010'),
('45', '55', '2', '1011'),
('46', '55', '2', '1012'),
('47', '55', '2', '1013'),
('48', '55', '2', '1014');

INSERT INTO VenBastoncini (Tipologia, Marca, Modello, Altezza, Prezzo, Quantita, IDBast) VALUES
('Alpinismo', 'SkiTrab', 'Teleskopik', 'U', '50', '10', '1101'),
('Discesa', 'Atomic', 'WCSL', '100', '75', '10', '1102'),
('Discesa', 'Atomic', 'WCSL', '105', '75', '10', '1103'),
('Discesa', 'Atomic', 'WCSL', '110', '75', '10', '1104'),
('Discesa', 'Atomic', 'WCSL', '115', '75', '10', '1105'),
('Discesa', 'Atomic', 'WCSL', '120', '75', '10', '1106'),
('Discesa', 'Atomic', 'WCSL', '125', '75', '10', '1107'),
('Discesa', 'Atomic', 'WCSL', '130', '75', '10', '1108'),
('Discesa', 'Leki', 'WCGS', '100', '70', '10', '1109'),
('Discesa', 'Leki', 'WCGS', '105', '70', '10', '1110'),
('Discesa', 'Leki', 'WCGS', '110', '70', '10', '1111'),
('Discesa', 'Leki', 'WCGS', '115', '70', '10', '1112'),
('Discesa', 'Leki', 'WCGS', '120', '70', '10', '1113'),
('Discesa', 'Leki', 'WCGS', '125', '70', '10', '1114'),
('Discesa', 'Leki', 'WCGS', '130', '70', '10', '1115'),
('Fondo', 'Rossignol', 'Thunder', '100', '75', '10', '1116'),
('Fondo', 'Rossignol', 'Thunder', '105', '75', '10', '1117'),
('Fondo', 'Rossignol', 'Thunder', '110', '75', '10', '1118'),
('Fondo', 'Rossignol', 'Thunder', '115', '75', '10', '1119'),
('Fondo', 'Rossignol', 'Thunder', '120', '75', '10', '1120'),
('Fondo', 'Rossignol', 'Thunder', '125', '75', '10', '1121'),
('Fondo', 'Rossignol', 'Thunder', '130', '75', '10', '1122'),
('Fondo', 'Fischer', 'SpeedMax', '100', '100', '8', '1123'),
('Fondo', 'Fischer', 'SpeedMax', '105', '100', '8', '1124'),
('Fondo', 'Fischer', 'SpeedMax', '110', '100', '8', '1125'),
('Fondo', 'Fischer', 'SpeedMax', '115', '100', '8', '1126'),
('Fondo', 'Fischer', 'SpeedMax', '120', '100', '8', '1127'),
('Fondo', 'Fischer', 'SpeedMax', '125', '100', '8', '1128'),
('Fondo', 'Fischer', 'SpeedMax', '130', '100', '8', '1129'),
('Telemark', 'BlackCrows', 'Telescopicus', 'U', '60', '10', '1130');

INSERT INTO VenSci (Tipologia, Marca, Modello, Altezza, Prezzo, Quantita, IDSci) VALUES
('Alpinismo', 'SkiTrab', 'Powercup', '150', '630', '5', '1201'),
('Alpinismo', 'SkiTrab', 'Powercup', '155', '630', '5', '1202'),
('Alpinismo', 'SkiTrab', 'Powercup', '160', '630', '5', '1203'),
('Alpinismo', 'SkiTrab', 'Powercup', '165', '630', '5', '1204'),
('Alpinismo', 'SkiTrab', 'Powercup', '170', '630', '5', '1205'),
('Alpinismo', 'SkiTrab', 'Powercup', '175', '630', '5', '1206'),
('Alpinismo', 'SkiTrab', 'Powercup', '180', '630', '5', '1207'),
('Discesa', 'Atomic', 'RedsterGS', '150', '750', '5', '1208'),
('Discesa', 'Atomic', 'RedsterGS', '155', '750', '5', '1209'),
('Discesa', 'Atomic', 'RedsterGS', '160', '750', '5', '1210'),
('Discesa', 'Atomic', 'RedsterGS', '165', '750', '5', '1211'),
('Discesa', 'Atomic', 'RedsterGS', '170', '750', '5', '1212'),
('Discesa', 'Atomic', 'RedsterGS', '175', '750', '5', '1213'),
('Discesa', 'Atomic', 'RedsterGS', '180', '750', '5', '1214'),
('Discesa', 'Head', 'WCRebelsGSR', '150', '710', '5', '1215'),
('Discesa', 'Head', 'WCRebelsGSR', '155', '750', '5', '1216'),
('Discesa', 'Head', 'WCRebelsGSR', '160', '750', '5', '1217'),
('Discesa', 'Head', 'WCRebelsGSR', '165', '750', '5', '1218'),
('Discesa', 'Head', 'WCRebelsGSR', '170', '750', '5', '1219'),
('Discesa', 'Head', 'WCRebelsGSR', '175', '750', '5', '1220'),
('Discesa', 'Head', 'WCRebelsGSR', '180', '750', '5', '1221'),
('Discesa', 'Volkl', 'WCRacetigerSL', '115', '600', '10', '1222'),
('Discesa', 'Volkl', 'WCRacetigerSL', '120', '750', '10', '1223'),
('Discesa', 'Volkl', 'WCRacetigerSL', '125', '750', '10', '1224'),
('Discesa', 'Volkl', 'WCRacetigerSL', '130', '750', '10', '1225'),
('Discesa', 'Volkl', 'WCRacetigerSL', '135', '750', '10', '1226'),
('Discesa', 'Volkl', 'WCRacetigerSL', '140', '750', '10', '1227'),
('Discesa', 'Volkl', 'WCRacetigerSL', '145', '750', '10', '1228'),
('Fondo', 'Rossignol', 'X-IumSkate', '150', '300', '5', '1229'),
('Fondo', 'Rossignol', 'X-IumSkate', '155', '300', '5', '1230'),
('Fondo', 'Rossignol', 'X-IumSkate', '160', '300', '5', '1231'),
('Fondo', 'Rossignol', 'X-IumSkate', '165', '300', '5', '1232'),
('Fondo', 'Rossignol', 'X-IumSkate', '170', '300', '5', '1233'),
('Fondo', 'Rossignol', 'X-IumSkate', '175', '300', '5', '1234'),
('Fondo', 'Rossignol', 'X-IumSkate', '180', '300', '5', '1235'),
('Fondo', 'Rossignol', 'X-IumSkate', '185', '300', '5', '1236'),
('Fondo', 'Rossignol', 'X-IumSkate', '190', '300', '5', '1237'),
('Fondo', 'Rossignol', 'X-IumSkate', '195', '300', '5', '1238'),
('Fondo', 'Rossignol', 'X-IumSkate', '200', '300', '5', '1239'),
('Fondo', 'Rossignol', 'X-IumSkate', '205', '300', '5', '1240'),
('Fondo', 'Rossignol', 'X-IumSkate', '210', '300', '5', '1241'),
('Fondo', 'Fischer', 'CarbonliteGrip', '150', '300', '5', '1242'),
('Fondo', 'Fischer', 'CarbonliteGrip', '155', '300', '5', '1243'),
('Fondo', 'Fischer', 'CarbonliteGrip', '160', '300', '5', '1244'),
('Fondo', 'Fischer', 'CarbonliteGrip', '165', '300', '5', '1245'),
('Fondo', 'Fischer', 'CarbonliteGrip', '170', '300', '5', '1246'),
('Fondo', 'Fischer', 'CarbonliteGrip', '175', '300', '5', '1247'),
('Fondo', 'Fischer', 'CarbonliteGrip', '180', '300', '5', '1248'),
('Fondo', 'Fischer', 'CarbonliteGrip', '185', '300', '5', '1249'),
('Fondo', 'Fischer', 'CarbonliteGrip', '190', '300', '5', '1250'),
('Fondo', 'Fischer', 'CarbonliteGrip', '195', '300', '5', '1251'),
('Fondo', 'Fischer', 'CarbonliteGrip', '200', '300', '5', '1252'),
('Fondo', 'Fischer', 'CarbonliteGrip', '205', '300', '5', '1253'),
('Fondo', 'Fischer', 'CarbonliteGrip', '210', '300', '5', '1254'),
('Telemark', 'BlackCrows', 'Mantra', '160', '600', '5', '1255'),
('Telemark', 'BlackCrows', 'Mantra', '165', '600', '5', '1256'),
('Telemark', 'BlackCrows', 'Mantra', '170', '600', '5', '1257'),
('Telemark', 'BlackCrows', 'Mantra', '175', '600', '5', '1258'),
('Telemark', 'BlackCrows', 'Mantra', '180', '600', '5', '1259'),
('Telemark', 'BlackCrows', 'Mantra', '185', '600', '5', '1260'),
('Telemark', 'BlackCrows', 'Mantra', '190', '600', '5', '1261');

SET session_replication_role = 'origin';
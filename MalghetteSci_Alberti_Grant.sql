--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-01-06 15:36:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3230 (class 1262 OID 46376)
-- Name: ScuolaSci2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ScuolaSci2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United Kingdom.1252';


ALTER DATABASE "ScuolaSci2" OWNER TO postgres;

\connect "ScuolaSci2"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 649 (class 1247 OID 65599)
-- Name: disciplina; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.disciplina AS ENUM (
    'Alpinismo',
    'Discesa',
    'Fondo',
    'Snowboard',
    'Telemark'
);


ALTER TYPE public.disciplina OWNER TO postgres;

--
-- TOC entry 655 (class 1247 OID 65616)
-- Name: lingua; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.lingua AS ENUM (
    'SI',
    'NO'
);


ALTER TYPE public.lingua OWNER TO postgres;

--
-- TOC entry 670 (class 1247 OID 65708)
-- Name: persona; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.persona AS ENUM (
    'Bambino',
    'Adulto'
);


ALTER TYPE public.persona OWNER TO postgres;

--
-- TOC entry 661 (class 1247 OID 65652)
-- Name: tagliamaglia; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tagliamaglia AS ENUM (
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'U'
);


ALTER TYPE public.tagliamaglia OWNER TO postgres;

--
-- TOC entry 658 (class 1247 OID 65622)
-- Name: tagliascarpa; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tagliascarpa AS ENUM (
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48'
);


ALTER TYPE public.tagliascarpa OWNER TO postgres;

--
-- TOC entry 667 (class 1247 OID 65692)
-- Name: tipoabbigliamento; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipoabbigliamento AS ENUM (
    'Giacche',
    'Intimo Termico',
    'Pantaloni',
    'Copricapi',
    'Accessori',
    'Protezioni',
    'Dispositivi di Sicurezza'
);


ALTER TYPE public.tipoabbigliamento OWNER TO postgres;

--
-- TOC entry 673 (class 1247 OID 65714)
-- Name: tipoaltro; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipoaltro AS ENUM (
    'Ciaspole',
    'Slitte'
);


ALTER TYPE public.tipoaltro OWNER TO postgres;

--
-- TOC entry 652 (class 1247 OID 65610)
-- Name: tipobici; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipobici AS ENUM (
    'Elettrica',
    'Non elettrica'
);


ALTER TYPE public.tipobici OWNER TO postgres;

--
-- TOC entry 664 (class 1247 OID 65666)
-- Name: tipocolore; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipocolore AS ENUM (
    'Blu',
    'Verde',
    'Rosso',
    'Nero',
    'Arancione',
    'Viola',
    'Giallo',
    'Rosa',
    'Grigio',
    'Azzurro',
    'Bianco',
    'Oro'
);


ALTER TYPE public.tipocolore OWNER TO postgres;

--
-- TOC entry 676 (class 1247 OID 65720)
-- Name: tiposkipass; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tiposkipass AS ENUM (
    'Giornaliero',
    'Settimanale'
);


ALTER TYPE public.tiposkipass OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 65977)
-- Name: abbigliamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abbigliamento (
    idabb integer NOT NULL,
    prezzo double precision NOT NULL,
    taglia public.tagliamaglia NOT NULL,
    colore public.tipocolore NOT NULL,
    modello character varying(50) NOT NULL,
    tipologia public.tipoabbigliamento NOT NULL,
    marca character varying(25) NOT NULL,
    quantita integer NOT NULL
);


ALTER TABLE public.abbigliamento OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 65739)
-- Name: cartafedelta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cartafedelta (
    nomecarta character varying(30) NOT NULL,
    cognomecarta character varying(30) NOT NULL,
    idcarta character varying(20) NOT NULL,
    datainizio date NOT NULL
);


ALTER TABLE public.cartafedelta OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 65725)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    nome character varying(30) NOT NULL,
    cognome character varying(30) NOT NULL,
    cf character varying(16) NOT NULL,
    livello character varying(20) NOT NULL,
    nazione character varying(30) NOT NULL,
    datanascita date NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 65866)
-- Name: fattura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fattura (
    piva integer NOT NULL,
    cf character varying(16),
    codunivoco integer NOT NULL,
    pec character(100) NOT NULL,
    nome character varying(30) NOT NULL,
    cognome character varying(30) NOT NULL,
    via character varying(100) NOT NULL,
    numerocivico integer NOT NULL,
    citta character varying(100) NOT NULL,
    provincia character varying(2) NOT NULL,
    cap integer NOT NULL,
    stato character varying(2) DEFAULT 'IT'::character varying NOT NULL,
    numfattura integer NOT NULL
);


ALTER TABLE public.fattura OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 65764)
-- Name: lezione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lezione (
    tesseramaestro character varying(25) NOT NULL,
    codicecliente character varying(16) NOT NULL,
    codicelezione character varying(20) NOT NULL,
    tipologia public.disciplina NOT NULL,
    tipocliente public.persona NOT NULL,
    numore smallint NOT NULL,
    datalez date NOT NULL,
    prezzo double precision NOT NULL
);


ALTER TABLE public.lezione OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 65759)
-- Name: maestro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maestro (
    nome character varying(30) NOT NULL,
    cognome character varying(30) NOT NULL,
    tessera character varying(3) NOT NULL,
    tipologia public.disciplina NOT NULL,
    linguated public.lingua NOT NULL,
    linguafra public.lingua NOT NULL
);


ALTER TABLE public.maestro OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 65826)
-- Name: nolaltro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nolaltro (
    idaltro integer NOT NULL,
    prezzo double precision NOT NULL,
    marca character varying(20) NOT NULL,
    tipologia public.tipoaltro NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.nolaltro OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 65836)
-- Name: nolbastoncini; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nolbastoncini (
    idbast integer NOT NULL,
    prezzo double precision NOT NULL,
    altezza character varying(3) NOT NULL,
    marca character varying(20) NOT NULL,
    modello character varying(25) NOT NULL,
    tipologia public.disciplina NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.nolbastoncini OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 65806)
-- Name: nolbiciclette; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nolbiciclette (
    idbici integer NOT NULL,
    prezzo double precision NOT NULL,
    misura public.persona NOT NULL,
    marca character varying(20) NOT NULL,
    tipologia public.tipobici NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.nolbiciclette OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 65779)
-- Name: noleggio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.noleggio (
    nomenol character varying(30) NOT NULL,
    cognomenol character varying(30) NOT NULL,
    cartaidentita character varying(9) NOT NULL,
    datainizio date NOT NULL,
    datafine date NOT NULL,
    id integer NOT NULL,
    prezzo double precision NOT NULL
);


ALTER TABLE public.noleggio OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 65816)
-- Name: nolpattini; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nolpattini (
    idpattini integer NOT NULL,
    prezzo double precision NOT NULL,
    taglia public.tagliascarpa NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.nolpattini OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 65846)
-- Name: nolscarponisci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nolscarponisci (
    idscarp integer NOT NULL,
    prezzo double precision NOT NULL,
    taglia public.tagliascarpa,
    marca character varying(20) NOT NULL,
    modello character varying(25) NOT NULL,
    tipologia public.disciplina NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.nolscarponisci OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 65856)
-- Name: nolscarponisnow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nolscarponisnow (
    idscarpsnow integer NOT NULL,
    prezzo double precision NOT NULL,
    taglia public.tagliascarpa NOT NULL,
    marca character varying(20) NOT NULL,
    modello character varying(25) NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.nolscarponisnow OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 65786)
-- Name: nolsci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nolsci (
    idsci integer NOT NULL,
    prezzo double precision NOT NULL,
    altezza integer NOT NULL,
    marca character varying(20) NOT NULL,
    modello character varying(25) NOT NULL,
    tipologia public.disciplina NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.nolsci OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 65796)
-- Name: nolsnow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nolsnow (
    idsnow integer NOT NULL,
    prezzo double precision NOT NULL,
    altezza integer NOT NULL,
    marca character varying(20) NOT NULL,
    modello character varying(25) NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.nolsnow OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 65744)
-- Name: sconto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sconto (
    idcarta character varying(20) NOT NULL,
    puntiacc integer NOT NULL,
    codicesconto character varying(20)
);


ALTER TABLE public.sconto OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 65877)
-- Name: scontrino; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scontrino (
    idscontrino integer NOT NULL,
    dataven date NOT NULL,
    prezzoscontrino double precision NOT NULL,
    articolo character varying(50) NOT NULL,
    quantita integer NOT NULL
);


ALTER TABLE public.scontrino OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 65887)
-- Name: skipass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skipass (
    idskipass integer NOT NULL,
    prezzobambini double precision,
    prezzoadulti double precision,
    tipologia public.tiposkipass NOT NULL,
    dataskip date NOT NULL,
    quantita integer NOT NULL
);


ALTER TABLE public.skipass OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 65937)
-- Name: venaltro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venaltro (
    idaltro integer NOT NULL,
    prezzo double precision NOT NULL,
    marca character varying(20) NOT NULL,
    tipologia public.tipoaltro NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.venaltro OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 65947)
-- Name: venbastoncini; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venbastoncini (
    idbast integer NOT NULL,
    prezzo double precision NOT NULL,
    altezza character varying(3) NOT NULL,
    marca character varying(20) NOT NULL,
    modello character varying(25) NOT NULL,
    tipologia public.disciplina NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.venbastoncini OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 65917)
-- Name: venbiciclette; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venbiciclette (
    idbici integer NOT NULL,
    prezzo double precision NOT NULL,
    misura public.persona NOT NULL,
    marca character varying(20) NOT NULL,
    tipologia public.tipobici NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.venbiciclette OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 65730)
-- Name: vendita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendita (
    nomeven character varying(30),
    cognomeven character varying(30),
    idvendita integer NOT NULL,
    idoggetto integer,
    sconto character varying(20),
    prezzo double precision NOT NULL,
    quantita integer NOT NULL
);


ALTER TABLE public.vendita OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 65927)
-- Name: venpattini; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venpattini (
    idpattini integer NOT NULL,
    prezzo double precision NOT NULL,
    taglia public.tagliascarpa NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.venpattini OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 65957)
-- Name: venscarponisci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venscarponisci (
    idscarp integer NOT NULL,
    prezzo double precision NOT NULL,
    taglia public.tagliascarpa,
    marca character varying(20) NOT NULL,
    modello character varying(25) NOT NULL,
    tipologia public.disciplina NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.venscarponisci OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 65967)
-- Name: venscarponisnow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venscarponisnow (
    idscarpsnow integer NOT NULL,
    prezzo double precision NOT NULL,
    taglia public.tagliascarpa NOT NULL,
    marca character varying(20) NOT NULL,
    modello character varying(50) NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.venscarponisnow OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 65897)
-- Name: vensci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vensci (
    idsci integer NOT NULL,
    prezzo double precision NOT NULL,
    altezza integer NOT NULL,
    marca character varying(20) NOT NULL,
    modello character varying(25) NOT NULL,
    tipologia public.disciplina NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.vensci OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 65907)
-- Name: vensnow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vensnow (
    idsnow integer NOT NULL,
    prezzo double precision NOT NULL,
    altezza integer NOT NULL,
    marca character varying(20) NOT NULL,
    modello character varying(25) NOT NULL,
    quantita smallint NOT NULL
);


ALTER TABLE public.vensnow OWNER TO postgres;

--
-- TOC entry 3224 (class 0 OID 65977)
-- Dependencies: 226
-- Data for Name: abbigliamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.abbigliamento VALUES (1, 450, 'XS', 'Blu', '6cento612Fisi', 'Giacche', 'Kappa', 5);
INSERT INTO public.abbigliamento VALUES (2, 450, 'S', 'Blu', '6cento612Fisi', 'Giacche', 'Kappa', 5);
INSERT INTO public.abbigliamento VALUES (3, 450, 'M', 'Blu', '6cento612Fisi', 'Giacche', 'Kappa', 5);
INSERT INTO public.abbigliamento VALUES (4, 450, 'L', 'Blu', '6cento612Fisi', 'Giacche', 'Kappa', 5);
INSERT INTO public.abbigliamento VALUES (5, 450, 'XL', 'Blu', '6cento612Fisi', 'Giacche', 'Kappa', 5);
INSERT INTO public.abbigliamento VALUES (6, 300, 'XS', 'Rosso', 'Mondrian', 'Giacche', 'CMP', 5);
INSERT INTO public.abbigliamento VALUES (7, 300, 'S', 'Rosso', 'Mondrian', 'Giacche', 'CMP', 5);
INSERT INTO public.abbigliamento VALUES (8, 300, 'M', 'Rosso', 'Mondrian', 'Giacche', 'CMP', 5);
INSERT INTO public.abbigliamento VALUES (9, 300, 'L', 'Rosso', 'Mondrian', 'Giacche', 'CMP', 5);
INSERT INTO public.abbigliamento VALUES (10, 300, 'XL', 'Rosso', 'Mondrian', 'Giacche', 'CMP', 5);
INSERT INTO public.abbigliamento VALUES (11, 450, 'XS', 'Viola', 'CoreFire', 'Giacche', 'TNF', 5);
INSERT INTO public.abbigliamento VALUES (12, 450, 'S', 'Viola', 'CoreFire', 'Giacche', 'TNF', 5);
INSERT INTO public.abbigliamento VALUES (13, 450, 'M', 'Viola', 'CoreFire', 'Giacche', 'TNF', 5);
INSERT INTO public.abbigliamento VALUES (14, 450, 'L', 'Viola', 'CoreFire', 'Giacche', 'TNF', 5);
INSERT INTO public.abbigliamento VALUES (15, 450, 'XL', 'Viola', 'CoreFire', 'Giacche', 'TNF', 5);
INSERT INTO public.abbigliamento VALUES (16, 500, 'XS', 'Giallo', 'Saslong', 'Giacche', 'RH+', 5);
INSERT INTO public.abbigliamento VALUES (17, 500, 'S', 'Giallo', 'Saslong', 'Giacche', 'RH+', 5);
INSERT INTO public.abbigliamento VALUES (18, 500, 'M', 'Giallo', 'Saslong', 'Giacche', 'RH+', 5);
INSERT INTO public.abbigliamento VALUES (19, 500, 'L', 'Giallo', 'Saslong', 'Giacche', 'RH+', 5);
INSERT INTO public.abbigliamento VALUES (20, 500, 'XL', 'Giallo', 'Saslong', 'Giacche', 'RH+', 5);
INSERT INTO public.abbigliamento VALUES (101, 70, 'U', 'Nero', 'Energizer', 'Intimo Termico', 'XBionic', 10);
INSERT INTO public.abbigliamento VALUES (102, 40, 'U', 'Nero', 'Thermal', 'Intimo Termico', 'Sportful', 10);
INSERT INTO public.abbigliamento VALUES (103, 60, 'U', 'Nero', 'ActiveWarm', 'Intimo Termico', 'Odlo', 10);
INSERT INTO public.abbigliamento VALUES (104, 180, 'S', 'Azzurro', 'RetroFleece', 'Intimo Termico', 'Patagonia', 10);
INSERT INTO public.abbigliamento VALUES (105, 180, 'M', 'Azzurro', 'RetroFleece', 'Intimo Termico', 'Patagonia', 10);
INSERT INTO public.abbigliamento VALUES (106, 180, 'L', 'Azzurro', 'RetroFleece', 'Intimo Termico', 'Patagonia', 10);
INSERT INTO public.abbigliamento VALUES (107, 70, 'S', 'Verde', 'KnitTech', 'Intimo Termico', 'CMP', 10);
INSERT INTO public.abbigliamento VALUES (108, 70, 'M', 'Verde', 'KnitTech', 'Intimo Termico', 'CMP', 10);
INSERT INTO public.abbigliamento VALUES (109, 70, 'L', 'Verde', 'KnitTech', 'Intimo Termico', 'CMP', 10);
INSERT INTO public.abbigliamento VALUES (201, 250, 'S', 'Rosso', '6Cento622Fisi', 'Pantaloni', 'Kappa', 5);
INSERT INTO public.abbigliamento VALUES (202, 250, 'M', 'Rosso', '6Cento622Fisi', 'Pantaloni', 'Kappa', 5);
INSERT INTO public.abbigliamento VALUES (203, 250, 'L', 'Rosso', '6Cento622Fisi', 'Pantaloni', 'Kappa', 5);
INSERT INTO public.abbigliamento VALUES (204, 130, 'S', 'Blu', 'Vertigo', 'Pantaloni', 'Montura', 5);
INSERT INTO public.abbigliamento VALUES (205, 130, 'M', 'Blu', 'Vertigo', 'Pantaloni', 'Montura', 5);
INSERT INTO public.abbigliamento VALUES (206, 130, 'L', 'Blu', 'Vertigo', 'Pantaloni', 'Montura', 5);
INSERT INTO public.abbigliamento VALUES (207, 130, 'S', 'Grigio', 'Ramezza', 'Pantaloni', 'Karpos', 5);
INSERT INTO public.abbigliamento VALUES (208, 130, 'M', 'Grigio', 'Ramezza', 'Pantaloni', 'Karpos', 5);
INSERT INTO public.abbigliamento VALUES (209, 130, 'L', 'Grigio', 'Ramezza', 'Pantaloni', 'Karpos', 5);
INSERT INTO public.abbigliamento VALUES (210, 60, 'S', 'Bianco', 'CimAlp', 'Pantaloni', 'Colmar', 10);
INSERT INTO public.abbigliamento VALUES (211, 60, 'M', 'Bianco', 'CimAlp', 'Pantaloni', 'Colmar', 10);
INSERT INTO public.abbigliamento VALUES (212, 60, 'L', 'Bianco', 'CimAlp', 'Pantaloni', 'Colmar', 10);
INSERT INTO public.abbigliamento VALUES (301, 20, 'U', 'Verde', '6CentoBladeFisi', 'Copricapi', 'Kappa', 10);
INSERT INTO public.abbigliamento VALUES (302, 30, 'U', 'Bianco', 'Flag', 'Copricapi', 'Eisbar', 5);
INSERT INTO public.abbigliamento VALUES (303, 30, 'U', 'Blu', '6CentoFlockFisi', 'Copricapi', 'Kappa', 10);
INSERT INTO public.abbigliamento VALUES (304, 65, 'S', 'Bianco', 'Fornix', 'Copricapi', 'Poc', 10);
INSERT INTO public.abbigliamento VALUES (305, 65, 'M', 'Bianco', 'Fornix', 'Copricapi', 'Poc', 10);
INSERT INTO public.abbigliamento VALUES (306, 65, 'L', 'Bianco', 'Fornix', 'Copricapi', 'Poc', 10);
INSERT INTO public.abbigliamento VALUES (307, 150, 'S', 'Verde', 'Race+', 'Copricapi', 'Uvex', 5);
INSERT INTO public.abbigliamento VALUES (308, 150, 'M', 'Verde', 'Race+', 'Copricapi', 'Uvex', 5);
INSERT INTO public.abbigliamento VALUES (309, 150, 'L', 'Verde', 'Race+', 'Copricapi', 'Uvex', 5);
INSERT INTO public.abbigliamento VALUES (401, 160, 'U', 'Giallo', 'Rampon', 'Accessori', 'Grivel', 10);
INSERT INTO public.abbigliamento VALUES (402, 30, 'U', 'Nero', 'Ghette', 'Accessori', 'Ferrino', 10);
INSERT INTO public.abbigliamento VALUES (403, 100, 'U', 'Nero', 'Ita', 'Accessori', 'Salice', 5);
INSERT INTO public.abbigliamento VALUES (404, 80, 'U', 'Bianco', 'Tonale', 'Accessori', 'Slokker', 10);
INSERT INTO public.abbigliamento VALUES (405, 160, 'S', 'Giallo', 'WorldCup', 'Accessori', 'Level', 5);
INSERT INTO public.abbigliamento VALUES (406, 160, 'M', 'Giallo', 'WorldCup', 'Accessori', 'Level', 5);
INSERT INTO public.abbigliamento VALUES (407, 160, 'L', 'Giallo', 'WorldCup', 'Accessori', 'Level', 5);
INSERT INTO public.abbigliamento VALUES (408, 100, 'S', 'Rosso', 'RaceWarrior', 'Accessori', 'Reusch', 5);
INSERT INTO public.abbigliamento VALUES (409, 100, 'M', 'Rosso', 'RaceWarrior', 'Accessori', 'Reusch', 5);
INSERT INTO public.abbigliamento VALUES (410, 100, 'L', 'Rosso', 'RaceWarrior', 'Accessori', 'Reusch', 5);
INSERT INTO public.abbigliamento VALUES (411, 100, 'U', 'Rosso', 'Ubic30L', 'Accessori', 'Millet', 10);
INSERT INTO public.abbigliamento VALUES (412, 8, 'U', 'Giallo', 'Moschettone', 'Accessori', 'Cassin', 15);
INSERT INTO public.abbigliamento VALUES (413, 115, 'U', 'Verde', 'Spectrum8,9mm', 'Accessori', 'Camp', 5);
INSERT INTO public.abbigliamento VALUES (414, 15, 'U', 'Arancione', 'Chute500ML', 'Accessori', 'Camelbak', 10);
INSERT INTO public.abbigliamento VALUES (415, 220, 'U', 'Nero', 'ProTrek', 'Accessori', 'Casio', 10);
INSERT INTO public.abbigliamento VALUES (416, 190, 'U', 'Rosa', 'SummitSaccoaPelo', 'Accessori', 'Camp', 10);
INSERT INTO public.abbigliamento VALUES (501, 200, 'S', 'Nero', 'SoftHex', 'Protezioni', 'Dainese', 5);
INSERT INTO public.abbigliamento VALUES (502, 200, 'M', 'Nero', 'SoftHex', 'Protezioni', 'Dainese', 5);
INSERT INTO public.abbigliamento VALUES (503, 200, 'L', 'Nero', 'SoftHex', 'Protezioni', 'Dainese', 5);
INSERT INTO public.abbigliamento VALUES (504, 130, 'S', 'Blu', 'Kristoffersen', 'Protezioni', 'EnergiaPura', 5);
INSERT INTO public.abbigliamento VALUES (505, 130, 'M', 'Blu', 'Kristoffersen', 'Protezioni', 'EnergiaPura', 5);
INSERT INTO public.abbigliamento VALUES (506, 130, 'L', 'Blu', 'Kristoffersen', 'Protezioni', 'EnergiaPura', 5);
INSERT INTO public.abbigliamento VALUES (507, 90, 'S', 'Verde', 'Parastinchi', 'Protezioni', 'Komperdell', 5);
INSERT INTO public.abbigliamento VALUES (508, 90, 'M', 'Verde', 'Parastinchi', 'Protezioni', 'Komperdell', 5);
INSERT INTO public.abbigliamento VALUES (509, 90, 'L', 'Verde', 'Parastinchi', 'Protezioni', 'Komperdell', 5);
INSERT INTO public.abbigliamento VALUES (510, 70, 'S', 'Verde', 'ProteggiAvambracci', 'Protezioni', 'Komperdell', 5);
INSERT INTO public.abbigliamento VALUES (511, 70, 'M', 'Verde', 'ProteggiAvambracci', 'Protezioni', 'Komperdell', 5);
INSERT INTO public.abbigliamento VALUES (512, 70, 'L', 'Verde', 'ProteggiAvambracci', 'Protezioni', 'Komperdell', 5);
INSERT INTO public.abbigliamento VALUES (601, 250, 'U', 'Blu', 'ValangaPack', 'Dispositivi di Sicurezza', 'Ortovox', 5);
INSERT INTO public.abbigliamento VALUES (602, 315, 'U', 'Nero', 'RiflettoreRescue', 'Dispositivi di Sicurezza', 'Recco', 5);
INSERT INTO public.abbigliamento VALUES (603, 280, 'U', 'Rosso', 'Localizzatore', 'Dispositivi di Sicurezza', 'Arva', 5);
INSERT INTO public.abbigliamento VALUES (604, 50, 'U', 'Nero', 'WalkieTalkie', 'Dispositivi di Sicurezza', 'Midland', 10);
INSERT INTO public.abbigliamento VALUES (605, 5, 'U', 'Oro', 'SurvivalBlanket', 'Dispositivi di Sicurezza', 'Salewa', 15);


--
-- TOC entry 3200 (class 0 OID 65739)
-- Dependencies: 202
-- Data for Name: cartafedelta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cartafedelta VALUES ('Davide', 'Zambelli', 'CF01', '2016-12-01');
INSERT INTO public.cartafedelta VALUES ('Diana', 'Rossi', 'CF02', '2005-11-02');
INSERT INTO public.cartafedelta VALUES ('Rick', 'Astley', 'CF03', '2010-12-03');
INSERT INTO public.cartafedelta VALUES ('Joanna', 'Gaines', 'CF04', '2018-09-04');
INSERT INTO public.cartafedelta VALUES ('Sabine', 'Petzl', 'CF05', '2007-12-05');
INSERT INTO public.cartafedelta VALUES ('Nancy', 'Greene', 'CF06', '2000-01-06');
INSERT INTO public.cartafedelta VALUES ('Federica', 'Pellegrini', 'CF07', '2006-02-07');
INSERT INTO public.cartafedelta VALUES ('Valeria', 'Alberti', 'CF08', '2002-10-08');
INSERT INTO public.cartafedelta VALUES ('Furio', 'Zoccano', 'CF09', '2004-01-09');
INSERT INTO public.cartafedelta VALUES ('Giulia', 'Capuleti', 'CF10', '2016-12-10');
INSERT INTO public.cartafedelta VALUES ('Michelangelo', 'Merisi', 'CF11', '2005-12-11');
INSERT INTO public.cartafedelta VALUES ('Andrea', 'Vesalio', 'CF12', '2010-09-12');
INSERT INTO public.cartafedelta VALUES ('Enrico', 'Brignano', 'CF13', '2007-08-13');
INSERT INTO public.cartafedelta VALUES ('Richard', 'Meier', 'CF14', '2000-07-14');
INSERT INTO public.cartafedelta VALUES ('Andrea', 'Palladio', 'CF15', '2006-08-15');


--
-- TOC entry 3198 (class 0 OID 65725)
-- Dependencies: 200
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES ('Amedeo', 'Minghi', 'MNGMDA78H12F205G', 'Avanzato', 'ITA', '1978-06-12');
INSERT INTO public.cliente VALUES ('Davide', 'Zambelli', 'ZMBDVD99A27L378P', 'Intermedio', 'ITA', '1999-01-27');
INSERT INTO public.cliente VALUES ('Ermanno', 'Cervino', 'CRVRNN94L02F205J', 'Principiante', 'ITA', '1994-07-02');
INSERT INTO public.cliente VALUES ('Diana', 'Rossi', 'RSSDNI90C66L736G', 'Avanzato', 'ITA', '1990-03-26');
INSERT INTO public.cliente VALUES ('Rick', 'Astley', 'STLRCK80B06H501R', 'Avanzato', 'UK', '1980-02-06');
INSERT INTO public.cliente VALUES ('Tina', 'Turner', 'TRNTNI55S66H501N', 'Principiante', 'USA', '1955-11-26');
INSERT INTO public.cliente VALUES ('Joanna', 'Gaines', 'GNSJNN78S54H501X', 'Intermedio', 'USA', '1978-11-19');
INSERT INTO public.cliente VALUES ('Chip', 'Gaines', 'GNSCHP74S14H501H', 'Principiante', 'USA', '1974-11-14');
INSERT INTO public.cliente VALUES ('Franzl', 'Lang', 'LNGFNZ60T28A952H', 'Avanzato', 'DE', '1960-12-28');
INSERT INTO public.cliente VALUES ('Sabine', 'Petzl', 'PTZSBN65M49A952O', 'Intermedio', 'A', '1965-08-09');
INSERT INTO public.cliente VALUES ('Lev', 'Tolstoj', 'TLSLVE70R10L424Q', 'Principiante', 'RU', '1970-10-10');
INSERT INTO public.cliente VALUES ('Nancy', 'Greene', 'GRNNCY43E51F839M', 'Avanzato', 'CDN', '1943-05-11');
INSERT INTO public.cliente VALUES ('Federica', 'Pellegrini', 'PLLFRC88M45L781B', 'Intermedio', 'ITA', '1988-08-05');
INSERT INTO public.cliente VALUES ('Valeria', 'Alberti', 'LBRVLR84E49L840R', 'Avanzato', 'ITA', '1984-05-09');
INSERT INTO public.cliente VALUES ('Valeria', 'Golino', 'GLNVLR01R62D969E', 'Intermedio', 'ITA', '2001-10-22');
INSERT INTO public.cliente VALUES ('Furio', 'Zoccano', 'ZCCFRU04A21H501N', 'Principiante', 'ITA', '2004-01-21');
INSERT INTO public.cliente VALUES ('Charles', 'DeGaulle', 'DGLCRL75C30A326P', 'Intermedio', 'FR', '1975-03-30');
INSERT INTO public.cliente VALUES ('Ferenc', 'Molnar', 'MLNFNC78A12A271Q', 'Avanzato', 'H', '1978-01-12');
INSERT INTO public.cliente VALUES ('Greta', 'Thunberg', 'THNGRT03A43G388A', 'Intermedio', 'SE', '2003-01-03');
INSERT INTO public.cliente VALUES ('Ella', 'Gaines', 'GNSLLE07T53H501J', 'Intermedio', 'USA', '2007-12-13');
INSERT INTO public.cliente VALUES ('Aurelia', 'Polese', 'PLSRLA15E71H703V', 'Principiante', 'ITA', '2015-05-31');
INSERT INTO public.cliente VALUES ('Karola', 'Meyer', 'MYRKRL10P70A952R', 'Principiante', 'A', '2010-09-30');
INSERT INTO public.cliente VALUES ('Pietro', 'Eccher', 'CCHPTR08D20L378D', 'Principiante', 'ITA', '2008-04-20');
INSERT INTO public.cliente VALUES ('Giulia', 'Santini', 'SNTGLI07B48L378C', 'Intermedio', 'ITA', '2007-02-08');


--
-- TOC entry 3213 (class 0 OID 65866)
-- Dependencies: 215
-- Data for Name: fattura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fattura VALUES (1, 'PDRCRL70H06F839C', 10, 'carlo.pedersoli@pecattori.it                                                                        ', 'Carlo', 'Pedersoli', 'Nazionale', 80, 'Napoli', 'NA', 1, 'IT', 100);
INSERT INTO public.fattura VALUES (2, 'SPGVNI80L48H703M', 20, 'ivana.spagna@pecmicrofono.it                                                                        ', 'Ivana', 'Spagna', 'Madrid', 40, 'Salerno', 'SA', 2, 'IT', 200);
INSERT INTO public.fattura VALUES (3, 'CPTGVI44C15H501G', 30, 'giove.capitolino@pecmusei.it                                                                        ', 'Giove', 'Capitolino', 'Tempio', 18, 'Roma', 'RM', 3, 'IT', 300);
INSERT INTO public.fattura VALUES (4, 'CRVRNN94L02F205J', 40, 'ermanno.cervino@pecmoda.it                                                                          ', 'Ermanno', 'Cervino', 'Monte', 33, 'Cortina', 'BL', 4, 'IT', 400);
INSERT INTO public.fattura VALUES (5, 'ZCCFRU04A21H501N', 50, 'furio.zoccano@pecmagda.it                                                                           ', 'Furio', 'Zoccano', 'Tevere', 52, 'Roma', 'RM', 5, 'IT', 500);
INSERT INTO public.fattura VALUES (6, 'PLLFRC88M45L781B', 60, 'federica.pellegrini@pecpodio.it                                                                     ', 'Federica', 'Pellegrini', 'Olimpia', 11, 'Mestre', 'VE', 6, 'IT', 600);
INSERT INTO public.fattura VALUES (7, 'PTZSBN65M49A952O', 70, 'sabine.petzl@pecpolitik.de                                                                          ', 'Sabine', 'Petzl', 'Brot', 22, 'Vienna', 'A', 7, 'A', 700);
INSERT INTO public.fattura VALUES (8, 'GNSJNN78S54H501X', 80, 'joanna.gaines@pecsilos.us                                                                           ', 'Joanna', 'Gaines', 'Magnolia', 4, 'Waco', 'TX', 8, 'US', 800);


--
-- TOC entry 3203 (class 0 OID 65764)
-- Dependencies: 205
-- Data for Name: lezione; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lezione VALUES ('M04', 'CRVRNN94L02F205J', 'A', 'Discesa', 'Adulto', 5, '2018-12-22', 125);
INSERT INTO public.lezione VALUES ('M05', 'GNSLLE07T53H501J', 'B', 'Discesa', 'Bambino', 5, '2019-12-26', 100);
INSERT INTO public.lezione VALUES ('M05', 'GNSLLE07T53H501J', 'C', 'Discesa', 'Bambino', 5, '2019-12-27', 100);
INSERT INTO public.lezione VALUES ('M05', 'SNTGLI07B48L378C', 'D', 'Discesa', 'Bambino', 3, '2019-12-28', 60);
INSERT INTO public.lezione VALUES ('M05', 'SNTGLI07B48L378C', 'E', 'Discesa', 'Bambino', 3, '2019-12-29', 60);
INSERT INTO public.lezione VALUES ('M02', 'ZMBDVD99A27L378P', 'F', 'Discesa', 'Adulto', 8, '2020-01-08', 200);
INSERT INTO public.lezione VALUES ('M06', 'GNSCHP74S14H501H', 'G', 'Snowboard', 'Adulto', 3, '2019-12-26', 75);
INSERT INTO public.lezione VALUES ('M06', 'GNSCHP74S14H501H', 'H', 'Snowboard', 'Adulto', 3, '2019-12-27', 75);
INSERT INTO public.lezione VALUES ('M06', 'GNSCHP74S14H501H', 'I', 'Snowboard', 'Adulto', 3, '2019-12-28', 75);
INSERT INTO public.lezione VALUES ('M01', 'GNSCHP74S14H501H', 'L', 'Discesa', 'Adulto', 4, '2020-01-04', 100);
INSERT INTO public.lezione VALUES ('M13', 'MYRKRL10P70A952R', 'M', 'Snowboard', 'Bambino', 6, '2019-12-20', 120);
INSERT INTO public.lezione VALUES ('M08', 'LNGFNZ60T28A952H', 'N', 'Fondo', 'Adulto', 4, '2018-01-04', 100);
INSERT INTO public.lezione VALUES ('M08', 'LNGFNZ60T28A952H', 'O', 'Fondo', 'Adulto', 2, '2018-01-05', 50);
INSERT INTO public.lezione VALUES ('M09', 'GRNNCY43E51F839M', 'P', 'Fondo', 'Adulto', 4, '2019-01-06', 100);
INSERT INTO public.lezione VALUES ('M12', 'DGLCRL75C30A326P', 'Q', 'Telemark', 'Adulto', 2, '2018-01-04', 50);
INSERT INTO public.lezione VALUES ('M12', 'DGLCRL75C30A326P', 'R', 'Telemark', 'Adulto', 2, '2018-01-05', 50);
INSERT INTO public.lezione VALUES ('M12', 'DGLCRL75C30A326P', 'S', 'Telemark', 'Adulto', 2, '2018-01-06', 50);
INSERT INTO public.lezione VALUES ('M16', 'MLNFNC78A12A271Q', 'T', 'Alpinismo', 'Adulto', 4, '2020-01-10', 100);


--
-- TOC entry 3202 (class 0 OID 65759)
-- Dependencies: 204
-- Data for Name: maestro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.maestro VALUES ('Zeno', 'Colò', 'M01', 'Discesa', 'NO', 'SI');
INSERT INTO public.maestro VALUES ('Gustav', 'Thoni', 'M02', 'Discesa', 'SI', 'NO');
INSERT INTO public.maestro VALUES ('Piero', 'Gros', 'M04', 'Discesa', 'NO', 'SI');
INSERT INTO public.maestro VALUES ('Federica', 'Brignone', 'M05', 'Discesa', 'NO', 'SI');
INSERT INTO public.maestro VALUES ('Edwin', 'Coratti', 'M06', 'Snowboard', 'NO', 'NO');
INSERT INTO public.maestro VALUES ('Francesco', 'DeFabiani', 'M07', 'Fondo', 'NO', 'SI');
INSERT INTO public.maestro VALUES ('Maurilio', 'DeZolt', 'M08', 'Fondo', 'SI', 'NO');
INSERT INTO public.maestro VALUES ('Dorotea', 'Wierer', 'M09', 'Fondo', 'SI', 'NO');
INSERT INTO public.maestro VALUES ('Hanna', 'Oberg', 'M10', 'Fondo', 'NO', 'NO');
INSERT INTO public.maestro VALUES ('Amelie', 'Reymond', 'M11', 'Telemark', 'SI', 'SI');
INSERT INTO public.maestro VALUES ('Philippe', 'Lau', 'M12', 'Telemark', 'NO', 'SI');
INSERT INTO public.maestro VALUES ('Michela', 'Moioli', 'M13', 'Snowboard', 'SI', 'NO');
INSERT INTO public.maestro VALUES ('Omar', 'Visintin', 'M14', 'Snowboard', 'SI', 'NO');
INSERT INTO public.maestro VALUES ('Raffaella', 'Brutto', 'M15', 'Snowboard', 'NO', 'SI');
INSERT INTO public.maestro VALUES ('Davide', 'Magnini', 'M16', 'Alpinismo', 'SI', 'SI');


--
-- TOC entry 3209 (class 0 OID 65826)
-- Dependencies: 211
-- Data for Name: nolaltro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nolaltro VALUES (701, 100, 'TSL', 'Ciaspole', 5);
INSERT INTO public.nolaltro VALUES (702, 80, 'Alpidex', 'Ciaspole', 10);
INSERT INTO public.nolaltro VALUES (801, 50, 'Biemme', 'Slitte', 10);


--
-- TOC entry 3210 (class 0 OID 65836)
-- Dependencies: 212
-- Data for Name: nolbastoncini; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nolbastoncini VALUES (1101, 15, 'U', 'SkiTrab', 'Teleskopik', 'Alpinismo', 10);
INSERT INTO public.nolbastoncini VALUES (1102, 10, '100', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1103, 10, '105', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1104, 10, '110', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1105, 10, '115', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1106, 10, '120', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1107, 10, '125', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1108, 10, '130', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1109, 10, '100', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1110, 10, '105', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1111, 10, '110', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1112, 10, '115', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1113, 10, '120', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1114, 10, '125', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1115, 10, '130', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.nolbastoncini VALUES (1116, 10, '100', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.nolbastoncini VALUES (1117, 10, '105', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.nolbastoncini VALUES (1118, 10, '110', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.nolbastoncini VALUES (1119, 10, '115', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.nolbastoncini VALUES (1120, 10, '120', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.nolbastoncini VALUES (1121, 10, '125', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.nolbastoncini VALUES (1122, 10, '130', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.nolbastoncini VALUES (1123, 10, '100', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.nolbastoncini VALUES (1124, 10, '105', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.nolbastoncini VALUES (1125, 10, '110', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.nolbastoncini VALUES (1126, 10, '115', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.nolbastoncini VALUES (1127, 10, '120', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.nolbastoncini VALUES (1128, 10, '125', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.nolbastoncini VALUES (1129, 10, '130', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.nolbastoncini VALUES (1130, 15, 'U', 'BlackCrows', 'Telescopicus', 'Telemark', 10);


--
-- TOC entry 3207 (class 0 OID 65806)
-- Dependencies: 209
-- Data for Name: nolbiciclette; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nolbiciclette VALUES (901, 120, 'Adulto', 'Specialized', 'Non elettrica', 5);
INSERT INTO public.nolbiciclette VALUES (902, 80, 'Bambino', 'Specialized', 'Non elettrica', 5);
INSERT INTO public.nolbiciclette VALUES (903, 120, 'Adulto', 'Scott', 'Non elettrica', 5);
INSERT INTO public.nolbiciclette VALUES (904, 220, 'Adulto', 'Bianchi', 'Elettrica', 3);
INSERT INTO public.nolbiciclette VALUES (905, 220, 'Adulto', 'FatBike', 'Elettrica', 3);


--
-- TOC entry 3204 (class 0 OID 65779)
-- Dependencies: 206
-- Data for Name: noleggio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.noleggio VALUES ('James', 'Bondi', 'CI1000000', '2019-11-30', '2019-12-06', 1212, 160);
INSERT INTO public.noleggio VALUES ('James', 'Bondi', 'CI1000000', '2019-11-30', '2019-12-06', 1423, 80);
INSERT INTO public.noleggio VALUES ('James', 'Bondi', 'CI1000000', '2019-11-30', '2019-12-06', 1113, 10);
INSERT INTO public.noleggio VALUES ('Rosa', 'Salsa', 'CI2000000', '2018-11-01', '2018-11-07', 905, 220);
INSERT INTO public.noleggio VALUES ('Toni', 'Gin', 'CI3000000', '2019-12-15', '2019-12-22', 1314, 120);
INSERT INTO public.noleggio VALUES ('Toni', 'Gin', 'CI3000000', '2019-12-15', '2019-12-22', 1511, 40);
INSERT INTO public.noleggio VALUES ('Chin', 'Chanpai', 'CI4000000', '2020-01-01', '2020-01-07', 1005, 30);
INSERT INTO public.noleggio VALUES ('Chin', 'Chanpai', 'CI4000000', '2020-01-01', '2020-01-07', 1012, 30);
INSERT INTO public.noleggio VALUES ('Otto', 'Pantzer', 'CI5000000', '2019-12-25', '2019-12-31', 1119, 10);
INSERT INTO public.noleggio VALUES ('Otto', 'Pantzer', 'CI5000000', '2019-12-25', '2019-12-31', 1247, 130);
INSERT INTO public.noleggio VALUES ('Otto', 'Pantzer', 'CI5000000', '2019-12-25', '2019-12-31', 1460, 50);
INSERT INTO public.noleggio VALUES ('Nutipu', 'Manescu', 'CI6000000', '2018-12-27', '2018-12-22', 701, 100);
INSERT INTO public.noleggio VALUES ('Amalia', 'Delana', 'CI7000000', '2017-12-30', '2018-01-05', 801, 20);
INSERT INTO public.noleggio VALUES ('Massimo', 'Dellapena', 'CI8000000', '2019-11-15', '2019-11-21', 1101, 15);
INSERT INTO public.noleggio VALUES ('Massimo', 'Dellapena', 'CI8000000', '2019-11-15', '2019-11-21', 1203, 150);
INSERT INTO public.noleggio VALUES ('Massimo', 'Dellapena', 'CI8000000', '2019-11-15', '2019-11-21', 1405, 70);
INSERT INTO public.noleggio VALUES ('Apollo', 'Ariosto', 'CI9000000', '2018-12-02', '2018-12-08', 1481, 50);
INSERT INTO public.noleggio VALUES ('Pietro', 'Prezioso', 'CI1100000', '2018-12-24', '2018-12-30', 1106, 10);
INSERT INTO public.noleggio VALUES ('Pietro', 'Prezioso', 'CI1100000', '2018-12-24', '2018-12-30', 1218, 160);
INSERT INTO public.noleggio VALUES ('Pietro', 'Prezioso', 'CI1100000', '2018-12-24', '2018-12-30', 1444, 80);
INSERT INTO public.noleggio VALUES ('Oscar', 'Rafone', 'CI1200000', '2019-12-18', '2019-12-24', 1222, 160);
INSERT INTO public.noleggio VALUES ('Rick', 'Astley', 'CI1300000', '2019-06-12', '2019-06-18', 903, 120);
INSERT INTO public.noleggio VALUES ('Amedeo', 'Minghi', 'CI1400000', '2019-11-30', '2019-12-06', 702, 80);


--
-- TOC entry 3208 (class 0 OID 65816)
-- Dependencies: 210
-- Data for Name: nolpattini; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nolpattini VALUES (1001, 30, '35', 2);
INSERT INTO public.nolpattini VALUES (1002, 30, '36', 2);
INSERT INTO public.nolpattini VALUES (1003, 30, '37', 2);
INSERT INTO public.nolpattini VALUES (1004, 30, '38', 2);
INSERT INTO public.nolpattini VALUES (1005, 30, '39', 2);
INSERT INTO public.nolpattini VALUES (1006, 30, '40', 2);
INSERT INTO public.nolpattini VALUES (1007, 30, '41', 2);
INSERT INTO public.nolpattini VALUES (1008, 30, '42', 2);
INSERT INTO public.nolpattini VALUES (1009, 30, '43', 2);
INSERT INTO public.nolpattini VALUES (1010, 30, '44', 2);
INSERT INTO public.nolpattini VALUES (1011, 30, '45', 2);
INSERT INTO public.nolpattini VALUES (1012, 30, '46', 2);
INSERT INTO public.nolpattini VALUES (1013, 30, '47', 2);
INSERT INTO public.nolpattini VALUES (1014, 30, '48', 2);


--
-- TOC entry 3211 (class 0 OID 65846)
-- Dependencies: 213
-- Data for Name: nolscarponisci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nolscarponisci VALUES (1401, 70, '36', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1402, 70, '37', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1403, 70, '38', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1404, 70, '39', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1405, 70, '40', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1406, 70, '41', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1407, 70, '42', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1408, 70, '43', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1409, 70, '44', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1410, 70, '45', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1411, 70, '46', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1412, 70, '47', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1413, 70, '48', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.nolscarponisci VALUES (1414, 80, '36', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1415, 80, '37', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1416, 80, '38', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1417, 80, '39', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1418, 80, '40', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1419, 80, '41', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1420, 80, '42', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1421, 80, '43', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1422, 80, '44', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1423, 80, '45', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1424, 80, '46', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1425, 80, '47', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1426, 80, '48', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1427, 80, '36', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1428, 80, '37', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1429, 80, '38', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1430, 80, '39', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1431, 80, '40', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1432, 80, '41', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1433, 80, '42', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1434, 80, '43', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1435, 80, '44', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1436, 80, '45', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1437, 80, '46', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1438, 80, '47', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1439, 80, '48', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1440, 80, '36', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1441, 80, '37', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1442, 80, '38', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1443, 80, '39', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1444, 80, '40', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1445, 80, '41', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1446, 80, '42', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1447, 80, '43', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1448, 80, '44', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1449, 80, '45', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1450, 80, '46', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1451, 80, '47', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1452, 80, '48', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.nolscarponisci VALUES (1453, 50, '36', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1454, 50, '37', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1455, 50, '38', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1456, 50, '39', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1457, 50, '40', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1458, 50, '41', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1459, 50, '42', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1460, 50, '43', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1461, 50, '44', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1462, 50, '45', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1463, 50, '46', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1464, 50, '47', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1465, 50, '48', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1466, 50, '36', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1467, 50, '37', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1468, 50, '38', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1469, 50, '39', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1470, 50, '40', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1471, 50, '41', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1472, 50, '42', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1473, 50, '43', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1474, 50, '44', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1475, 50, '45', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1476, 50, '46', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1477, 50, '47', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1478, 50, '48', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1479, 50, '48', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.nolscarponisci VALUES (1480, 50, '36', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1481, 50, '37', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1482, 50, '38', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1483, 50, '39', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1484, 50, '40', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1485, 50, '41', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1486, 50, '42', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1487, 50, '43', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1488, 50, '44', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1489, 50, '45', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1490, 50, '46', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1491, 50, '47', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.nolscarponisci VALUES (1492, 50, '48', 'Scarpa', 'TXPro', 'Telemark', 2);


--
-- TOC entry 3212 (class 0 OID 65856)
-- Dependencies: 214
-- Data for Name: nolscarponisnow; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nolscarponisnow VALUES (1501, 40, '36', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1502, 40, '37', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1503, 40, '38', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1504, 40, '39', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1505, 40, '40', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1506, 40, '41', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1507, 40, '42', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1508, 40, '43', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1509, 40, '44', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1510, 40, '45', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1511, 40, '46', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1512, 40, '47', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1513, 40, '48', 'Burton', 'MotoBoa', 2);
INSERT INTO public.nolscarponisnow VALUES (1514, 40, '36', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1515, 40, '37', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1516, 40, '38', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1517, 40, '39', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1518, 40, '40', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1519, 40, '41', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1520, 40, '42', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1521, 40, '43', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1522, 40, '44', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1523, 40, '45', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1524, 40, '46', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1525, 40, '47', 'Nitro', 'Vagabond', 2);
INSERT INTO public.nolscarponisnow VALUES (1526, 40, '48', 'Nitro', 'Vagabond', 2);


--
-- TOC entry 3205 (class 0 OID 65786)
-- Dependencies: 207
-- Data for Name: nolsci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nolsci VALUES (1201, 150, 150, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.nolsci VALUES (1202, 150, 155, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.nolsci VALUES (1203, 150, 160, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.nolsci VALUES (1204, 150, 165, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.nolsci VALUES (1205, 150, 170, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.nolsci VALUES (1206, 150, 175, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.nolsci VALUES (1207, 150, 180, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.nolsci VALUES (1208, 160, 150, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1209, 160, 155, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1210, 160, 160, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1211, 160, 165, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1212, 160, 170, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1213, 160, 175, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1214, 160, 180, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1215, 160, 150, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1216, 160, 155, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1217, 160, 160, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1218, 160, 165, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1219, 160, 170, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1220, 160, 175, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1221, 160, 180, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.nolsci VALUES (1222, 160, 115, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.nolsci VALUES (1223, 160, 120, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.nolsci VALUES (1224, 160, 125, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.nolsci VALUES (1225, 160, 130, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.nolsci VALUES (1226, 160, 135, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.nolsci VALUES (1227, 160, 140, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.nolsci VALUES (1228, 160, 145, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.nolsci VALUES (1229, 130, 150, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1230, 130, 155, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1231, 130, 160, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1232, 130, 165, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1233, 130, 170, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1234, 130, 175, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1235, 130, 180, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1236, 130, 185, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1237, 130, 190, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1238, 130, 195, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1239, 130, 200, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1240, 130, 205, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1241, 130, 210, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1242, 130, 150, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1243, 130, 155, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1244, 130, 160, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1245, 130, 165, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1246, 130, 170, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1247, 130, 175, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1248, 130, 180, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1249, 130, 185, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1250, 130, 190, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1251, 130, 195, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1252, 130, 200, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1253, 130, 205, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1254, 130, 210, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.nolsci VALUES (1255, 130, 160, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.nolsci VALUES (1256, 130, 165, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.nolsci VALUES (1257, 130, 170, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.nolsci VALUES (1258, 130, 175, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.nolsci VALUES (1259, 130, 180, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.nolsci VALUES (1260, 130, 185, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.nolsci VALUES (1261, 130, 190, 'BlackCrows', 'Mantra', 'Telemark', 5);


--
-- TOC entry 3206 (class 0 OID 65796)
-- Dependencies: 208
-- Data for Name: nolsnow; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nolsnow VALUES (1301, 120, 150, 'Burton', 'Amplifier', 5);
INSERT INTO public.nolsnow VALUES (1302, 120, 155, 'Burton', 'Amplifier', 5);
INSERT INTO public.nolsnow VALUES (1303, 120, 160, 'Burton', 'Amplifier', 5);
INSERT INTO public.nolsnow VALUES (1304, 120, 165, 'Burton', 'Amplifier', 5);
INSERT INTO public.nolsnow VALUES (1305, 120, 170, 'Burton', 'Amplifier', 5);
INSERT INTO public.nolsnow VALUES (1306, 120, 175, 'Burton', 'Amplifier', 5);
INSERT INTO public.nolsnow VALUES (1307, 120, 180, 'Burton', 'Amplifier', 5);
INSERT INTO public.nolsnow VALUES (1308, 120, 150, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.nolsnow VALUES (1309, 120, 155, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.nolsnow VALUES (1310, 120, 160, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.nolsnow VALUES (1311, 120, 165, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.nolsnow VALUES (1312, 120, 170, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.nolsnow VALUES (1313, 120, 175, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.nolsnow VALUES (1314, 120, 180, 'Nitro', 'PrimeToxic', 5);


--
-- TOC entry 3201 (class 0 OID 65744)
-- Dependencies: 203
-- Data for Name: sconto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sconto VALUES ('CF01', 500, '');
INSERT INTO public.sconto VALUES ('CF02', 500, '');
INSERT INTO public.sconto VALUES ('CF03', 500, '');
INSERT INTO public.sconto VALUES ('CF04', 0, 'SCONTO100');
INSERT INTO public.sconto VALUES ('CF05', 0, 'SCONTO1000');
INSERT INTO public.sconto VALUES ('CF06', 50, '');
INSERT INTO public.sconto VALUES ('CF07', 30, '');
INSERT INTO public.sconto VALUES ('CF08', 200, '');
INSERT INTO public.sconto VALUES ('CF09', 10, 'SCONTO80');
INSERT INTO public.sconto VALUES ('CF10', 80, '');
INSERT INTO public.sconto VALUES ('CF11', 300, '');
INSERT INTO public.sconto VALUES ('CF12', 120, '');
INSERT INTO public.sconto VALUES ('CF13', 210, '');
INSERT INTO public.sconto VALUES ('CF14', 700, '');
INSERT INTO public.sconto VALUES ('CF15', 20, '');


--
-- TOC entry 3214 (class 0 OID 65877)
-- Dependencies: 216
-- Data for Name: scontrino; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.scontrino VALUES (5000, '2015-02-20', 600, '0502', 3);
INSERT INTO public.scontrino VALUES (5001, '2016-11-10', 500, '0702', 5);
INSERT INTO public.scontrino VALUES (5002, '2018-08-27', 6000, '0903', 2);
INSERT INTO public.scontrino VALUES (5003, '2018-11-30', 140, '1114', 2);
INSERT INTO public.scontrino VALUES (5004, '2019-12-15', 70, '0101', 1);
INSERT INTO public.scontrino VALUES (5005, '2016-11-25', 560, '1312', 2);
INSERT INTO public.scontrino VALUES (5006, '2017-12-02', 1350, '1447', 3);
INSERT INTO public.scontrino VALUES (5007, '2018-02-20', 110, '1005', 2);
INSERT INTO public.scontrino VALUES (5008, '2019-09-14', 900, '0001', 2);
INSERT INTO public.scontrino VALUES (5009, '2019-10-10', 390, '0209', 3);
INSERT INTO public.scontrino VALUES (5010, '2018-06-06', 50, '0605', 10);
INSERT INTO public.scontrino VALUES (5011, '2020-01-03', 300, '1522', 2);
INSERT INTO public.scontrino VALUES (5012, '2019-12-05', 300, '1241', 1);
INSERT INTO public.scontrino VALUES (5013, '2017-11-30', 480, '0407', 3);
INSERT INTO public.scontrino VALUES (5014, '2019-11-18', 640, '0401', 4);
INSERT INTO public.scontrino VALUES (5015, '2018-01-05', 1080, '0105', 6);


--
-- TOC entry 3215 (class 0 OID 65887)
-- Dependencies: 217
-- Data for Name: skipass; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.skipass VALUES (6000, NULL, 4400, 'Giornaliero', '2019-12-21', 80);
INSERT INTO public.skipass VALUES (6001, 2800, NULL, 'Giornaliero', '2019-12-21', 100);
INSERT INTO public.skipass VALUES (6002, NULL, 9000, 'Settimanale', '2019-12-23', 30);
INSERT INTO public.skipass VALUES (6003, 4500, NULL, 'Settimanale', '2019-12-25', 30);
INSERT INTO public.skipass VALUES (6004, NULL, 11000, 'Giornaliero', '2019-12-25', 200);
INSERT INTO public.skipass VALUES (6005, 7000, NULL, 'Giornaliero', '2019-12-25', 250);
INSERT INTO public.skipass VALUES (6006, NULL, 8250, 'Giornaliero', '2019-12-28', 150);
INSERT INTO public.skipass VALUES (6007, 5600, NULL, 'Giornaliero', '2019-12-28', 200);
INSERT INTO public.skipass VALUES (6008, NULL, 22000, 'Giornaliero', '2019-12-31', 400);
INSERT INTO public.skipass VALUES (6009, 8400, NULL, 'Giornaliero', '2019-12-31', 300);
INSERT INTO public.skipass VALUES (6010, NULL, 60000, 'Settimanale', '2019-12-31', 200);
INSERT INTO public.skipass VALUES (6011, 15000, NULL, 'Settimanale', '2019-12-31', 100);
INSERT INTO public.skipass VALUES (6012, NULL, 33000, 'Giornaliero', '2020-01-01', 600);
INSERT INTO public.skipass VALUES (6013, 14000, NULL, 'Giornaliero', '2020-01-01', 500);
INSERT INTO public.skipass VALUES (6014, NULL, 150000, 'Settimanale', '2020-01-01', 500);
INSERT INTO public.skipass VALUES (6015, 60000, NULL, 'Settimanale', '2020-01-01', 400);


--
-- TOC entry 3220 (class 0 OID 65937)
-- Dependencies: 222
-- Data for Name: venaltro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venaltro VALUES (701, 200, 'TSL', 'Ciaspole', 5);
INSERT INTO public.venaltro VALUES (702, 100, 'Alpidex', 'Ciaspole', 10);
INSERT INTO public.venaltro VALUES (801, 80, 'Biemme', 'Slitte', 10);


--
-- TOC entry 3221 (class 0 OID 65947)
-- Dependencies: 223
-- Data for Name: venbastoncini; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venbastoncini VALUES (1101, 50, 'U', 'SkiTrab', 'Teleskopik', 'Alpinismo', 10);
INSERT INTO public.venbastoncini VALUES (1102, 75, '100', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1103, 75, '105', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1104, 75, '110', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1105, 75, '115', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1106, 75, '120', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1107, 75, '125', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1108, 75, '130', 'Atomic', 'WCSL', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1109, 70, '100', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1110, 70, '105', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1111, 70, '110', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1112, 70, '115', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1113, 70, '120', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1114, 70, '125', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1115, 70, '130', 'Leki', 'WCGS', 'Discesa', 10);
INSERT INTO public.venbastoncini VALUES (1116, 75, '100', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.venbastoncini VALUES (1117, 75, '105', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.venbastoncini VALUES (1118, 75, '110', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.venbastoncini VALUES (1119, 75, '115', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.venbastoncini VALUES (1120, 75, '120', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.venbastoncini VALUES (1121, 75, '125', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.venbastoncini VALUES (1122, 75, '130', 'Rossignol', 'Thunder', 'Fondo', 10);
INSERT INTO public.venbastoncini VALUES (1123, 100, '100', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.venbastoncini VALUES (1124, 100, '105', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.venbastoncini VALUES (1125, 100, '110', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.venbastoncini VALUES (1126, 100, '115', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.venbastoncini VALUES (1127, 100, '120', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.venbastoncini VALUES (1128, 100, '125', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.venbastoncini VALUES (1129, 100, '130', 'Fischer', 'SpeedMax', 'Fondo', 8);
INSERT INTO public.venbastoncini VALUES (1130, 60, 'U', 'BlackCrows', 'Telescopicus', 'Telemark', 10);


--
-- TOC entry 3218 (class 0 OID 65917)
-- Dependencies: 220
-- Data for Name: venbiciclette; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venbiciclette VALUES (901, 750, 'Adulto', 'Specialized', 'Non elettrica', 5);
INSERT INTO public.venbiciclette VALUES (902, 400, 'Bambino', 'Specialized', 'Non elettrica', 5);
INSERT INTO public.venbiciclette VALUES (903, 3000, 'Adulto', 'Scott', 'Non elettrica', 5);
INSERT INTO public.venbiciclette VALUES (904, 5000, 'Adulto', 'Bianchi', 'Elettrica', 3);
INSERT INTO public.venbiciclette VALUES (905, 2500, 'Adulto', 'FatBike', 'Elettrica', 3);


--
-- TOC entry 3199 (class 0 OID 65730)
-- Dependencies: 201
-- Data for Name: vendita; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vendita VALUES (NULL, NULL, 6000, NULL, NULL, 4400, 80);
INSERT INTO public.vendita VALUES (NULL, NULL, 6001, NULL, NULL, 2800, 100);
INSERT INTO public.vendita VALUES (NULL, NULL, 6002, NULL, NULL, 9000, 30);
INSERT INTO public.vendita VALUES (NULL, NULL, 6003, NULL, NULL, 4500, 30);
INSERT INTO public.vendita VALUES (NULL, NULL, 6004, NULL, NULL, 11000, 200);
INSERT INTO public.vendita VALUES (NULL, NULL, 6005, NULL, NULL, 7000, 250);
INSERT INTO public.vendita VALUES (NULL, NULL, 6006, NULL, NULL, 8250, 150);
INSERT INTO public.vendita VALUES (NULL, NULL, 6007, NULL, NULL, 5600, 200);
INSERT INTO public.vendita VALUES (NULL, NULL, 6008, NULL, NULL, 22000, 400);
INSERT INTO public.vendita VALUES (NULL, NULL, 6009, NULL, NULL, 8400, 300);
INSERT INTO public.vendita VALUES (NULL, NULL, 6010, NULL, NULL, 60000, 200);
INSERT INTO public.vendita VALUES (NULL, NULL, 6011, NULL, NULL, 15000, 100);
INSERT INTO public.vendita VALUES (NULL, NULL, 6012, NULL, NULL, 33000, 600);
INSERT INTO public.vendita VALUES (NULL, NULL, 6013, NULL, NULL, 14000, 500);
INSERT INTO public.vendita VALUES (NULL, NULL, 6014, NULL, NULL, 150000, 500);
INSERT INTO public.vendita VALUES (NULL, NULL, 6015, NULL, NULL, 60000, 400);
INSERT INTO public.vendita VALUES (NULL, NULL, 5000, 502, NULL, 600, 3);
INSERT INTO public.vendita VALUES (NULL, NULL, 5001, 702, NULL, 500, 5);
INSERT INTO public.vendita VALUES (NULL, NULL, 5002, 903, NULL, 6000, 2);
INSERT INTO public.vendita VALUES (NULL, NULL, 5003, 1114, NULL, 140, 2);
INSERT INTO public.vendita VALUES (NULL, NULL, 5004, 101, NULL, 70, 1);
INSERT INTO public.vendita VALUES (NULL, NULL, 5005, 1312, NULL, 560, 2);
INSERT INTO public.vendita VALUES (NULL, NULL, 5006, 1447, NULL, 1350, 3);
INSERT INTO public.vendita VALUES (NULL, NULL, 5007, 1005, NULL, 110, 2);
INSERT INTO public.vendita VALUES (NULL, NULL, 5008, 1, NULL, 900, 2);
INSERT INTO public.vendita VALUES (NULL, NULL, 5009, 209, NULL, 390, 3);
INSERT INTO public.vendita VALUES (NULL, NULL, 5010, 605, NULL, 50, 10);
INSERT INTO public.vendita VALUES (NULL, NULL, 5011, 1522, NULL, 300, 2);
INSERT INTO public.vendita VALUES (NULL, NULL, 5012, 1241, NULL, 300, 1);
INSERT INTO public.vendita VALUES (NULL, NULL, 5013, 407, NULL, 480, 3);
INSERT INTO public.vendita VALUES (NULL, NULL, 5014, 401, NULL, 640, 4);
INSERT INTO public.vendita VALUES (NULL, NULL, 5015, 105, NULL, 1080, 6);
INSERT INTO public.vendita VALUES ('Carlo', 'Pedersoli', 100, 411, NULL, 100, 1);
INSERT INTO public.vendita VALUES ('Ivana', 'Spagna', 200, 211, NULL, 60, 1);
INSERT INTO public.vendita VALUES ('Giove', 'Capitolino', 300, 1219, NULL, 750, 1);
INSERT INTO public.vendita VALUES ('Ermanno', 'Cervino', 400, 1489, NULL, 470, 1);
INSERT INTO public.vendita VALUES ('Furio', 'Zoccano', 500, 603, 'SCONTO80', 200, 1);
INSERT INTO public.vendita VALUES ('Federica', 'Pellegrini', 600, 302, NULL, 30, 1);
INSERT INTO public.vendita VALUES ('Sabine', 'Petzl', 700, 904, 'SCONTO1000', 4000, 1);
INSERT INTO public.vendita VALUES ('Joanna', 'Gaines', 800, 801, 'SCONTO100', 140, 3);


--
-- TOC entry 3219 (class 0 OID 65927)
-- Dependencies: 221
-- Data for Name: venpattini; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venpattini VALUES (1001, 55, '35', 2);
INSERT INTO public.venpattini VALUES (1002, 55, '36', 2);
INSERT INTO public.venpattini VALUES (1003, 55, '37', 2);
INSERT INTO public.venpattini VALUES (1004, 55, '38', 2);
INSERT INTO public.venpattini VALUES (1005, 55, '39', 2);
INSERT INTO public.venpattini VALUES (1006, 55, '40', 2);
INSERT INTO public.venpattini VALUES (1007, 55, '41', 2);
INSERT INTO public.venpattini VALUES (1008, 55, '42', 2);
INSERT INTO public.venpattini VALUES (1009, 55, '43', 2);
INSERT INTO public.venpattini VALUES (1010, 55, '44', 2);
INSERT INTO public.venpattini VALUES (1011, 55, '45', 2);
INSERT INTO public.venpattini VALUES (1012, 55, '46', 2);
INSERT INTO public.venpattini VALUES (1013, 55, '47', 2);
INSERT INTO public.venpattini VALUES (1014, 55, '48', 2);


--
-- TOC entry 3222 (class 0 OID 65957)
-- Dependencies: 224
-- Data for Name: venscarponisci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venscarponisci VALUES (1401, 450, '36', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1402, 450, '37', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1403, 450, '38', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1404, 450, '39', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1405, 450, '40', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1406, 450, '41', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1407, 450, '42', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1408, 450, '43', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1409, 450, '44', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1410, 450, '45', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1411, 450, '46', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1412, 450, '47', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1413, 450, '48', 'Scarpa', 'Maestrale', 'Alpinismo', 2);
INSERT INTO public.venscarponisci VALUES (1414, 300, '36', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1415, 300, '37', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1416, 300, '38', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1417, 300, '39', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1418, 300, '40', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1419, 300, '41', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1420, 300, '42', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1421, 300, '43', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1422, 300, '44', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1423, 300, '45', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1424, 300, '46', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1425, 300, '47', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1426, 300, '48', 'Head', 'Raptor', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1427, 480, '36', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1428, 480, '37', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1429, 480, '38', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1430, 480, '39', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1431, 480, '40', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1432, 480, '41', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1433, 480, '42', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1434, 480, '43', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1435, 480, '44', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1436, 480, '45', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1437, 480, '46', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1438, 480, '47', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1439, 480, '48', 'Lange', 'WorldCup', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1440, 450, '36', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1441, 450, '37', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1442, 450, '38', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1443, 450, '39', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1444, 450, '40', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1445, 450, '41', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1446, 450, '42', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1447, 450, '43', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1448, 450, '44', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1449, 450, '45', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1450, 450, '46', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1451, 450, '47', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1452, 450, '48', 'DalBello', 'DRS', 'Discesa', 2);
INSERT INTO public.venscarponisci VALUES (1453, 230, '36', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1454, 230, '37', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1455, 230, '38', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1456, 230, '39', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1457, 230, '40', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1458, 230, '41', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1459, 230, '42', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1460, 230, '43', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1461, 230, '44', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1462, 230, '45', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1463, 230, '46', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1464, 230, '47', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1465, 230, '48', 'Fischer', 'Carbonlite', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1466, 400, '36', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1467, 400, '37', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1468, 400, '38', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1469, 400, '39', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1470, 400, '40', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1471, 400, '41', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1472, 400, '42', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1473, 400, '43', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1474, 400, '44', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1475, 400, '45', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1476, 400, '46', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1477, 400, '47', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1478, 400, '48', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1479, 400, '48', 'Rossignol', 'X-Ium', 'Fondo', 2);
INSERT INTO public.venscarponisci VALUES (1480, 470, '36', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1481, 470, '37', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1482, 470, '38', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1483, 470, '39', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1484, 470, '40', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1485, 470, '41', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1486, 470, '42', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1487, 470, '43', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1488, 470, '44', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1489, 470, '45', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1490, 470, '46', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1491, 470, '47', 'Scarpa', 'TXPro', 'Telemark', 2);
INSERT INTO public.venscarponisci VALUES (1492, 470, '48', 'Scarpa', 'TXPro', 'Telemark', 2);


--
-- TOC entry 3223 (class 0 OID 65967)
-- Dependencies: 225
-- Data for Name: venscarponisnow; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venscarponisnow VALUES (1501, 200, '36', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1502, 200, '37', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1503, 200, '38', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1504, 200, '39', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1505, 200, '40', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1506, 200, '41', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1507, 200, '42', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1508, 200, '43', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1509, 200, '44', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1510, 200, '45', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1511, 200, '46', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1512, 200, '47', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1513, 200, '48', 'Burton', 'MotoBoa', 2);
INSERT INTO public.venscarponisnow VALUES (1514, 150, '36', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1515, 150, '37', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1516, 150, '38', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1517, 150, '39', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1518, 150, '40', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1519, 150, '41', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1520, 150, '42', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1521, 150, '43', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1522, 150, '44', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1523, 150, '45', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1524, 150, '46', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1525, 150, '47', 'Nitro', 'Vagabond', 2);
INSERT INTO public.venscarponisnow VALUES (1526, 150, '48', 'Nitro', 'Vagabond', 2);


--
-- TOC entry 3216 (class 0 OID 65897)
-- Dependencies: 218
-- Data for Name: vensci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vensci VALUES (1201, 630, 150, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.vensci VALUES (1202, 630, 155, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.vensci VALUES (1203, 630, 160, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.vensci VALUES (1204, 630, 165, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.vensci VALUES (1205, 630, 170, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.vensci VALUES (1206, 630, 175, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.vensci VALUES (1207, 630, 180, 'SkiTrab', 'Powercup', 'Alpinismo', 5);
INSERT INTO public.vensci VALUES (1208, 750, 150, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1209, 750, 155, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1210, 750, 160, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1211, 750, 165, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1212, 750, 170, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1213, 750, 175, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1214, 750, 180, 'Atomic', 'RedsterGS', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1215, 710, 150, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1216, 750, 155, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1217, 750, 160, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1218, 750, 165, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1219, 750, 170, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1220, 750, 175, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1221, 750, 180, 'Head', 'WCRebelsGSR', 'Discesa', 5);
INSERT INTO public.vensci VALUES (1222, 750, 115, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.vensci VALUES (1223, 750, 120, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.vensci VALUES (1224, 750, 125, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.vensci VALUES (1225, 750, 130, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.vensci VALUES (1226, 750, 135, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.vensci VALUES (1227, 750, 140, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.vensci VALUES (1228, 750, 145, 'Volkl', 'WCRacetigerSL', 'Discesa', 10);
INSERT INTO public.vensci VALUES (1229, 300, 150, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1230, 300, 155, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1231, 300, 160, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1232, 300, 165, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1233, 300, 170, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1234, 300, 175, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1235, 300, 180, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1236, 300, 185, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1237, 300, 190, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1238, 300, 195, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1239, 300, 200, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1240, 300, 205, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1241, 300, 210, 'Rossignol', 'X-IumSkate', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1242, 300, 150, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1243, 300, 155, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1244, 300, 160, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1245, 300, 165, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1246, 300, 170, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1247, 300, 175, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1248, 300, 180, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1249, 300, 185, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1250, 300, 190, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1251, 300, 195, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1252, 300, 200, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1253, 300, 205, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1254, 300, 210, 'Fischer', 'CarbonliteGrip', 'Fondo', 5);
INSERT INTO public.vensci VALUES (1255, 600, 160, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.vensci VALUES (1256, 600, 165, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.vensci VALUES (1257, 600, 170, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.vensci VALUES (1258, 600, 175, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.vensci VALUES (1259, 600, 180, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.vensci VALUES (1260, 600, 185, 'BlackCrows', 'Mantra', 'Telemark', 5);
INSERT INTO public.vensci VALUES (1261, 600, 190, 'BlackCrows', 'Mantra', 'Telemark', 5);


--
-- TOC entry 3217 (class 0 OID 65907)
-- Dependencies: 219
-- Data for Name: vensnow; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vensnow VALUES (1301, 380, 150, 'Burton', 'Amplifier', 5);
INSERT INTO public.vensnow VALUES (1302, 380, 155, 'Burton', 'Amplifier', 5);
INSERT INTO public.vensnow VALUES (1303, 380, 160, 'Burton', 'Amplifier', 5);
INSERT INTO public.vensnow VALUES (1304, 380, 165, 'Burton', 'Amplifier', 5);
INSERT INTO public.vensnow VALUES (1305, 380, 170, 'Burton', 'Amplifier', 5);
INSERT INTO public.vensnow VALUES (1306, 380, 175, 'Burton', 'Amplifier', 5);
INSERT INTO public.vensnow VALUES (1307, 380, 180, 'Burton', 'Amplifier', 5);
INSERT INTO public.vensnow VALUES (1308, 280, 150, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.vensnow VALUES (1309, 380, 155, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.vensnow VALUES (1310, 380, 160, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.vensnow VALUES (1311, 380, 165, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.vensnow VALUES (1312, 380, 170, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.vensnow VALUES (1313, 380, 175, 'Nitro', 'PrimeToxic', 5);
INSERT INTO public.vensnow VALUES (1314, 380, 180, 'Nitro', 'PrimeToxic', 5);


--
-- TOC entry 3042 (class 2606 OID 65981)
-- Name: abbigliamento abbigliamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abbigliamento
    ADD CONSTRAINT abbigliamento_pkey PRIMARY KEY (idabb);


--
-- TOC entry 2992 (class 2606 OID 65743)
-- Name: cartafedelta cartafedelta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartafedelta
    ADD CONSTRAINT cartafedelta_pkey PRIMARY KEY (idcarta);


--
-- TOC entry 2984 (class 2606 OID 65729)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cf);


--
-- TOC entry 3020 (class 2606 OID 65871)
-- Name: fattura fattura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fattura
    ADD CONSTRAINT fattura_pkey PRIMARY KEY (numfattura);


--
-- TOC entry 2998 (class 2606 OID 65768)
-- Name: lezione lezione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lezione
    ADD CONSTRAINT lezione_pkey PRIMARY KEY (codicelezione);


--
-- TOC entry 2996 (class 2606 OID 65763)
-- Name: maestro maestro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maestro
    ADD CONSTRAINT maestro_pkey PRIMARY KEY (tessera);


--
-- TOC entry 3012 (class 2606 OID 65830)
-- Name: nolaltro nolaltro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolaltro
    ADD CONSTRAINT nolaltro_pkey PRIMARY KEY (idaltro);


--
-- TOC entry 3014 (class 2606 OID 65840)
-- Name: nolbastoncini nolbastoncini_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolbastoncini
    ADD CONSTRAINT nolbastoncini_pkey PRIMARY KEY (idbast);


--
-- TOC entry 3008 (class 2606 OID 65810)
-- Name: nolbiciclette nolbiciclette_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolbiciclette
    ADD CONSTRAINT nolbiciclette_pkey PRIMARY KEY (idbici);


--
-- TOC entry 3000 (class 2606 OID 65785)
-- Name: noleggio noleggio_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.noleggio
    ADD CONSTRAINT noleggio_id_key UNIQUE (id);


--
-- TOC entry 3002 (class 2606 OID 65783)
-- Name: noleggio noleggio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.noleggio
    ADD CONSTRAINT noleggio_pkey PRIMARY KEY (cartaidentita, id);


--
-- TOC entry 3010 (class 2606 OID 65820)
-- Name: nolpattini nolpattini_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolpattini
    ADD CONSTRAINT nolpattini_pkey PRIMARY KEY (idpattini);


--
-- TOC entry 3016 (class 2606 OID 65850)
-- Name: nolscarponisci nolscarponisci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolscarponisci
    ADD CONSTRAINT nolscarponisci_pkey PRIMARY KEY (idscarp);


--
-- TOC entry 3018 (class 2606 OID 65860)
-- Name: nolscarponisnow nolscarponisnow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolscarponisnow
    ADD CONSTRAINT nolscarponisnow_pkey PRIMARY KEY (idscarpsnow);


--
-- TOC entry 3004 (class 2606 OID 65790)
-- Name: nolsci nolsci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolsci
    ADD CONSTRAINT nolsci_pkey PRIMARY KEY (idsci);


--
-- TOC entry 3006 (class 2606 OID 65800)
-- Name: nolsnow nolsnow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolsnow
    ADD CONSTRAINT nolsnow_pkey PRIMARY KEY (idsnow);


--
-- TOC entry 2994 (class 2606 OID 65748)
-- Name: sconto sconto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sconto
    ADD CONSTRAINT sconto_pkey PRIMARY KEY (idcarta);


--
-- TOC entry 3022 (class 2606 OID 65881)
-- Name: scontrino scontrino_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scontrino
    ADD CONSTRAINT scontrino_pkey PRIMARY KEY (idscontrino);


--
-- TOC entry 3024 (class 2606 OID 65891)
-- Name: skipass skipass_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skipass
    ADD CONSTRAINT skipass_pkey PRIMARY KEY (idskipass);


--
-- TOC entry 3034 (class 2606 OID 65941)
-- Name: venaltro venaltro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venaltro
    ADD CONSTRAINT venaltro_pkey PRIMARY KEY (idaltro);


--
-- TOC entry 3036 (class 2606 OID 65951)
-- Name: venbastoncini venbastoncini_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venbastoncini
    ADD CONSTRAINT venbastoncini_pkey PRIMARY KEY (idbast);


--
-- TOC entry 3030 (class 2606 OID 65921)
-- Name: venbiciclette venbiciclette_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venbiciclette
    ADD CONSTRAINT venbiciclette_pkey PRIMARY KEY (idbici);


--
-- TOC entry 2986 (class 2606 OID 65736)
-- Name: vendita vendita_idoggetto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendita
    ADD CONSTRAINT vendita_idoggetto_key UNIQUE (idoggetto);


--
-- TOC entry 2988 (class 2606 OID 65734)
-- Name: vendita vendita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendita
    ADD CONSTRAINT vendita_pkey PRIMARY KEY (idvendita);


--
-- TOC entry 2990 (class 2606 OID 65738)
-- Name: vendita vendita_sconto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendita
    ADD CONSTRAINT vendita_sconto_key UNIQUE (sconto);


--
-- TOC entry 3032 (class 2606 OID 65931)
-- Name: venpattini venpattini_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venpattini
    ADD CONSTRAINT venpattini_pkey PRIMARY KEY (idpattini);


--
-- TOC entry 3038 (class 2606 OID 65961)
-- Name: venscarponisci venscarponisci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venscarponisci
    ADD CONSTRAINT venscarponisci_pkey PRIMARY KEY (idscarp);


--
-- TOC entry 3040 (class 2606 OID 65971)
-- Name: venscarponisnow venscarponisnow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venscarponisnow
    ADD CONSTRAINT venscarponisnow_pkey PRIMARY KEY (idscarpsnow);


--
-- TOC entry 3026 (class 2606 OID 65901)
-- Name: vensci vensci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vensci
    ADD CONSTRAINT vensci_pkey PRIMARY KEY (idsci);


--
-- TOC entry 3028 (class 2606 OID 65911)
-- Name: vensnow vensnow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vensnow
    ADD CONSTRAINT vensnow_pkey PRIMARY KEY (idsnow);


--
-- TOC entry 3043 (class 1259 OID 65987)
-- Name: idx_tipo_abbigliamento; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tipo_abbigliamento ON public.abbigliamento USING btree (tipologia);


--
-- TOC entry 3067 (class 2606 OID 65982)
-- Name: abbigliamento abbigliamento_idabb_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abbigliamento
    ADD CONSTRAINT abbigliamento_idabb_fkey FOREIGN KEY (idabb) REFERENCES public.vendita(idoggetto) ON UPDATE CASCADE;


--
-- TOC entry 3056 (class 2606 OID 65872)
-- Name: fattura fattura_numfattura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fattura
    ADD CONSTRAINT fattura_numfattura_fkey FOREIGN KEY (numfattura) REFERENCES public.vendita(idvendita);


--
-- TOC entry 3046 (class 2606 OID 65769)
-- Name: lezione lezione_codicecliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lezione
    ADD CONSTRAINT lezione_codicecliente_fkey FOREIGN KEY (codicecliente) REFERENCES public.cliente(cf) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3047 (class 2606 OID 65774)
-- Name: lezione lezione_tesseramaestro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lezione
    ADD CONSTRAINT lezione_tesseramaestro_fkey FOREIGN KEY (tesseramaestro) REFERENCES public.maestro(tessera) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3052 (class 2606 OID 65831)
-- Name: nolaltro nolaltro_idaltro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolaltro
    ADD CONSTRAINT nolaltro_idaltro_fkey FOREIGN KEY (idaltro) REFERENCES public.noleggio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3053 (class 2606 OID 65841)
-- Name: nolbastoncini nolbastoncini_idbast_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolbastoncini
    ADD CONSTRAINT nolbastoncini_idbast_fkey FOREIGN KEY (idbast) REFERENCES public.noleggio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3050 (class 2606 OID 65811)
-- Name: nolbiciclette nolbiciclette_idbici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolbiciclette
    ADD CONSTRAINT nolbiciclette_idbici_fkey FOREIGN KEY (idbici) REFERENCES public.noleggio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3051 (class 2606 OID 65821)
-- Name: nolpattini nolpattini_idpattini_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolpattini
    ADD CONSTRAINT nolpattini_idpattini_fkey FOREIGN KEY (idpattini) REFERENCES public.noleggio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3054 (class 2606 OID 65851)
-- Name: nolscarponisci nolscarponisci_idscarp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolscarponisci
    ADD CONSTRAINT nolscarponisci_idscarp_fkey FOREIGN KEY (idscarp) REFERENCES public.noleggio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3055 (class 2606 OID 65861)
-- Name: nolscarponisnow nolscarponisnow_idscarpsnow_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolscarponisnow
    ADD CONSTRAINT nolscarponisnow_idscarpsnow_fkey FOREIGN KEY (idscarpsnow) REFERENCES public.noleggio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3048 (class 2606 OID 65791)
-- Name: nolsci nolsci_idsci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolsci
    ADD CONSTRAINT nolsci_idsci_fkey FOREIGN KEY (idsci) REFERENCES public.noleggio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3049 (class 2606 OID 65801)
-- Name: nolsnow nolsnow_idsnow_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nolsnow
    ADD CONSTRAINT nolsnow_idsnow_fkey FOREIGN KEY (idsnow) REFERENCES public.noleggio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3044 (class 2606 OID 65749)
-- Name: sconto sconto_codicesconto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sconto
    ADD CONSTRAINT sconto_codicesconto_fkey FOREIGN KEY (codicesconto) REFERENCES public.vendita(sconto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3045 (class 2606 OID 65754)
-- Name: sconto sconto_idcarta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sconto
    ADD CONSTRAINT sconto_idcarta_fkey FOREIGN KEY (idcarta) REFERENCES public.cartafedelta(idcarta);


--
-- TOC entry 3057 (class 2606 OID 65882)
-- Name: scontrino scontrino_idscontrino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scontrino
    ADD CONSTRAINT scontrino_idscontrino_fkey FOREIGN KEY (idscontrino) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3058 (class 2606 OID 65892)
-- Name: skipass skipass_idskipass_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skipass
    ADD CONSTRAINT skipass_idskipass_fkey FOREIGN KEY (idskipass) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3063 (class 2606 OID 65942)
-- Name: venaltro venaltro_idaltro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venaltro
    ADD CONSTRAINT venaltro_idaltro_fkey FOREIGN KEY (idaltro) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3064 (class 2606 OID 65952)
-- Name: venbastoncini venbastoncini_idbast_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venbastoncini
    ADD CONSTRAINT venbastoncini_idbast_fkey FOREIGN KEY (idbast) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3061 (class 2606 OID 65922)
-- Name: venbiciclette venbiciclette_idbici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venbiciclette
    ADD CONSTRAINT venbiciclette_idbici_fkey FOREIGN KEY (idbici) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3062 (class 2606 OID 65932)
-- Name: venpattini venpattini_idpattini_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venpattini
    ADD CONSTRAINT venpattini_idpattini_fkey FOREIGN KEY (idpattini) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3065 (class 2606 OID 65962)
-- Name: venscarponisci venscarponisci_idscarp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venscarponisci
    ADD CONSTRAINT venscarponisci_idscarp_fkey FOREIGN KEY (idscarp) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3066 (class 2606 OID 65972)
-- Name: venscarponisnow venscarponisnow_idscarpsnow_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venscarponisnow
    ADD CONSTRAINT venscarponisnow_idscarpsnow_fkey FOREIGN KEY (idscarpsnow) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3059 (class 2606 OID 65902)
-- Name: vensci vensci_idsci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vensci
    ADD CONSTRAINT vensci_idsci_fkey FOREIGN KEY (idsci) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3060 (class 2606 OID 65912)
-- Name: vensnow vensnow_idsnow_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vensnow
    ADD CONSTRAINT vensnow_idsnow_fkey FOREIGN KEY (idsnow) REFERENCES public.vendita(idvendita) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-01-06 15:36:58

--
-- PostgreSQL database dump complete
--


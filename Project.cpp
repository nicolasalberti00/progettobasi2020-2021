#include <cstdio>
#include <iostream>
#include <fstream>
#include "Dependencies/include/libpq-fe.h"
#include "VariadicTable.h"

using namespace std;

# define PG_HOST "127.0.0.1"
# define PG_USER "postgres" // il vostro nome utente
# define PG_DB "db" // il nome del database
# define PG_PASS "password" // la vostra password
# define PG_PORT 5432

void checkResults(PGresult* res, const PGconn* conn) {
	if (PQresultStatus(res) != PGRES_TUPLES_OK) {
		cout << " Risultati inconsistenti !" << PQerrorMessage(conn) << endl;
		PQclear(res);
		exit(1);	
	}

}

void stampa(PGresult* res)  {

	int tuple = PQntuples(res);
	int campi = PQnfields(res);


	if (campi == 1) {
		VariadicTable<std::string> vt({ PQfname(res, 0) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0));
		}
		vt.print(std::cout);
	}

	if (campi == 2) {
		VariadicTable<std::string, std::string> vt({ PQfname(res, 0),PQfname(res, 1) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0), PQgetvalue(res, i, 1));
		}
		vt.print(std::cout);
	}

	if (campi == 3) {
		VariadicTable<std::string, std::string, std::string> vt({ PQfname(res, 0),PQfname(res, 1), PQfname(res, 2) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0), PQgetvalue(res, i, 1), PQgetvalue(res, i, 2));
		}
		vt.print(std::cout);
	}

	if (campi == 4) {
		VariadicTable<std::string, std::string, std::string, std::string> vt({ PQfname(res, 0),PQfname(res, 1), PQfname(res, 2), PQfname(res, 3) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0), PQgetvalue(res, i, 1), PQgetvalue(res, i, 2), PQgetvalue(res, i, 3));
		}
		vt.print(std::cout);
	}

	if (campi == 5) {
		VariadicTable<std::string, std::string, std::string, std::string, std::string> vt({ PQfname(res, 0),PQfname(res, 1), PQfname(res, 2), PQfname(res, 3), PQfname(res, 4) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0), PQgetvalue(res, i, 1), PQgetvalue(res, i, 2), PQgetvalue(res, i, 3), PQgetvalue(res, i, 4));
		}
		vt.print(std::cout);
	}

	if (campi == 6) {
		VariadicTable<std::string, std::string, std::string, std::string, std::string, std::string> vt({ PQfname(res, 0),PQfname(res, 1), PQfname(res, 2), PQfname(res, 3), PQfname(res, 4), PQfname(res, 5) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0), PQgetvalue(res, i, 1), PQgetvalue(res, i, 2), PQgetvalue(res, i, 3), PQgetvalue(res, i, 4), PQgetvalue(res, i, 5));
		}
		vt.print(std::cout);
	}

	if (campi == 7) {
		VariadicTable<std::string, std::string, std::string, std::string, std::string, std::string, std::string> vt({ PQfname(res, 0),PQfname(res, 1), PQfname(res, 2), PQfname(res, 3), PQfname(res, 4), PQfname(res, 5), PQfname(res, 6) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0), PQgetvalue(res, i, 1), PQgetvalue(res, i, 2), PQgetvalue(res, i, 3), PQgetvalue(res, i, 4), PQgetvalue(res, i, 5), PQgetvalue(res, i, 6));
		}
		vt.print(std::cout);
	}

	if (campi == 8) {
		VariadicTable<std::string, std::string, std::string, std::string, std::string, std::string, std::string, std::string> vt({ PQfname(res, 0),PQfname(res, 1), PQfname(res, 2), PQfname(res, 3), PQfname(res, 4), PQfname(res, 5), PQfname(res, 6), PQfname(res, 7) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0), PQgetvalue(res, i, 1), PQgetvalue(res, i, 2), PQgetvalue(res, i, 3), PQgetvalue(res, i, 4), PQgetvalue(res, i, 5), PQgetvalue(res, i, 6), PQgetvalue(res, i, 7));
		}
		vt.print(std::cout);
	}

	if (campi == 9) {
		VariadicTable<std::string, std::string, std::string, std::string, std::string, std::string, std::string, std::string, std::string> vt({ PQfname(res, 0),PQfname(res, 1), PQfname(res, 2), PQfname(res, 3), PQfname(res, 4), PQfname(res, 5), PQfname(res, 6), PQfname(res, 7), PQfname(res, 8) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0), PQgetvalue(res, i, 1), PQgetvalue(res, i, 2), PQgetvalue(res, i, 3), PQgetvalue(res, i, 4), PQgetvalue(res, i, 5), PQgetvalue(res, i, 6), PQgetvalue(res, i, 7), PQgetvalue(res, i, 8));
		}
		vt.print(std::cout);
	}

	if (campi == 10) {
		VariadicTable<std::string, std::string, std::string, std::string, std::string, std::string, std::string, std::string, std::string, std::string> vt({ PQfname(res, 0),PQfname(res, 1), PQfname(res, 2), PQfname(res, 3), PQfname(res, 4), PQfname(res, 5), PQfname(res, 6), PQfname(res, 7), PQfname(res, 8), PQfname(res, 9) });

		for (int i = 0; i < tuple; ++i) {
			vt.addRow(PQgetvalue(res, i, 0), PQgetvalue(res, i, 1), PQgetvalue(res, i, 2), PQgetvalue(res, i, 3), PQgetvalue(res, i, 4), PQgetvalue(res, i, 5), PQgetvalue(res, i, 6), PQgetvalue(res, i, 7), PQgetvalue(res, i, 8), PQgetvalue(res, i, 9));
		}
		vt.print(std::cout);
	}

}


int main(){

	PGconn* conn;


	char conninfo[250];
	sprintf_s(conninfo, "user =%s password =%s dbname =%s hostaddr =%s port =%d", PG_USER, PG_PASS, PG_DB, PG_HOST, PG_PORT);

	conn = PQconnectdb(conninfo);

	if (PQstatus(conn) != CONNECTION_OK) {
		cout << " Errore di connessione " << PQerrorMessage(conn);
		PQfinish(conn);
		exit(1);
	}
	else {
		cout << " Connessione avvenuta correttamente \n\n";
	}


	PGresult* res;


	// PRIMA QUERY
	cout << "         Prima Query: \n";
	res = PQexec(conn, "drop view if exists adulti; create view adulti as SELECT distinct count(a.nome) FROM cliente a join lezione l on (a.CF=l.codicecliente) WHERE l.tipocliente='Adulto'; select adulti as clienti_adulti, count(b.nome) as clienti_bambini from lezione l join cliente b on (b.CF=l.codicecliente), adulti where l.tipocliente='Bambino' group by adulti");
	stampa(res);
	cout << endl;

	//SECONDA QUERY
	cout << "                       Seconda Query: \n";
	res = PQexec(conn, "DROP VIEW IF EXISTS ordini_abbigliamento; create view ordini_abbigliamento as SELECT abbigliamento.quantita as quantita_in_stock, abbigliamento.modello as modello_in_stock, abbigliamento.idabb as id_in_stock FROM abbigliamento WHERE abbigliamento.quantita<'6' group by abbigliamento.taglia, abbigliamento.modello, abbigliamento.idabb order by abbigliamento.modello; select * from vendita v join ordini_abbigliamento oa on(v.idoggetto=oa.id_in_stock) where v.sconto!='0';");
	stampa(res);
	cout << endl;
	
	//TERZA QUERY
	cout << "       Terza Query: \n";
	res = PQexec(conn, "drop view if exists sci_vendite; create view sci_vendite as SELECT sum(vendita.prezzo) as prezzo_totale FROM vendita WHERE idoggetto::text LIKE '14%' or idoggetto::text LIKE '12%'; select sum(v.prezzo) AS snowboard_vendite, sci_vendite from vendita v, sci_vendite where idoggetto::text LIKE '12%' or idoggetto::text LIKE '15%' group by sci_vendite");
	stampa(res);
	cout << endl;

	//QUARTA QUERY
	cout << "      Quarta Query: \n";
	res = PQexec(conn, "select sum(v.quantita), a.colore as colore_abb_venduti from vendita v join abbigliamento a on (v.idoggetto=a.idabb) where v.prezzo>'250' group by a.colore order by sum(v.quantita) desc");
	stampa(res);
	cout << endl;

	//QUINTA QUERY
	cout << "           Quinta Query \n";
	res = PQexec(conn, "select sum(v.prezzo) as senza_sconti from vendita v join scontrino s on (v.idvendita=s.idscontrino) where s.dataven>'2017-12-31' and s.dataven<'2019-01-01' except(select v.idoggetto from vendita v where idoggetto::text='12%');");
	stampa(res);
	cout << endl;

	//SESTA QUERY
	cout << "    Sesta Query \n";
	res = PQexec(conn, "select distinct cl.nome, sum(v.prezzo) from cliente cl, cartafedelta ca, vendita v where cl.nome=ca.nomecarta and cl.cognome=ca.cognomecarta and cl.nome=v.nomeven and cl.cognome=v.cognomeven and	exists (select l.codicecliente from lezione l join cliente cl on (l.codicecliente=cl.cf)) group by cl.nome order by sum(v.prezzo) desc;");
	stampa(res);
	cout << endl;

	//SESTA QUERY BIS
	cout << "    Sesta Query Bis \n";
	res = PQexec(conn, "SELECT DISTINCT cl.nome, cl.cognome, lez.tipologia FROM cliente cl, lezione lez, fattura fatt, vendita ven WHERE fatt.NumFattura = ven.IDvendita AND cl.CF = lez.codicecliente AND fatt.CF = cl.CF");
	stampa(res);
	cout << endl;

	PQfinish(conn);
	
	int n;
	cin >> n;

	return 0;
}
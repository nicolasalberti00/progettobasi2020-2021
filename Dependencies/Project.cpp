# include <cstdio>
# include <iostream>
# include <fstream>
# include <C:/Users/Joseph/Desktop/Dependencies/include/libpq-fe.h>
using namespace std ;
# define PG_HOST " 127.0.0.1 "
# define PG_USER "postgres" // il vostro nome utente
# define PG_DB "ScuolaSci2" // il nome del database
# define PG_PASS "Starwars26" // la vostra password
# define PG_PORT 5432


	
int main ( int argc , char ** argv ) {
	
char conninfo [250];

sprintf ( conninfo , " user =%s password =%s dbname =%s hostaddr =%s port =%d", PG_USER , PG_PASS , PG_DB , PG_HOST , PG_PORT );

PGconn * conn = PQconnectdb( conninfo );



PGresult *quer1;
quer1= PQexec(conn, "DROP VIEW IF EXISTS ordini_abbigliamento create view ordini_abbigliamento as SELECT abbigliamento.taglia FROM abbigliamento WHERE abbigliamento.quantita<'7' group by abbigliamento.taglia SELECT abbigliamento.modello, ordini_abbigliamento as taglie FROM ordini_abbigliamento, abbigliamento EXCEPT(SELECT abbigliamento.modello, ordini_abbigliamento from abbigliamento, ordini_abbigliamento where abbigliamento.quantita>'8')");
int tuple1= PQntuples(quer1);
int campi1 = PQnfields (quer1);

for(int i=0; i< campi1; i++){
	cout<< PQfname(quer1, i) << "\t\t";
}

cout << endl;

for(int i=0; i< tuple1; i++){
	for(int k=0;k<campi1; k++){
		cout << PQgetvalue(quer1, i, k) << "\t\t";
	}
	cout<<endl;
}

PGresult *quer2;
quer2= PQexec(conn, "SELECT DISTINCT nolsci.modello as sci, nolscarponisci.modello as scarponi, nolbastoncini.modello as bastoncini FROM nolsci, nolscarponisci, nolbastoncini WHERE nolsci.altezza='170' and nolscarponisci.taglia='37' and nolbastoncini.altezza='130'");
int tuple2= PQntuples(quer2);
int campi2 = PQnfields (quer2);

for(int i=0; i< campi2; i++){
	cout<< PQfname(quer2, i) << "\t\t";
}

cout << endl;

for(int i=0; i< tuple2; i++){
	for(int k=0;k<campi2; k++){
		cout << PQgetvalue(quer2, i, k) << "\t\t";
	}
	cout<<endl;
}

PGresult *quer3;
quer3= PQexec(conn, "SELECT SUM(scontrino.prezzoscontrino) as prezzo_totale_accessori FROM scontrino, abbigliamento, vendita WHERE scontrino.dataven>='2018-01-01' and scontrino.dataven<='2018-12-31' and scontrino.idscontrino=vendita.idvendita and vendita.idoggetto=abbigliamento.idabb and abbigliamento.tipologia='Accessori'");
int tuple3= PQntuples(quer3);
int campi3 = PQnfields (quer3);

for(int i=0; i< campi3; i++){
	cout<< PQfname(quer3, i) << "\t\t";
}

cout << endl;

for(int i=0; i< tuple3; i++){
	for(int k=0;k<campi3; k++){
		cout << PQgetvalue(quer3, i, k) << "\t\t";
	}
	cout<<endl;
}


PGresult *quer4;
quer3= PQexec(conn, "SELECT vendita.sconto as sconto, vendita.idvendita as vendita FROM vendita, scontrino WHERE vendita.idvendita=scontrino.idscontrino and scontrino.dataven='2020-25-12'");
int tuple4= PQntuples(quer4);
int campi4 = PQnfields (quer4);

for(int i=0; i< campi4; i++){
	cout<< PQfname(quer4, i) << "\t\t";
}

cout << endl;

for(int i=0; i< tuple4; i++){
	for(int k=0;k<campi4; k++){
		cout << PQgetvalue(quer4, i, k) << "\t\t";
	}
	cout<<endl;
}



PGresult *quer5;
quer5= PQexec(conn, "SELECT COUNT(cliente) as numeropersone FROM lezione, cliente WHERE cliente.CF=lezione.codicecliente and lezione.numore='8'");
int tuple5= PQntuples(quer5);
int campi5 = PQnfields (quer5);

for(int i=0; i< campi5; i++){
	cout<< PQfname(quer5, i) << "\t\t";
}

cout << endl;

for(int i=0; i< tuple5; i++){
	for(int k=0;k<campi5; k++){
		cout << PQgetvalue(quer5, i, k) << "\t\t";
	}
	cout<<endl;
}


PGresult *quer6;
quer5= PQexec(conn, "SELECT cliente.CF FROM cliente, noleggio WHERE noleggio.nomenol=cliente.nome and noleggio.cognomenol=cliente.cognome and noleggio.datafine<'2021/01/06'");
int tuple6= PQntuples(quer6);
int campi6 = PQnfields (quer6);

for(int i=0; i< campi6; i++){
	cout<< PQfname(quer6, i) << "\t\t";
}

cout << endl;

for(int i=0; i< tuple6; i++){
	for(int k=0;k<campi6; k++){
		cout << PQgetvalue(quer6, i, k) << "\t\t";
	}
	cout<<endl;
}








}




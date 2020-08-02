

In diesem ReadMe wird beschrieben wie man den Datenbank Clone in Mysql einbinden kann.
 In dieser ist die Datenbank für das Spiel Asteroids enthalten.

Außerdem wird beschrieben wie man die Anbindung vom Spiel zur Datenbank herstellt.


Datenbank Clone Datei:
	asteroidsV1_backup.sql


#############################################################################################


Einbinden der Datenbank:


#Melden sie sich auf ihrer Datenbank als Root an:

mysql -u root -p
Enter Password: *********


#Erstellen Sie die Database "asteroidsV1":

CREATE DATABASE asteroidsV1;


#Loggen Sie sich aus:

exit;



#Importieren sie den Datenbank Clone "asteroidsV1_backup.sql":

mysql -u root -p asteroidsV1 < asteroidsV1_backup.sql
Enter password:*********

(
Entweder machen Sie das aus dem Directory wo die Datei "asteroidsV1_backup.sql" gespeichert ist
ODER Sie geben das Verzeichnis an. 

Bsp.:

mysql -u root -p asteroidsV1 < C:/OrdnerName/asteroidsV1_backup.sql
Enter password:*********
)

#######################################################################################################

Nun ist die Datenbank eingebunden und kann vom Spiel benutzt werden.


Um das Spiel zu benutzen muss eine Verbindung zur Datenbank "asteroidsV1" vorhanden sein!!!!!!!!
Deswegen ist der Name der eingebundenen Datenbank essenziel!!!!

Des Weiteren können Änderungen im Code notwendig sein.

########################################################################################################



Anbindung zur Datenbank (Code):


#Änderungen in der Klasse Game an Zeile 45:

Zeile 45: 	dbconnection = new MySQL(theApp, "localhost", "asteroidsV1", "DBHandler", "1234" );

Hier muss anstelle von "localhost" die entsprechende IPv4 Addresse ihrer Datenbank eingetragen werde.
Bsp.:
dbconnection = new MySQL(theApp, "123.123.123.123", "asteroidsV1", "DBHandler", "1234" );

####################################################################################################



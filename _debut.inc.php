<?php
include("_menu.inc.php");
include("_fonctions.inc.php");


// CONNEXION AU SERVEUR MYSQL PUIS SÉLECTION DE LA BASE DE DONNÉES JPE

$connexion=connect();
if (!$connexion)
{
   ajouterErreur("Echec de la connexion au serveur MySql");
   afficherErreurs();
   exit();
}
/*if (!selectBase($connexion))
{
   ajouterErreur("La base de données jpe est inexistante ou non accessible");
   afficherErreurs();
   exit();
}

*/

?>
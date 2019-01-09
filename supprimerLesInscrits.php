<?php

include("_debut.inc.php");

// ANNULER UNE VISITE

$idVisite=$_REQUEST['idVisite'];
// Cas 1ère étape (on vient de listeVisiteursAPrevenir.php)

if ($_REQUEST['action']=='demandeSuppression')
{
   echo "
   <br><center><h5>Souhaitez-vous vraiment supprimer les inscrits ?
   <br><br>
   <a href='supprimerLesInscrits.php?action=validerSuppression&idVisite=$idVisite'>
   Oui</a>&nbsp; &nbsp; &nbsp; &nbsp;
   <a href='listeVisiteursAPrevenir.php?idVisite=$idVisite'>Non</a></h5></center>";
}

// Cas 2ème étape (on vient de demander la suppression des inscrits

else
{
  $req = "delete from visiteur where visiteur.idVisite = $idVisite";
 mysql_query($req, $connexion);
   echo "
   <br><br><center><h5>Les visiteurs ont &eacute;t&eacute; supprim&eacute;s</h5>

   <a href='listeVisitesPourDetail.php'>Retour</a></center>";
}
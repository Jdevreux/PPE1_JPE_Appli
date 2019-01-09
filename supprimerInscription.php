<?php

include("_debut.inc.php");

// ANNULER UNE INSCRIPTION D'UN VISITEUR

$idVisiteur=$_REQUEST['idVisiteur'];

//On récupère le nom et le prénom du visiteur
$req ="select visiteur.nom, visiteur.prenom, visiteur.idVisite
from visiteur
where visiteur.id =$idVisiteur";
$rsVisiteur=mysql_query($req, $connexion);
$lgVisiteur = mysql_fetch_array($rsVisiteur);

$nom=$lgVisiteur['nom'];
$prenom=$lgVisiteur['prenom'];
$idVisite=$lgVisiteur['idVisite'];

// Cas 1ère étape (on vient de listeInscrits.php)

if ($_REQUEST['action']=='demandeSup')
{
   echo "
   <br><center><h5>Souhaitez-vous vraiment supprimer l'inscription de $nom $prenom ?
   <br><br>
   <a href='supprimerInscription.php?action=validerAnnulationInscription&idVisiteur=$idVisiteur'>
   Oui</a>&nbsp; &nbsp; &nbsp; &nbsp;
   <a href='listeInscrits.php?idVisite=$idVisite'>Non</a></h5></center>";
}

// Cas 2ème étape (on vient de demander à supprimer l'inscription)

else
{
	// Pour supprimer une inscription il faut faire deux choses :
	// - D'abord modifier le nombre d'inscrits à la visite
   $req ="select visiteur.nbPersonnes from visiteur where visiteur.id = $idVisiteur";
   	$rsVisiteur=mysql_query($req, $connexion);
   	$lgVisiteur = mysql_fetch_array($rsVisiteur);
   	$nbPersonnes = $lgVisiteur['nbPersonnes'];
   	$req ="update visite set nbVisiteursInscrits=nbVisiteursInscrits - $nbPersonnes where
   			visite.id = $idVisite";
   	mysql_query($req, $connexion);

   // - Ensuite supprimer le visiteur
   	$req = "delete from visiteur where visiteur.id =$idVisiteur";
	mysql_query($req, $connexion);
   echo "
   <br><br><center><h5>L'inscription de $nom $prenom a été supprimée</h5>
   <br><br><center><h5><a href='listeInscrits.php?idVisite=$idVisite'>Liste des inscrits</a></h5>
   <a href='index.php?'>Retour</a></center>";
}

?>

<?php
include("_debut.inc.php");


// AFFICHER L'ENSEMBLE DES INSCRITS A UNE VISITE
// CETTE PAGE CONTIENT UN TABLEAU CONSTITUÉ D'1 LIGNE D'EN-TÊTE ET D'1 LIGNE PAR
// INSCRIT

	$idVisite = $_REQUEST['idVisite'];
   $req="select visiteur.id as idVisiteur, visiteur.nom, visiteur.prenom,visiteur.tel,
      visiteur.nbPersonnes, visite.dateV, visite.heureDebut,visite.nbVisiteursInscrits, entreprise.raisonSociale from visite, visiteur, entreprise
   where visiteur.idVisite=visite.id and entreprise.id=Visite.idEntreprise and visite.id =$idVisite";
   $rsVisiteur = mysql_query($req, $connexion);
   $lgVisiteur = mysql_fetch_array($rsVisiteur);
   $date = $lgVisiteur['dateV'];
   //Utilisation d'une fonction de conversion de date pour l'afficher au format français
	$date = dateAnglaisVersFrancais($date);
   $heureDebut = $lgVisiteur['heureDebut'];
	$nbVisiteursInscrits = $lgVisiteur['nbVisiteursInscrits'];
   $entreprise= $lgVisiteur['raisonSociale'];
echo "
<table width='60%' cellspacing='0' cellpadding='0' align='center'
class='tabNonQuadrille'>
   <tr class='enTeteTabNonQuad' >
      <td colspan='5'>$entreprise $date $heureDebut </td>
   </tr>
   <tr class='enTeteTabNonQuad' align='left'>
         <td >Nom</td>
         <td >Prenom</td>
         <td >téléphone</td>
         <td >Nb de personnes</td>
   </tr>
   ";


   // BOUCLE SUR LES VISITEURS
   while ($lgVisiteur != FALSE)
   {
      $idVisiteur = $lgVisiteur['idVisiteur'];
      $nom = $lgVisiteur['nom'];
      $prenom = $lgVisiteur['prenom'];
	  $tel = $lgVisiteur['tel'];
      $nbPersonnes = $lgVisiteur['nbPersonnes'];
      echo "
		<tr class='ligneTabNonQuad'>

         <td width='15%'>$nom</td>

         <td width='15%'>$prenom</td>
		<td width='15%'>$tel</td>
         <td width='16%' >$nbPersonnes personnes</td>


         </tr>";
      $lgVisiteur=mysql_fetch_array($rsVisiteur);
   }
   echo "

</table>
<table align='center'>
	<tr>
         <td colspan='2' align='center'><a href='index.php'>Retour</a>
         </td>";
 // on ne propose de supprimer les inscrits que s'il y en a
 if($nbVisiteursInscrits != 0)
 {
	 echo "
          <td colspan='2' align='center'><a href='supprimerLesInscrits.php?idVisite=$idVisite&action=demandeSuppression'>Supprimer ces inscriptions</a>
         </td>";
 }
 echo "
 	</tr>
</table>";



?>

</body>
</html>
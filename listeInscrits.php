<?php

include("_debut.inc.php");

$idVisite = $_REQUEST['idVisite'];
// AFFICHER LES INFORMATIONS SUR LA VISITE

   $req1="select visite.dateV, visite.heureDebut,
   visite.nbVisiteursInscrits, entreprise.raisonSociale
   from visite, entreprise
   where entreprise.id=visite.idEntreprise and visite.id =$idVisite";
   $rsVisite = mysql_query($req1, $connexion);
   $lgVisite = mysql_fetch_array($rsVisite);

   //Utilisation d'une fonction de conversion de date pour l'afficher au format français
   $jour = dateAnglaisVersFrancais($lgVisite['dateV']);

   $heureDebut = $lgVisite['heureDebut'];
   $nbVisiteursInscrits = $lgVisite['nbVisiteursInscrits'];
   $entreprise= $lgVisite['raisonSociale'];

   // AFFICHE l'ENT-TETE DU TABLEAU
   echo "
   <table width='60%' cellspacing='0' cellpadding='0' align='center'
   class='tabNonQuadrille'>
      <tr class='enTeteTabNonQuad'>
         <td colspan='5'>$entreprise le $jour à $heureDebut inscrits : $nbVisiteursInscrits personnes </td>
   </tr>";

// AFFICHER L'ENSEMBLE DES INSCRITS A UNE VISITE
// TABLEAU CONSTITUÉ D'1 LIGNE D'EN-TÊTE ET D'1 LIGNE PAR
// INSCRIT

// ON COMMENCE PAR TESTER S'IL Y A DES INCRITS A LA VISITE
   if( $nbVisiteursInscrits != 0)
   {
   		$req2="select visiteur.id as idVisiteur, visiteur.nom, visiteur.prenom, visiteur.nbPersonnes
   		from visiteur
   		where visiteur.idVisite = $idVisite";
   		$rsVisiteur = mysql_query($req2, $connexion);
   		$lgVisiteur = mysql_fetch_array($rsVisiteur);

      // BOUCLE SUR LES VISITEURS
   		while ($lgVisiteur != FALSE)
   		{
      		$idVisiteur = $lgVisiteur['idVisiteur'];
      		$nom = $lgVisiteur['nom'];
      		$prenom = $lgVisiteur['prenom'];
      		$nbPersonnes = $lgVisiteur['nbPersonnes'];
      		echo "
				<tr class='ligneTabNonQuad'>
	        		<td width='10%'>$nom</td>
	        		<td width='10%'>$prenom</td>
					<td width='10%'>$nbPersonnes places</td>
   		    		<td width='16%' >
         				<a href='supprimerInscription.php?idVisiteur=$idVisiteur&action=demandeSup'>
         				Supprimer l'inscription</a></td>
        		</tr>";
       			$lgVisiteur=mysql_fetch_array($rsVisiteur);
       	 }
    }
   echo "
   </table>
   <table align='center'>
		<tr>
         	<td colspan='2' align='center'><a href='listeVisitesPourDetail.php'>Retour liste des visites</a>
         	</td>
      	</tr>
	</table>";
?>

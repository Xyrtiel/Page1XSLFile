<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<title> Formulaire du Patient </title>
		</head>
	</html>
    <div id="corps">
	  <h1> Formulaire du Patient </h1>
      <table width="1500" border="1">
		  <tr style="color: #fff; background: darkred;">
			<th width="50%" colspan="4">Identifiant</th>
			<th width="50%" colspan="2">Formulaire</th>
		  </tr>
		  <tr style="color: #fff; background: darkorange;">
		  	<th width="12.5%" colspan="1">Patient</th>
			<th width="12.5%" colspan="1">Sejour</th>
			<th width="12.5%" colspan="1">Contexte</th>
			<th width="12.5%" colspan="1">Date Modif.</th>
		    <th width="25%" colspan="1">Code</th>
		    <th width="25%" colspan="1">Libelle</th>
		  </tr>
		  <!-- On sélectionne chaque détail du formulaire. -->
		  <xsl:for-each select="//formulaire">
			  <xsl:sort select="./formulaire" data-type="number" order="descending" />
		   <tr>
			    <td><xsl:value-of select="ipp"/></td>
			    <td><xsl:value-of select="sejour"/></td>
				<td><xsl:value-of select="contexte"/></td>
				<td><xsl:value-of select="date_modification"/></td>
		        <td><xsl:value-of select="code_formulaire"/></td>
			    <td><xsl:value-of select="libelle_formulaire"/></td>
		   </tr>
		</xsl:for-each>
		</table>
		<table width="1500" border="1">
			<tr style="color: #fff; background: darkblue;">
				<th width="100%" colspan="3">Informations Patient</th>
			</tr>
			<xsl:variable name="nomChamp1" select="formulaire/champs/champ[contains(code, 'NOM')]" />
			<xsl:variable name="nomChamp2" select="formulaire/champs/champ[contains(code, 'NAME')]" />
			<tr style="color: #fff; background: purple;">
				<th width="10%" colspan="1">Code Sujet</th>
				<th width="45%" colspan="1">Libelle Sujet</th>
				<th width="45%" colspan="1">Reponse</th>
			</tr>
			<!-- On sélectionne ensuite le champ en question pour chaque formulaire. -->
			<tr style="color: #fff; background: darkgreen;">
			<xsl:if test="$nomChamp1 or $nomChamp2">
				<td>NAMEPATIENT</td>
				<td>Nom du Patient</td>
				<td><xsl:value-of select="$nomChamp1/valeur | $nomChamp2/valeur" /></td>
			</xsl:if>
			</tr>
			<xsl:for-each select="//formulaire/champs/champ">
			 <xsl:sort select="./champ" data-type="number" order="descending" />
			<tr>
			    <td style="background-color:#EAE8FF;padding:1,5pt;"><xsl:value-of select="code"/></td>
			    <td><xsl:value-of select="libelle"/></td>
				<strong><td><xsl:value-of select="valeur"/></td></strong>
			</tr>
			</xsl:for-each>
		</table>
    </div>
    </xsl:template>

<xsl:template match="ipp">
	<h2 class="forme_infos_generales_patient">
		Identifiant Patient : <xsl:value-of select="." />
	</h2>
</xsl:template>

<xsl:template match="sejour">
	<td class="forme_infos_generales_patient">
		Identifiant Sejour a l'hopital : <strong><xsl:value-of select="." /></strong>
	</td>
</xsl:template>

<xsl:template match="contexte">
	<td class="forme_infos_generales_patient">
		Identifiant Contexte : <strong><xsl:value-of select="." /></strong>
	</td>
</xsl:template>

<xsl:template match="date_modification">
	<p class="forme_infos_generales_patient">
		Date de modification du Formulaire : <strong><xsl:value-of select="." /></strong>
	</p>
</xsl:template>

<xsl:template match="code_formulaire">
	<p class="forme_infos_generales_patient">
		Code Formulaire : <strong><xsl:value-of select="." /></strong>
	</p>
</xsl:template>

<xsl:template match="libelle_formulaire">
	<p class="forme_infos_generales_patient">
		Libelle du Formulaire : <strong><xsl:value-of select="." /></strong>
	</p>
</xsl:template>


<xsl:template match="champ">
	<p>
		<xsl:value-of select="code"/>
		<xsl:value-of select="libelle"/>
		<xsl:value-of select="valeur"/>
	</p>
</xsl:template>
<!-- 			<xsl:variable name="nomChamp1" select="formulaire/champs/champ[contains(code, 'NOM')]" />
				<xsl:variable name="nomChamp2" select="formulaire/champs/champ[contains(code, 'NAME')]" />
				<xsl:choose>
					<xsl:when test="$nomChamp1 or $nomChamp2">
						<h2>Nom du Patient: <xsl:value-of select="$nomChamp1/valeur | $nomChamp2/valeur" /></h2>
					</xsl:when>
					<xsl:otherwise>
						<h2>Nom du Patient non disponible</h2>
					</xsl:otherwise>
				</xsl:choose>
-->
</xsl:stylesheet>
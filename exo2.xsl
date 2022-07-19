<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">

<xsl:template match="/ListeHotes">
<html style="background-color: rgba(220,220,220,0.3);">
  <head><title>Analyseur Reseau</title></head>
  <body >
<h1 style="text-align:center; color:green; text-shadow: 3px 2px #000;">Analyseur Reseau</h1>
    <xsl:for-each select="Hote"> 
	<div style="text-align:center; border: solid 1px; padding:10px 50px 20px; padding-left:auto;">
	<h3> Adresse IP: <xsl:value-of select="IP" /></h3>
    	<table style=" display:table; margin:auto; text-align:center; font-size:18px;" >
     <tr>
       <th> Liste des ports</th>
	<th> Etat </th>
	
     </tr>
	<xsl:for-each select="ListePorts/Port">

	<xsl:if test="@State='ouvert'">
      	<tr bgcolor="green">
        	<td><xsl:value-of select="@PortNum"/></td>
		<td><xsl:value-of select="@State"/></td>
      	</tr>
	</xsl:if>


	<xsl:if test="@State='filtre'">
      	<tr bgcolor="EC405A">
        	<td><xsl:value-of select="@PortNum"/></td>
		<td><xsl:value-of select="@State"/></td>
      	</tr>
	</xsl:if>

	<xsl:if test="@State='ferme'">
      	<tr bgcolor="red">
        	<td><xsl:value-of select="@PortNum"/></td>
		<td><xsl:value-of select="@State"/></td>
      	</tr>
	</xsl:if>


	</xsl:for-each>


    </table>
	<br/>
	</div>
	<br/><br/><br/>
       </xsl:for-each>
  
  
  <h4 style="font-size:18px; border-radius:30px; border:2; border-color:#FFFCA5; background:#FFFCA5;padding:10px 50px 20px;">Nombre de ports 80 ouverts est 
  	<xsl:value-of select="count(/ListeHotes/Hote/ListePorts/Port[@PortNum='80' and @State='ouvert'])"/></h4>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

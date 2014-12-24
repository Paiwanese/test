<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SOPHAS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!--- Google Web Site Statistics --->
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-6361117-2");
pageTracker._trackPageview();
} catch(err) {}</script>

<style type="text/css">
<!--
body,td,th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.whiteText{
font-family:Verdana, Arial, Helvetica, sans-serif;
font-size:12px;
color:#ffffff;
font-weight:bold;
padding-left:5px;
background-color:#86B1CD;
}
.border-in {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #BCD3E3;
	border-right-color: #BCD3E3;
	border-bottom-color: #BCD3E3;
	border-left-color: #BCD3E3;
	padding:5px;
	
}

.border-Out {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #B3B3B3;
	border-right-color: #B3B3B3;
	border-bottom-color: #B3B3B3;
	border-left-color: #B3B3B3;
	padding:10px;
}.style1 {color: #990000}
-->
</style>

<cfquery name="GetDegree" datasource="SOPHAS">
SELECT *
FROM Degrees
ORDER BY DegreeName
</cfquery>

<cfquery name="GetTerm" datasource="SOPHAS">
SELECT *
FROM Terms
ORDER BY listID asc
</cfquery>

<cfquery name="GetSearchTag" datasource="SOPHAS">
SELECT *
FROM searchTags
ORDER BY TagName asc
</cfquery>

<cfquery name="GetResearches" datasource="SOPHAS">
SELECT *
FROM Programs
ORDER BY ProgramName
</cfquery>
</head>
<body>
<table cellpadding="0" c cellspacing="0" width="870" ><form name="form1" method="post" action="SearchResult.cfm">
<tr><td class="border-Out" align="center">
 
<table cellpadding="0" c cellspacing="0" width="850" >
<tr><td><img src="../images/CriteriaSearch.jpg"></td></tr>
<tr><td>&nbsp;</td></tr><tr><td><div align="left"><span class="style1">Information on 2010 degree programs will be added by August 1.</span></div></td>
</tr><tr><td>&nbsp;</td></tr>
<tr><td class="border-in">
<table cellpadding="0" cellspacing="0" width="100%">

<!--- <tr align="left" style="background-color:#c1d7e2" ><td  colspan="2" height="30" style="padding-left:20px;" valign="middle"><strong>Criteria Search <span class="style9">&raquo;</span></strong></td></tr> --->
		 
	
	 
	    <tr><td colspan="2" class="whiteText" height="25" align="left">Select Department/Program Areas </td></tr>
	<tr align="left">
	  <td colspan="2" style="padding-top:5px; padding-left:10px; background-color:#F2F2F2;" valign="top" >
	<select name="SearchTag" size="10" multiple>
	<option value="" selected>-- Select One or More --</option>
	<cfoutput query="GetSearchTag">
	<option value="#TagID#">#TagName#</option>
	</cfoutput>
	
	</select></td></tr>
	<tr><td colspan="2" style="background-color:#F2F2F2">&nbsp;</td></tr>
	 <tr><td colspan="2" >&nbsp;</td></tr>
	<tr><td colspan="2" class="whiteText" height="25" align="left">Select Degree</td></tr>
<tr align="left" >
      
      <td colspan="2" style="padding-top:5px; padding-left:10px;  background-color:#F2F2F2; padding-left:10px;  ">
	  <select name="Degree" size="10">
	<option value="" selected > -- Select One -- </option>
	<option value="allBachelors" >All Bachelors</option>
	<option value="allMasters" >All Masters</option>
	<option value="allDoctoral" >All Doctoral</option>
	<option value="DualDegree" >All Dual Degrees</option>
	<cfoutput query="GetDegree">
	<option value="#DegreeID#">#DegreeFullName# <cfif #DegreeID# neq 3>(#DegreeName#)</cfif> </option>
	</cfoutput>
	</select>
	  
	  </td></tr>
	  
   <tr><td colspan="2" style="background-color:#F2F2F2">&nbsp;</td></tr>
	 <tr><td colspan="2" >&nbsp;</td></tr>
	 <tr><td colspan="2" class="whiteText" height="25" align="left">Select Term</td></tr>
	<tr align="left" >
	 <td colspan="2" style="padding-top:5px; padding-left:10px; background-color:#F2F2F2;">
	  <select name="Term" size="5" multiple>
	 <option value="" selected> -- Select One or More -- </option>
	
	<cfoutput query="GetTerm">
	<option value="#TermID#">#Term#</option>
	</cfoutput>
	</select></td></tr>
	<tr><td colspan="2" style="background-color:#F2F2F2">&nbsp;</td></tr>
	<tr><td colspan="2" >&nbsp;</td></tr>
	
   
         </table>

</td></tr>

   <tr bgcolor="#FFFFFF" ><td height="16"></td>
      </tr>
   
			    <tr align="left" bgcolor="#FFFFFF"><td style="padding-left:20px;" valign="top"><input type="submit" value="&nbsp;Search&nbsp;"></td></tr>
          
		   <tr bgcolor="#FFFFFF"><td height="45">&nbsp;</td></tr>


</table>
 
</td></tr>
</form>
</table>
</body>
</html>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SOPHAS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body,td,th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
.style9 {
	color: #993333;
	font-weight: bold;
}

/*
.bodyAreaBorder {
	background-color: #FFFFFF;
	padding: 8px 15px 5px 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #062D56;
	border: 1px solid #193A5D;
}*/
.leftBorder {
	background-color: #FFFFFF;
	padding: 8px 12px 5px 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #062D56;
	border-top:1px solid #193A5D;
	border-right:1px solid #193A5D;
	
}
.rightBorder {
	background-color: #FFFFFF;
	padding: 8px 12px 5px 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #062D56;
	border-top:1px solid #193A5D;
	
	
}
.borderTopDown {
	border-top-width: 1px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
	border-top-color: #B3B3B3;
	border-bottom-color: #B3B3B3;
	padding:3px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color:#000000;
	
}
.ProgramTitle {
	background-color: #C9DCE9;
	padding-left:5px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color:#291EGG;
}
.smallText {
    padding-left:5px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color:#000000;
}
.borderOutside {
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
}-->
</style>

<!--- <cfdump var="#form#" label="test"> ---> 
<!--- <cfoutput>#Form.degree#</cfoutput> --->

<!--- <br><cfset listDegree = listQualify(Form.degree, '''',',','CHAR')>
<cfoutput>#listDegree#</cfoutput> --->
<cfif #Form.SearchTag# eq ''>
  <script language="JavaScript">
alert("Please select program.");
history.go(-1);
</script>

</cfif>

<cfif #Form.Degree# eq ''>
  <script language="JavaScript">
alert("Please select degree.");
history.go(-1);
</script>
</cfif>

<cfif #Form.Term# eq '' >
  <script language="JavaScript">
alert("Please select Term.");
history.go(-1);
</script>
</cfif>


 <cfquery name="GetPrograms" datasource="SOPHAS">
SELECT p.SOPHASYesNo, p.programID, p.ProgramName,p.degreeName, P.CONCENTRATION, t.*, d.degreeID, d.DegreeFullname, s.SchoolName
FROM Programs p
JOIN Terms t on p.termID =t.termID
JOIN degrees d on p.degreeID = d.degreeID
JOIN Schools s on s.schoolID =P.schoolID 
WHERE ProgramID is NOT NUll
<cfif #form.degree# eq 'allMasters'>
AND p.degreetype = 'masters'
<cfelseif #form.degree# eq 'allDoctoral'>
AND p.degreetype = 'doctoral'
<cfelseif #form.degree# eq 'allBachelors'>
AND p.degreetype ='Bachelors'
<cfelseif #form.degree# eq 'DualDegree'>
AND p.dualCombined = 'yes'
<cfelse>
AND d.degreeID in (#form.degree#)
</cfif>
<!--- <cfif #form.degree# neq ''>AND d.degreeID in (#Form.Degree#)</cfif> --->

<cfif #form.SearchTag# neq ''>
AND (p.SearchTag1 in (<cfoutput>#Form.SearchTag#</cfoutput>) 
	OR p.SearchTag2 in (<cfoutput>#Form.SearchTag#</cfoutput>)
	OR p.SearchTag3 in (<cfoutput>#Form.SearchTag#</cfoutput>) )
</cfif>

<cfif #form.Term# neq ''>
AND t.TermID in(<cfoutput>#Form.Term#</cfoutput>)
</cfif>
order by p.schoolName, p.ProgramName
</cfquery> 

<!--- <cfif #Form.degree# neq 'allMasters' or #Form.degree# neq 'allDoctoral' or #Form.degree# neq 'DualDegree'>
<cfset dName =#GetPrograms.DegreeName#>
</cfif> --->
 <cfquery name="GetSearchTag" datasource="SOPHAS">
 select TagName
 from searchTags
 where TagID IN ( <cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#Form.SearchTag#" maxlength="50">)
 </cfquery>
<!---   <cfquery name="GetDegreeName" datasource="SOPHAS">
 select DegreeName
 from Degrees
 where DegreeID = #Form.degree#
 </cfquery> --->
   <cfquery name="GetTermName" datasource="SOPHAS">
 select Term
 from Terms
 where TermID in (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#Form.Term#" maxlength="15">)
 </cfquery> 
 <cfif #Form.degree# eq 'allMasters'>
<cfset dName = 'All Masters'>
<cfelseif #Form.degree# eq 'allDoctoral'>
<cfset dName = 'All Doctoral'>
<cfelseif #Form.degree# eq 'DualDegree'>
<cfset dName ='All Dual Degree'>
<cfelseif  #Form.degree# eq 'allBachelors'>
<cfset dName='All Bachelors'>
<cfelse>
<cfquery name="GetDegreeName" datasource="SOPHAS">
 select DegreeName
 from Degrees
 where DegreeID = <cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#Form.degree#" maxlength="100">
 </cfquery>
<cfset dName =#GetDegreeName.DegreeName#>
</cfif> 
</head>




<body >
<table cellpadding="0" cellspacing="0" width="870" border="0">


		<tr><td width="850" align="center" class="borderOutside">  
		  <table width="850" cellpadding="0" border="0" cellspacing="0" >
		  <tr><td colspan="2"><img src="../images/ProgramLists.jpg"></td></tr>
		  
		  <tr><td colspan="2"  align="center" height="850" valign="top">
		  
		  <table cellpadding="0" cellspacing="0" width="100%" border="0">
 
<tr><td colspan="2" height="20"></td></tr>
<tr><td colspan="2" align="left" valign="top">
<table cellpadding="0" cellspacing="0" width="100%">
<tr><td valign="top"><cfoutput query="GetSearchTag">#GetSearchTag.TagName#<br></cfoutput></td>
<td style="padding-left:5px; " valign="top"><cfoutput>#dName#</cfoutput></td>
<td style="padding-left:5px; " valign="top"><cfoutput query="GetTermName">#GetTermName.Term#<br></cfoutput></td>
<td class="smallText" align="right"  valign="top"><< <a href="search.cfm">Back to Search for a Program</a>&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>

</td></tr>


<!--- <tr><td align="left" class="smallText"><strong><font color="#4D4D4D"><cfoutput query="GetSearchTag">#GetSearchTag.TagName#</cfoutput> &nbsp;&nbsp; | &nbsp;&nbsp;<cfoutput>#dName#</cfoutput> &nbsp;&nbsp;|  &nbsp;&nbsp; <cfoutput>#GetTermName.Term#</cfoutput></font></strong></td><td class="smallText" align="right"><< <a href="search.cfm">Back to Search for a Program</a>&nbsp;&nbsp;&nbsp;</td></tr> --->
<tr><td colspan="2" height="20"></td></tr>
<tr><td colspan="2" class="smallText" align="left" height="20" valign="middle"><font color="#291EGG"><cfoutput>#GetPrograms.recordcount#</cfoutput> programs matched your search</font></td></tr>
 
 <cfif #GetPrograms.recordcount# eq 0>
<tr><td></td><td align="left"><strong>No results found. Please go back to the search page and modify your search.</strong></td></tr>

<cfelse>

<cfoutput query="getPrograms" group="schoolName" groupcasesensitive="no">
<tr><td colspan="2" align="left" class="ProgramTitle" height="25"><strong>#SchoolName#</strong> </td></tr>
<tr><td colspan="2" align="left">
<table cellpadding="0" cellspacing="0" width="100%">
<tr><td colspan="4" height="5"></td></tr>
<tr><td class="borderTopDown" width="5">SOPHAS</td><td class="borderTopDown" >Program</td><td class="borderTopDown" >Degree</td>
<td  class="borderTopDown" width="300">Concentration</td>
</tr>
<cfoutput>

<tr  <cfif #getPrograms.currentRow# mod 2 eq 0>style="background-color:##F2F2F2;"</cfif> ><td class="smallText" valign="middle" align="center" height="25"><cfif #GetPrograms.SOPHASYesNo# eq 'yes'><img src="../images/Search_Check.jpg"><cfelse><img src="../images/Search_Uncheck.jpg"></cfif></td><td align="left"  valign="middle" nowrap><span class="smallText" ><a href="details.cfm?ProgramID=#GetPrograms.ProgramID#" target="_blank">#Trim(GetPrograms.programName)#</a></span> &nbsp;</td><td class="smallText" valign="middle" align="left" nowrap>#GetPrograms.DegreeName# &nbsp;</td><td class="smallText" valign="middle" align="left" width="600"><cfif #GetPrograms.Concentration# eq ''>N/A<cfelse>#GetPrograms.Concentration#</cfif> </td></tr>
</cfoutput>

</table></td></tr>
<tr><td colspan="2" align="left">&nbsp;</td></tr>

</cfoutput>

</cfif>
  </table>
  
  
  </td></tr>
  
  
		  </table>
		 
</td><td background="images/MS_background.jpg">&nbsp;</td></tr>
</table>


</body>
</html>

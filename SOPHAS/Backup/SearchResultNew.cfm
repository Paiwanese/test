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
	padding-left:3px;
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
    padding-left:3px;
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
<!--- <cfif #Form.SearchTag# eq ''>
  <script language="JavaScript">
alert("Please select program.");
history.go(-1);
</script>

</cfif> --->

<!--- <cfif #Form.Degree# eq ''>
  <script language="JavaScript">
alert("Please select degree.");
history.go(-1);
</script>
</cfif> --->

<!--- <cfif #Form.Term# eq '' >
  <script language="JavaScript">
alert("Please select Term.");
history.go(-1);
</script>
</cfif> --->


<cfquery name="GetPrograms" datasource="SOPHAS">
SELECT p.SOPHASYesNo, p.programID, p.ProgramName,p.degreeName, P.CONCENTRATION, t.*, d.degreeID, d.DegreeFullname, s.SchoolName
FROM Programs p
JOIN Terms t on p.termID =t.termID
JOIN degrees d on p.degreeID = d.degreeID
JOIN Schools s on s.schoolID =P.schoolID 
WHERE ProgramID is NOT NUll
<cfif #FORM.choseDegree# eq 1 and #form.DegreeLevel# eq 'allMasters'>
AND p.degreetype = 'masters'
<cfelseif #FORM.choseDegree# eq 1 and #form.DegreeLevel# eq 'allDoctoral'>
AND p.degreetype = 'doctoral'
<cfelseif #FORM.choseDegree# eq 1 and #form.DegreeLevel# eq 'allBachelors'>
AND p.degreetype ='Bachelors'

<cfelse>
<cfif Form.degree neq ''>
AND d.degreeID in (#form.degree#)
</cfif>
</cfif>
<!--- <cfif #form.degree# neq ''>AND d.degreeID in (#Form.Degree#)</cfif> --->

<cfif Isdefined('Form.DualDegree')>
AND p.dualCombined = 'yes'
</cfif>

<cfif #form.SearchTag# neq ''>
AND (p.SearchTag1 in (<cfoutput>#Form.SearchTag#</cfoutput>) 
	OR p.SearchTag2 in (<cfoutput>#Form.SearchTag#</cfoutput>)
	OR p.SearchTag3 in (<cfoutput>#Form.SearchTag#</cfoutput>) )
</cfif>

<cfif #form.schoolID# neq ''>
AND P.SchoolID in(<cfoutput>#Form.schoolID#</cfoutput>)
</cfif>
order by p.schoolName, p.ProgramName
</cfquery> 

<cfif #form.SearchTag# neq ''>
 <cfquery name="GetSearchTag" datasource="SOPHAS">
 select TagName
 from searchTags
 where TagID IN ( <cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#Form.SearchTag#" maxlength="50">)
 </cfquery>
 </cfif>

<cfif #Form.DegreeLevel# eq 'allMasters'>
<cfset dName = 'All Masters'>
<cfelseif #Form.DegreeLevel# eq 'allDoctoral'>
<cfset dName = 'All Doctoral'>
<cfelseif #Form.DegreeLevel# eq 'DualDegree'>
<cfset dName ='All Dual Degree'>
<cfelseif  #Form.DegreeLevel# eq 'allBachelors'>
<cfset dName='All Bachelors'>
 </cfif>
 <cfif #FORM.choseDegree# eq 0>
 <cfif FORM.degree neq ''>
<cfquery name="GetDegreeName" datasource="SOPHAS">
 select DegreeName
 from Degrees
 where DegreeID in (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#Form.degree#" maxlength="100">)
 </cfquery>
 <cfelse>
 <cfset dName ='All Degree'>
</cfif>
</cfif> 
</head>



<!--- <cfdump label="t" var="#FORM#"> --->
<body >
<table cellpadding="0" cellspacing="0" width="680" border="0">


		<tr><td width="680" align="center" class="borderOutside">  
		  <table width="680" cellpadding="0" border="0" cellspacing="0" >
		  <!--- <tr><td colspan="2"><img src="../images/ProgramLists.jpg"></td></tr> --->
		  
		  <tr><td colspan="2"  align="center" height="600" valign="top">
		  
		  <table cellpadding="0" cellspacing="0" width="100%" border="0">
 
<tr><td colspan="2" height="20"></td></tr>
<tr><td colspan="2" align="left" valign="top">
<table cellpadding="0" cellspacing="0" width="100%">
<tr><td><strong>Program Area:</strong></td><td><strong>Degree:</strong></td><td colspan="2"></td></tr>
<tr><td valign="top"><cfif #form.SearchTag# neq ''><cfoutput query="GetSearchTag">#GetSearchTag.TagName#<br></cfoutput><cfelse> All Program Areas</cfif></td>
<td style="padding-left:5px; " valign="top"> <cfif #FORM.choseDegree# eq 0 and #FORM.Degree# neq ''><cfoutput query="GetDegreeName">#DegreeName#<br></cfoutput></cfif> <cfif #FORM.choseDegree# eq 1 or #FORM.Degree# eq ''><cfoutput>#dName#</cfoutput></cfif></td>
<td style="padding-left:5px; " valign="top"><!--- <cfoutput query="GetTermName">#GetTermName.Term#<br></cfoutput> ---></td>
<td class="smallText" align="right"  valign="top"><!--- << <a href="searchNew.cfm">Back to Search for a Program</a> --->&nbsp;&nbsp;&nbsp;</td>
</tr>
</table> 

</td></tr>
<tr><td colspan="2" height="10"></td></tr>
<tr><td colspan="2" align="left">
<table cellpadding="0" cellspacing="0" width="100%">
 
  <form name="SortSearch" action="SearchResultNew.cfm" method="post">
 <tr><td colspan="2" width="10%"align="left" valign="middle"><strong>Sort by</strong>: 
 </td><td align="left" valign="middle"><select name="SortBy">
 <option value="1" <cfif #SortBy# eq 1>selected</cfif>>Degree</option>
 <option value="2" <cfif #SortBy# eq 2>selected</cfif>>Term</option>
 <option value="3" <cfif #SortBy# eq 3>selected</cfif>>Program Name</option>
 <option value="4" <cfif #SortBy# eq 4>selected</cfif>>School</option>
 </select>
 <cfoutput>
 <input type="hidden" name="SchoolID" value="#Form.SchoolID#">
 <input type="hidden" name="SearchTag" value="#Form.SearchTag#">
 <input type="hidden" name="degree" value="#Form.degree#">
 <input type="hidden" name="degreeLevel" value="#Form.degreeLevel#">
 <input type="hidden" name="ChoseDegree" value="#Form.ChoseDegree#">
 <cfif Isdefined('Form.DualDegree')>
 <input type="hidden" name="ChoseDegree" value="#Form.ChoseDegree#">
 </cfif>
 </cfoutput>
 <input type="submit" value="Submit">
 </td></tr>
 </form>
 </table> 

</td></tr>

<tr><td colspan="2" height="20"></td></tr>
<tr><td colspan="2" class="smallText" align="left" height="20" valign="middle"><font color="#291EGG"><cfoutput>#GetPrograms.recordcount#</cfoutput> programs matched your search</font></td></tr>
 
 <cfif #GetPrograms.recordcount# eq 0>
<tr><td></td><td align="left"><strong>No results found. Please go back to the search page and modify your search.</strong></td></tr>

<cfelse>



<tr><td colspan="2" align="left">
<table cellpadding="0" cellspacing="0" width="680" border="0">
<tr><td colspan="5" height="5"></td></tr>

<cfquery dbtype="query" name="ListByProgram">
Select * 
from Getprograms
order by ProgramName
</cfquery>

<cfquery dbtype="query" name="ListBySchoolName">
Select * 
from Getprograms
order by schoolName, programName
</cfquery>

<cfquery dbtype="query" name="ListByTerm">
Select * 
from Getprograms
order by ListID
</cfquery>

<cfquery dbtype="query" name="ListByDegree">
Select * 
from Getprograms
order by DegreeName
</cfquery>

 <cfif #form.sortby# eq 4>  
<cfoutput query="ListBySchoolName"  group="schoolName">
<tr><td colspan="5" align="left" class="ProgramTitle" height="25"><strong>#SchoolName#</strong> </td></tr>
<tr><td colspan="5" height="5"></td></tr>
 <tr>
<td class="borderTopDown" width="8%" height="25">SOPHAS</td>
<td class="borderTopDown" width="8%" >Detail</td>
<td class="borderTopDown" width="15%" >Degree</td>
<td class="borderTopDown" width="44%" >Program Name</td>
<td class="borderTopDown" width="25%">Term</td>
</tr> 
<!---  <tr>
<td class="borderTopDown" style="padding-right:3px; ">SOPHAS</td>
<td class="borderTopDown" style="padding-right:3px; ">Detail</td>
<td class="borderTopDown" style="padding-right:3px; ">Degree</td>
<td class="borderTopDown" style="padding-right:3px; ">Program Name</td>
<td class="borderTopDown" >Term</td>
</tr>  --->
<cfoutput>
 <tr  <cfif #ListBySchoolName.currentRow# mod 2 eq 0>style="background-color:##F2F2F2;"</cfif> >
<td class="smallText" valign="middle" align="center" height="35" ><cfif #ListBySchoolName.SOPHASYesNo# eq 'yes'><img src="../images/Search_Check.jpg" width="15"><cfelse><img src="../images/Search_Uncheck.jpg" width="15"></cfif></td>
<td align="left"  valign="middle" class="smallText" ><a href="details.cfm?ProgramID=#ListBySchoolName.ProgramID#" target="_blank" title="Click to view detail">Detail</a></td>
<td class="smallText" valign="middle" align="left" >#Trim(ListBySchoolName.DegreeName)#</td> 
<td class="smallText" valign="middle" align="left" >#Trim(ListBySchoolName.programName)#</td>
<td class="smallText" valign="middle" align="left" >#Trim(ListBySchoolName.Term)#</td>
</tr> 

<!--- <tr><td width="2%">sdfas</td><td width="3">asdfs</td><td width="%5">asdfasdf</td><td width="30%">#Trim(ListBySchoolName.programName)#</td><td width="60%">fasdf</td></tr> --->
</cfoutput>
<tr><td colspan="5">&nbsp;</td></tr>
</cfoutput>
</table>
</td></tr>
<tr><td colspan="2" align="left">&nbsp;</td></tr>
</cfif>
 

<cfif #form.sortby# eq 3> 
 <cfoutput query="ListByProgram"  group="ProgramName">
<tr><td colspan="5" align="left" class="ProgramTitle" height="25"><strong>#ProgramName#</strong> </td></tr>
<tr><td colspan="5" height="5"></td></tr>
<tr>
<td class="borderTopDown" width="8%" align="left" height="25">SOPHAS</td>
<td class="borderTopDown" width="8%">Detail</td>
<td class="borderTopDown" width="10%">Degree</td>
<td class="borderTopDown" width="54%">School</td>
<td class="borderTopDown" width="20%">Term</td>
</tr>
<cfoutput>
<tr  <cfif #ListByProgram.currentRow# mod 2 eq 0>style="background-color:##F2F2F2;"</cfif> ><td class="smallText" valign="middle" align="center" height="35"><cfif #ListByProgram.SOPHASYesNo# eq 'yes'><img src="../images/Search_Check.jpg" width="15"><cfelse><img src="../images/Search_Uncheck.jpg" width="15"></cfif></td><td align="left"  valign="middle" nowrap><span class="smallText" ><a href="details.cfm?ProgramID=#ListByProgram.ProgramID#" target="_blank">Detail</a></span> &nbsp;</td><td class="smallText" valign="middle" align="left" nowrap>#ListByProgram.DegreeName# &nbsp;</td><td class="smallText" valign="middle" align="left" width="600">#ListByProgram.SchoolName#</td><td>#ListByProgram.Term#</td></tr>
</cfoutput>
<tr><td colspan="5">&nbsp;</td></tr>

</cfoutput>
</table></td></tr>
<tr><td colspan="2" align="left">&nbsp;</td></tr>
</cfif>  
 



<cfif #form.sortby# eq 2>

<cfoutput query="ListByTerm"  group="ListID">
<tr><td colspan="5" align="left" class="ProgramTitle" height="25"><strong>#Term#</strong> </td></tr>
<tr><td colspan="5" height="5"></td></tr>
<tr>
<td class="borderTopDown" width="8%" height="25">SOPHAS</td>
<td class="borderTopDown" width="8%" >Detail</td>
<td class="borderTopDown" width="10%" >Degree</td>
<td class="borderTopDown" width="25%" >Program</td>
<td class="borderTopDown" width="49%" >School</td>
</tr>
<cfoutput>
<tr  <cfif #ListByTerm.currentRow# mod 2 eq 0>style="background-color:##F2F2F2;"</cfif> ><td class="smallText" valign="middle" align="center" height="35"><cfif #ListByTerm.SOPHASYesNo# eq 'yes'><img src="../images/Search_Check.jpg" width="15"><cfelse><img src="../images/Search_Uncheck.jpg" width="15"></cfif></td>
<td class="smallText" valign="middle" align="left"><a href="details.cfm?ProgramID=#ListByTerm.ProgramID#" target="_blank">Detail</a></td>
<td class="smallText" valign="middle" align="left">#ListByTerm.DegreeName#</td>
<td class="smallText" valign="middle" align="left">#Trim(ListByTerm.programName)#</td>
<td class="smallText" valign="middle" align="left" >#ListByTerm.SchoolName#</td></tr>
</cfoutput>
<tr><td colspan="5">&nbsp;</td></tr>

</cfoutput>
</table></td></tr>
<tr><td colspan="2" align="left">&nbsp;</td></tr>
</cfif> 




<cfif #form.sortby# eq 1>
<cfoutput query="ListByDegree"  group="degreeName">

<tr><td colspan="5" align="left" class="ProgramTitle" height="25"><strong>(#degreeName#) #DegreeFullName#</strong> </td></tr>
<tr><td colspan="5" height="5"></td></tr>
<tr>
<td class="borderTopDown" width="8%" height="25">SOPHAS</td>
<td class="borderTopDown" width="8%">Detail</td>
<td class="borderTopDown" width="25%">Program Name</td>
<td  class="borderTopDown" width="45%">School</td>
<td class="borderTopDown" width="14%">Term</td>
</tr>
<cfoutput>
<tr <cfif #ListByDegree.currentRow# mod 2 eq 0>style="background-color:##F2F2F2;"</cfif> >
<td height="35" class="smallText" valign="middle" align="center"><cfif #ListByDegree.SOPHASYesNo# eq 'yes'><img src="../images/Search_Check.jpg" width="15"><cfelse><img src="../images/Search_Uncheck.jpg" width="15"></cfif></td>
<td align="left"  valign="middle" ><span class="smallText" ><a href="details.cfm?ProgramID=#ListByDegree.ProgramID#" target="_blank">Detail</a></span> &nbsp;</td>
<td class="smallText" valign="middle" align="left" >#Trim(ListByDegree.programName)#</td>
<td class="smallText" valign="middle" align="left" >#ListByDegree.schoolName#</td>
<td>#ListByDegree.Term#</td></tr>
</cfoutput>
<tr><td colspan="4">&nbsp;</td></tr>

</cfoutput>
</table></td></tr>
<tr><td colspan="2" align="left">&nbsp;</td></tr>
</cfif>




</cfif>



  </table>
  
  
  </td></tr>
  
  
		  </table>
		 
</td><td background="images/MS_background.jpg">&nbsp;</td></tr>
</table>


</body>
</html>

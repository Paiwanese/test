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
}
.visible {display:block;}
.hidden {display:none;}

-->
</style>

<cfquery name="GetDegree" datasource="SOPHAS">
SELECT *
FROM Degrees
ORDER BY DegreeName
</cfquery>

<cfquery name="GetSchools" datasource="SOPHAS">
SELECT *
FROM schools
order by schoolName
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
<script language="javascript">
function switch2() 
{
var option=['tel1','tel2'];
for(var i=0; i<option.length; i++) 
{ obj=document.getElementById(option[i]);
obj.className=(obj.className=="visible")? "hidden" : "visible"; }
}

</script>
<script type="text/javascript">
<!--
   function initPage()
{
   document.getElementById('tel1').style.display = 'block';
   document.getElementById('tel2').style.display = 'none';
   document.form1.choseDegree[0].checked= true;
}
window.onload = initPage;

function toggleDivs()
{
   var div1 = document.getElementById('tel1');
   var div2 = document.getElementById('tel2');
   //if( div1.style.display == 'block' )
   {
      div1.style.display = 'none';
      div2.style.display = 'block';
   }
  // else 
  // {
  //    div1.style.display = 'block';
  //    div2.style.display = 'none';
  // }
}
	function toggleDivs2()
{
   var div1 = document.getElementById('tel1');
   var div2 = document.getElementById('tel2');
   
   //if( div1.style.display == 'block' )
   {
      div1.style.display = 'block';
      div2.style.display = 'none';
	  
   }
  // else 
  // {
  //    div1.style.display = 'block';
  //    div2.style.display = 'none';
  // }
}
//-->
</script>






<body>
<table cellpadding="0" c cellspacing="0" width="680" >
<form name="form1" method="post" action="SearchResultNew.cfm">
<tr><td class="border-Out" align="center">
 
<table cellpadding="0" c cellspacing="0" width="680" >
<!--- <tr><td><img src="../images/CriteriaSearch.jpg"></td></tr> --->
<tr><td>&nbsp;</td></tr>
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
	<tr><td colspan="2" style="background-color:#F2F2F2"><a name="degree">&nbsp;</td></tr>
	 <tr><td colspan="2" >&nbsp;</td></tr>
	<tr><td colspan="2" class="whiteText" height="25" align="left">Select Degree 
</td></tr>
<tr><td align="left" colspan="2"><input type="radio" name="choseDegree" value="1" onclick="toggleDivs2();" >Search by degree level &nbsp;&nbsp;<input type="radio" name="choseDegree" value="0" onclick="toggleDivs();">Search by degree</td></tr> 

<tr align="left" >
      <td colspan="2" style="padding-top:5px; padding-left:10px;  background-color:#F2F2F2; padding-left:10px;  ">
	  	  <div id="tel1" class="visible">
		 <select name="DegreeLevel" size="10" >
	<option value="" selected > -- Select One -- </option>
	<option value="allBachelors" >All Bachelors</option>
	<option value="allMasters" >All Masters</option>
	<option value="allDoctoral" >All Doctoral</option>
	<!--- <option value="DualDegree" >All Dual Degrees</option> --->
	
	</select> </div> 
	  </td></tr>
	 
	  <tr align="left" >
      <td colspan="2" style="padding-top:5px; padding-left:10px;  background-color:#F2F2F2; padding-left:10px;  ">
	   <div id="tel2" class="hidden">
	  <!---  By Degree Level (<a href="#Degree" onclick="switch2()">By degree</a>)<br>  --->
	  <select name="Degree" size="10" multiple>
	<option value="" selected > -- Select All -- </option>
	
	<cfoutput query="GetDegree">
	<option value="#DegreeID#">#DegreeFullName# <cfif #DegreeID# neq 3>(#DegreeName#)</cfif> </option>
	</cfoutput>
	</select> </div> 
	  </td></tr>
	  
	   <tr><td colspan="2" align="left"  style="background-color:#F2F2F2;" class="CenterText" height="30">Dual Degree Level Only 
	    <input type="checkbox" name="DualDegree"></td></tr>
	  
   <tr><td colspan="2" style="background-color:#F2F2F2">&nbsp;</td></tr>
	  <tr><td colspan="2" >&nbsp;</td></tr>
	 
	 
	 
	 <tr><td colspan="2" class="whiteText" height="25" align="left">Select Schools </td></tr>
	<tr align="left">
	  <td colspan="2" style="padding-top:5px; padding-left:10px; background-color:#F2F2F2;" valign="top" >
	<select name="SchoolID" size="10" multiple  style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif ">
	<option value="" selected>-- All Schools --</option>
	<cfoutput query="GetSchools">
	<option value="#schoolID#">#schoolName#</option>
	</cfoutput>
	
	</select></td></tr>
	<tr><td colspan="2" >&nbsp;</td></tr>
	
	<tr bgcolor="#FFFFFF" ><td height="25" colspan="2"><hr></td> </tr>
	
	 <tr><td colspan="2" class="CenterText" style="padding-top:5px; padding-left:10px;  background-color:#F2F2F2; padding-left:10px;  " align="left"> Sort by: 
 <select name="SortBy" style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif ">
 <option value="1" selected>Degree</option>
 <option value="2">Term</option>
 <option value="3">Program</option>
 <option value="4">School</option>
 </select></td></tr>
   
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

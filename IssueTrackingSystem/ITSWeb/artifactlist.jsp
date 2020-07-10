<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
Artifact objArtifact;
Iteration objIteration;
Phase objPhase;
Project objProject;
User objActor, objUser;
Set setTemp,setTempPro,setTempPhase;
Iterator iter,iterPro,iterPhase;
int intResult,intSubmit;//1=Insert, 2=Delete, 3=Reload Project combobox
String strProjectOption,strPhaseOption,strIterationOption,strArtifactList,strAlert,strError;
String strSelectedProjectID,strSelectedPhaseID,strSelectedIterationID,strSelectedArtifactID;
String strNextPage;

//init variables
objArtifact= new Artifact();
objIteration= new Iteration();
objPhase = new Phase();
objProject = new Project();
objActor=new User();
objUser=new User();
strArtifactList="";
strProjectOption="";
strPhaseOption="";
strIterationOption="";
strError="";
strAlert="";

//get form data

strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
strSelectedPhaseID = Utility.ConvertNullToEmpty(request.getParameter("cboPhase"));
strSelectedIterationID=Utility.ConvertNullToEmpty(request.getParameter("cboIteration"));
strSelectedArtifactID=Utility.ConvertNullToEmpty(request.getParameter("rdoArtifact"));

if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

// select Add/Edit/Delete
if(intSubmit>0){
	switch(intSubmit){
        case 1:
	   	if(strSelectedIterationID !=""){
                  	strNextPage = "addartifact.jsp?IterationID=" + strSelectedIterationID;
                  	response.sendRedirect(strNextPage);
                  	return;
                }
                else
                	strError = "There is no iteration to add artifact";
                break;
        case 2:
 	   	if(strSelectedArtifactID !=""){
                	strNextPage = "updateartifact.jsp?ArtifactID=" + strSelectedArtifactID ;
	        	strNextPage=strNextPage + "&IterationID="+strSelectedIterationID;
                        response.sendRedirect(strNextPage);
                        return;
                }
        	else
                	strError = "You did not select any Artifact to edit";
                break;
        case 3:
        	if(strSelectedArtifactID!=""){
                	objArtifact.setArtifactID(Integer.parseInt(strSelectedArtifactID));
	                intResult = objArtifact.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert(\"The selected Artifact was deleted sucessfully\");";
				break;
	                }
	                else
	                	strError = "Cannot delete this Artifact";
                }
                else
                	strError = "You did not select any Artifact to delete";

        }
}

//Get list of projectss
objActor = (User) session.getAttribute("objuser");
objUser.setUserID(objActor.getUserID());
 // objUser.setUserID(1);
setTempPro = objUser.getListProjectAdminedByUser();
//setTempPro = objProject.getAllProject();
iterPro = setTempPro.iterator();
for (int i=0; iterPro.hasNext();i++ ) {
	objProject = (Project) iterPro.next();
        //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
        if(strSelectedProjectID=="")
        	strSelectedProjectID = Integer.toString(objProject.getProjectID());
        if((strSelectedProjectID!="")&&(Integer.parseInt(strSelectedProjectID)== objProject.getProjectID())){
	       	strProjectOption = strProjectOption + "<option selected value='" + objProject.getProjectID() +"' >" + objProject.getDescription() +"</option>";
        }
	else
        	strProjectOption = strProjectOption + "<option value='" + objProject.getProjectID() +"' >" + objProject.getDescription() +"</option>";
}

//Get list of Phase per Project
if(strSelectedProjectID!=""){
  objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
  objProject.load();
  objPhase.setProject(objProject);
  //objPhase.getListPhase();
  setTempPhase = objPhase.getListPhase();
  iterPhase = setTempPhase.iterator();
  for (int i=0; iterPhase.hasNext();i++ ) {
    objPhase = (Phase) iterPhase.next();
    //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
    if(strSelectedPhaseID=="")
    	strSelectedPhaseID = Integer.toString(objPhase.getPhaseID());
    if((strSelectedPhaseID!="")&&(Integer.parseInt(strSelectedPhaseID)== objPhase.getPhaseID())){
      strPhaseOption = strPhaseOption + "<option selected value='" + objPhase.getPhaseID() +"' >" + objPhase.getDescription() +"</option>";
    }
    else
    strPhaseOption = strPhaseOption + "<option value='" + objPhase.getPhaseID() +"' >" + objPhase.getDescription() +"</option>";
  }
}

//Get list of Iteration per Phase
if(strSelectedPhaseID!=""){
  objPhase.setPhaseID(Integer.parseInt(strSelectedPhaseID));
  objPhase.load();
  objIteration.setPhase(objPhase);
  //objPhase.getListPhase();
  setTemp = objIteration.getListIteration();
  iter = setTemp.iterator();
  for (int i=0; iter.hasNext();i++ ) {
    objIteration = (Iteration) iter.next();
    //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
    if(strSelectedIterationID=="")
    	strSelectedIterationID = Integer.toString(objIteration.getIterationID());
    if((strSelectedIterationID!="")&&(Integer.parseInt(strSelectedIterationID)== objIteration.getIterationID())){
      strIterationOption = strIterationOption + "<option selected value='" + objIteration.getIterationID() +"' >" + objIteration.getDescription() +"</option>";
    }
    else
    strIterationOption = strIterationOption + "<option value='" + objIteration.getIterationID() +"' >" + objIteration.getDescription() +"</option>";
  }
}
//************************************
if(strSelectedIterationID!=""){
	//Get list of  Artifact based on IterationID
        objIteration.setIterationID(Integer.parseInt(strSelectedIterationID));
  	objArtifact.setIteration(objIteration);
        setTemp = objArtifact.getListArtifact();
	iter = setTemp.iterator();
	for (int i=0; iter.hasNext();i++ ) {
		objArtifact = (Artifact) iter.next();
	        if((i%2)==0){
			strArtifactList = strArtifactList 	+ "<tr>";
                        strArtifactList = strArtifactList 		+ "<td width=\"173\" class=\"EvenTableRow\">" + Integer.toString(objArtifact.getArtifactID() )+ "</td>";
			strArtifactList = strArtifactList		+ "<td class=\"EvenTableRow\">" + objArtifact.getDescription() +  "</td>";
			strArtifactList = strArtifactList		+ "<td class=\"EvenTableRow\">";
			strArtifactList = strArtifactList		+ "<input type=\"radio\" value=\"" + Integer.toString(objArtifact.getArtifactID()) + "\" checked name=\"rdoArtifact\"></td>";
			strArtifactList = strArtifactList 	+ "</tr>";

	        }
		else{
			strArtifactList = strArtifactList 	+ "<tr>";
                        strArtifactList = strArtifactList 		+ "<td width=\"173\" class=\"OddTableRow\">" + Integer.toString(objArtifact.getArtifactID() )+ "</td>";
			strArtifactList = strArtifactList		+ "<td class=\"OddTableRow\">" + objArtifact.getDescription() +  "</td>";
			strArtifactList = strArtifactList		+ "<td class=\"OddTableRow\">";
			strArtifactList = strArtifactList		+ "<input type=\"radio\" value=\"" + Integer.toString(objArtifact.getArtifactID()) + "\" checked name=\"rdoArtifact\"></td>";
			strArtifactList = strArtifactList 	+ "</tr>";

	        }

	}
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link href="style/formstyle.css" type=text/css rel=stylesheet>
<script type="" language="javascript" >
function Init(){
	<%
		if((intSubmit>0)&&(strError=="")){
			out.println(strAlert);
		}
	%>
}
function Submit(p_intNumber){
      document.frmArtifact.txtAction.value=p_intNumber;
      document.frmArtifact.submit();
    }
function LoadProject(){

  document.frmArtifact.txtAction.value=0;
  document.frmArtifact.submit();
}
</script>
<title>Artifact List</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menuprojectadmin.jsp" flush="true"/>
	<tr>
		<td>
		<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
			<tr>
				<td>&nbsp;</td>
			</tr>
                        <tr>
			        <td align="center"><font color="#ff0000"><%=strError%></font></td>
                        </tr>
			<tr>
				<td class="ListTitle">
				<p align="center">Artifact List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmArtifact" method="POST" action="artifactlist.jsp">
							<table border="0" width="100%" id="table10" cellspacing="0" cellpadding="0">
								<tr>
									<td align=center>
									<table border="0" width="100%" id="table11" cellspacing="0" cellpadding="0" class="TableBorderFrm">
										<tr>
											<td class="OddTableRow">Project</td>
											<td class="OddTableRow" width="119">
											<select size="1" name="cboProject" class="ComboBoxStyle" onchange="javascript:LoadProject();">
											<%=strProjectOption %>
											</select></td>
											<td class="OddTableRow" width="48">
									Phase</td>
											<td class="OddTableRow" width="111">
											<select size="1" name="cboPhase" class="ComboBoxStyle" onchange="javascript:LoadProject();">
											<%=strPhaseOption %>
											</select></td>
											<td class="OddTableRow" width="56">
									Iteration</td>
											<td class="OddTableRow" width="102">
											<select size="1" name="cboIteration" class="ComboBoxStyle">
											<%=strIterationOption %>
											</select></td>
											<td class="OddTableRow" width="64">
									<input type="button" value="Apply" name="btnApply" class="ButtonStyle" onclick="javascript:Submit(4);"></td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							<br>
							<table border="0" width="100%" id="table8" class="BorderTable">
								<tr>
									<td class="HeaderTable" width="165">
									Artifact ID</td>
									<td class="HeaderTable">Artifact Name</td>
									<td class="HeaderTable">Select</td>
								</tr>
								<%=strArtifactList%>
							</table>
							<table border="0" width="100%" id="table9">
								<tr>
									<td width="30%">&nbsp;</td>
									<td width="20%">
									<input type="button" value="Add" name="btnAdd" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
									<td width="20%">
									<input type="button" value="Update" name="btnUpdate" class="ButtonStyle" onclick="javascript:Submit(2);"></td>
									<td width="30%">
									<input type="button" value="Delete" name="btnDelete" class="ButtonStyle" onclick="javascript:Submit(3);"></td>
								</tr>
							</table>
                                                        <input name=txtAction ID=txtAction value="0" type=hidden>
						</form>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" flush="true"/>


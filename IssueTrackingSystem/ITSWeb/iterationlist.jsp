<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
Iteration objIteration;
Phase objPhase;
Project objProject;
User objActor, objUser;
Set setTemp,setTempPro,setTempPhase;
Iterator iter,iterPro,iterPhase;
int intResult,intSubmit;//1=Insert, 2=Delete, 3=Reload Project combobox
String strProjectOption,strPhaseOption,strIterationList,strAlert,strError;
String strSelectedProjectID,strSelectedPhaseID,strSelectedIterationID;
String strNextPage;

//init variables
objIteration= new Iteration();
objPhase = new Phase();
objProject = new Project();
objActor=new User();
objUser=new User();
strIterationList="";
strProjectOption="";
strPhaseOption="";
strError="";
strAlert="";

//get form data

strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
strSelectedPhaseID = Utility.ConvertNullToEmpty(request.getParameter("cboPhase"));
strSelectedIterationID=Utility.ConvertNullToEmpty(request.getParameter("rdoIteration"));

if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

// select Add/Edit/Delete
if(intSubmit>0){
	switch(intSubmit){
        case 1:
	   	if(strSelectedPhaseID !=""){
                  	strNextPage = "additeration.jsp?PhaseID=" + strSelectedPhaseID;
                  	response.sendRedirect(strNextPage);
                  	return;
                }
                else
                	strError = "There is no phase to add Iteration";
                break;
        case 2:
 	   	if(strSelectedIterationID !=""){
                	strNextPage = "updateiteration.jsp?IterationID=" + strSelectedIterationID ;
	        	strNextPage=strNextPage + "&PhaseID="+strSelectedPhaseID;
                        response.sendRedirect(strNextPage);
                        return;
                }
        	else
                	strError = "You did not select any iteration to edit";
                break;
        case 3:
        	if(strSelectedIterationID!=""){
                	objIteration.setIterationID(Integer.parseInt(strSelectedIterationID));
	                intResult = objIteration.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert(\"The selected iteration was deleted sucessfully\");";
				break;
	                }
	                else
	                	strError = "Cannot delete this iteration";
                }
                else
                	strError = "You did not select any iteration to delete";

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

if(strSelectedPhaseID!=""){
	//Get list of  iteration based on phaseID
        objPhase.setPhaseID(Integer.parseInt(strSelectedPhaseID));
  	objIteration.setPhase(objPhase);
        setTemp = objIteration.getListIteration();
	iter = setTemp.iterator();
	for (int i=0; iter.hasNext();i++ ) {
		objIteration = (Iteration) iter.next();
	        if((i%2)==0){
			strIterationList = strIterationList 	+ "<tr>";
                        strIterationList = strIterationList 		+ "<td width=\"173\" class=\"EvenTableRow\">" + Integer.toString(objIteration.getIterationID() )+ "</td>";
			strIterationList = strIterationList		+ "<td class=\"EvenTableRow\">" + objIteration.getDescription() +  "</td>";
			strIterationList = strIterationList		+ "<td class=\"EvenTableRow\">";
			strIterationList = strIterationList		+ "<input type=\"radio\" value=\"" + Integer.toString(objIteration.getIterationID()) + "\" checked name=\"rdoIteration\"></td>";
			strIterationList = strIterationList 	+ "</tr>";

	        }
		else{
			strIterationList = strIterationList 	+ "<tr>";
                        strIterationList = strIterationList 		+ "<td width=\"173\" class=\"OddTableRow\">" + Integer.toString(objIteration.getIterationID() )+ "</td>";
			strIterationList = strIterationList		+ "<td class=\"OddTableRow\">" + objIteration.getDescription() +  "</td>";
			strIterationList = strIterationList		+ "<td class=\"OddTableRow\">";
			strIterationList = strIterationList		+ "<input type=\"radio\" value=\"" + Integer.toString(objIteration.getIterationID()) + "\"  name=\"rdoIteration\"></td>";
			strIterationList = strIterationList 	+ "</tr>";

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
      document.frmIteration.txtAction.value=p_intNumber;
      document.frmIteration.submit();
    }

function LoadProject(){

        document.frmIteration.submit();
}

</script>
<title>Iteration List</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menuprojectadmin.jsp" flush="true"/>
	<tr>
		<td>
		<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
			<tr>
				<td align="center"><font color="#ff0000"><%=strError%></font></td>
			</tr>
			<tr>
				<td class="ListTitle">
				<p align="center">Iteration List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmIteration" method="POST" action="iterationlist.jsp">
							<table border="0" width="100%" id="table10" cellspacing="0" cellpadding="0">
								<tr>
									<td align=center>
									<table border="0" width="70%" id="table11" cellspacing="0" cellpadding="0" class="TableBorderFrm">
										<tr>
											<td class="OddTableRow">Project</td>
											<td class="OddTableRow" width="105">
											<select size="1" name="cboProject" class="ComboBoxStyle" onchange="javascript:LoadProject();">
											<%=strProjectOption %></select></td>
											<td class="OddTableRow" width="58">
									Phase</td>
											<td class="OddTableRow" width="107">
											<select size="1" name="cboPhase" class="ComboBoxStyle">
											<%=strPhaseOption %></select></td>
											<td class="OddTableRow" width="60">
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
									Iteration ID</td>
									<td class="HeaderTable">Iteration Name</td>
									<td class="HeaderTable">Select</td>
								</tr>
								<%=strIterationList%>
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
                                                        <input name=txtAction ID=txtAction value="" type=hidden>

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
</body>
</html>

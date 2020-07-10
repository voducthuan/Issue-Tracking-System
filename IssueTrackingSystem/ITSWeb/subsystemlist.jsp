<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
SubSystem objSubsystem;
Domain objDomain;
Project objProject;
User objActor, objUser;
Set setTemp;
Iterator iter;
int intResult,intSubmit;//1=Insert, 2=Delete, 3=Reload Project combobox
String strProjectOption,strDomainOption,strSubSystemList,strAlert,strError;
String strSelectedProjectID,strSelectedDomainID,strSelectedSubSytemID;
String strNextPage;

//init variables
objSubsystem= new SubSystem();
objDomain = new Domain();
objProject = new Project();
objActor=new User();
objUser=new User();
strSubSystemList="";
strProjectOption="";
strDomainOption="";
strError="";
strAlert="";

//get form data

strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
strSelectedDomainID = Utility.ConvertNullToEmpty(request.getParameter("cboDomain"));
strSelectedSubSytemID=Utility.ConvertNullToEmpty(request.getParameter("rdoSubSystem"));

if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

// select Add/Edit/Delete
if(intSubmit>0){
	switch(intSubmit){
        case 1:
	   	if(strSelectedDomainID !=""){
                  	strNextPage = "addsubsystem.jsp?DomainID=" + strSelectedDomainID;
                  	response.sendRedirect(strNextPage);
                  	return;
                }
                else
                	strError = "There is no Domain to add Subsystem";
                break;
        case 2:
 	   	if(strSelectedSubSytemID !=""){
                	strNextPage = "updatesubsystem.jsp?SubSystemID=" + strSelectedSubSytemID ;
	        	strNextPage=strNextPage + "&DomainID="+strSelectedDomainID;
                        response.sendRedirect(strNextPage);
                        return;
                }
        	else
                	strError = "You did not select any Subsystem to edit";
                break;
        case 3:
        	if(strSelectedSubSytemID!=""){
                	objSubsystem.setSubSystemID(Integer.parseInt(strSelectedSubSytemID));
	                intResult = objSubsystem.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert(\"The selected Subsystem was deleted sucessfully\");";
				break;
	                }
	                else
	                	strError = "Cannot delete this Subsystem";
                }
                else
                	strError = "You did not select any iteration to delete";

        }
}

//Get list of projectss
objActor = (User) session.getAttribute("objuser");
objUser.setUserID(objActor.getUserID());
 // objUser.setUserID(1);
setTemp = objUser.getListProjectAdminedByUser();
//setTempPro = objProject.getAllProject();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objProject = (Project) iter.next();
        //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
        if(strSelectedProjectID=="")
        	strSelectedProjectID = Integer.toString(objProject.getProjectID());
        if((strSelectedProjectID!="")&&(Integer.parseInt(strSelectedProjectID)== objProject.getProjectID())){
	       	strProjectOption = strProjectOption + "<option selected value='" + objProject.getProjectID() +"' >" + objProject.getDescription() +"</option>";
        }
	else
        	strProjectOption = strProjectOption + "<option value='" + objProject.getProjectID() +"' >" + objProject.getDescription() +"</option>";
}

//Get list of Domian per Project
if(strSelectedProjectID!=""){
  objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
  objProject.load();
  objDomain.setProject(objProject);
  //objPhase.getListPhase();
  setTemp = objDomain.getListDomain();
  iter = setTemp.iterator();
  for (int i=0; iter.hasNext();i++ ) {
    objDomain = (Domain) iter.next();
    //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
    if(strSelectedDomainID=="")
    	strSelectedDomainID = Integer.toString(objDomain.getDomainID());
    if((strSelectedDomainID!="")&&(Integer.parseInt(strSelectedDomainID)== objDomain.getDomainID())){
      strDomainOption = strDomainOption + "<option selected value='" + objDomain.getDomainID() +"' >" + objDomain.getName() +"</option>";
    }
    else
    strDomainOption = strDomainOption + "<option value='" + objDomain.getDomainID() +"' >" + objDomain.getName() +"</option>";
  }
}

if(strSelectedDomainID!=""){
	//Get list of  subsystem based on DomainID
        objDomain.setDomainID(Integer.parseInt(strSelectedDomainID));
  	objSubsystem.setDomain(objDomain);
        setTemp = objSubsystem.getListSubSystem();
	iter = setTemp.iterator();
	for (int i=0; iter.hasNext();i++ ) {
		objSubsystem = (SubSystem) iter.next();
	        if((i%2)==0){
			strSubSystemList = strSubSystemList 	+ "<tr>";
                        strSubSystemList = strSubSystemList 		+ "<td width=\"173\" class=\"EvenTableRow\">" + Integer.toString(objSubsystem.getSubSystemID() )+ "</td>";
			strSubSystemList = strSubSystemList		+ "<td class=\"EvenTableRow\">" + objSubsystem.getName() +  "</td>";
			strSubSystemList = strSubSystemList		+ "<td class=\"EvenTableRow\">";
			strSubSystemList = strSubSystemList		+ "<input type=\"radio\" value=\"" + Integer.toString(objSubsystem.getSubSystemID()) + "\" checked name=\"rdoSubSystem\"></td>";
			strSubSystemList = strSubSystemList 	+ "</tr>";

	        }
		else{
			strSubSystemList = strSubSystemList 	+ "<tr>";
                        strSubSystemList = strSubSystemList 		+ "<td width=\"173\" class=\"OddTableRow\">" + Integer.toString(objSubsystem.getSubSystemID() )+ "</td>";
			strSubSystemList = strSubSystemList		+ "<td class=\"OddTableRow\">" + objSubsystem.getName() +  "</td>";
			strSubSystemList = strSubSystemList		+ "<td class=\"OddTableRow\">";
			strSubSystemList = strSubSystemList		+ "<input type=\"radio\" value=\"" + Integer.toString(objSubsystem.getSubSystemID()) + "\" checked name=\"rdoSubSystem\"></td>";
			strSubSystemList = strSubSystemList 	+ "</tr>";

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
      document.frmSubSystem.txtAction.value=p_intNumber;
      document.frmSubSystem.submit();
    }

function LoadProject(){

        document.frmSubSystem.submit();
}

</script>
<title>SubSystem List</title>
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
				<p align="center">Subsystem List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmSubSystem" method="POST" action="subsystemlist.jsp">
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
									Domain</td>
											<td class="OddTableRow" width="107">
											<select size="1" name="cboDomain" class="ComboBoxStyle">
											<%=strDomainOption %></select></td>
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
									Subsystem ID</td>
									<td class="HeaderTable">Subsystem Name</td>
									<td class="HeaderTable">Select</td>
								</tr>
								<%=strSubSystemList%>
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

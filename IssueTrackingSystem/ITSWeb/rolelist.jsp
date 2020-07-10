<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
Role objRole;
Project objProject;
Set setTemp;
Iterator iter;
int intResult,intSubmit;//1=Insert, 2=Delete, 3=Reload Project combobox
String strProjectOption,strRoleList,strAlert,strError,strSelectedProjectID, strSelectedRoleID;
String strNextPage;

//init variables
objRole = new Role();
objProject = new Project();
User objActor=new User();
User objUser=new User();
strRoleList="";
strProjectOption="";
strError="";
strAlert="";

//get form data

strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
strSelectedRoleID=Utility.ConvertNullToEmpty(request.getParameter("rdoRole"));

if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

// select Add/Edit/Delete
if(intSubmit>0){
	switch(intSubmit){
        case 1:
	   	if(strSelectedProjectID !=""){
                  	strNextPage = "addrole.jsp?ProjectID=" + strSelectedProjectID;
                  	response.sendRedirect(strNextPage);
                  	return;
                }
                else
                	strError = "There is no Project to add Role";
                break;
        case 2:
 	   	if(strSelectedRoleID !=""){
                	strNextPage = "updaterole.jsp?RoleID=" + strSelectedRoleID ;
	        	strNextPage=strNextPage + "&ProjectID="+strSelectedProjectID;
                        response.sendRedirect(strNextPage);
                        return;
                }
        	else
                	strError = "You did not select any Role to edit";
                break;
        case 3:
        	if(strSelectedRoleID!=""){
                	objRole.setRoleID(Integer.parseInt(strSelectedRoleID));
	                intResult = objRole.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert('The selected Role was deleted sucessfully');";
				break;
	                }
	                else
	                	strError = "Cannot delete this Role";
                }
                else
                	strError = "You did not select any Role to delete";

        }
}

//Get list of projectss
objActor = (User) session.getAttribute("objuser");
objUser.setUserID(objActor.getUserID());
 // objUser.setUserID(1);
setTemp = objUser.getListProjectAdminedByUser();
//setTemp = objProject.getAllProject();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objProject = (Project) iter.next();
        //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
        if(strSelectedProjectID=="")
        	strSelectedProjectID = Integer.toString(objProject.getProjectID());
        if((strSelectedProjectID!="")&&(Integer.parseInt(strSelectedProjectID)== objProject.getProjectID())){
	       	strProjectOption = strProjectOption + "<option selected value='" + objProject.getProjectID() +"' >" + objProject.getDescription() +"</option><br>";
        }
	else
        	strProjectOption = strProjectOption + "<option value='" + objProject.getProjectID() +"' >" + objProject.getDescription() +"</option><br>";
}

if(strSelectedProjectID!=""){
	//Get list of  phase based on projectID
        objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
  	objRole.setProject(objProject);
        setTemp = objRole.getListProjectRole();
	iter = setTemp.iterator();
	for (int i=0; iter.hasNext();i++ ) {
		objRole = (Role) iter.next();
	        if((i%2)==0){
			strRoleList = strRoleList 	+ "<tr>";
                        strRoleList = strRoleList 		+ "<td width=\"173\" class=\"EvenTableRow\">" + Integer.toString(objRole.getRoleID() )+ "</td>";
			strRoleList = strRoleList		+ "<td class=\"EvenTableRow\">" + objRole.getName() +  "</td>";
			strRoleList = strRoleList		+ "<td class=\"EvenTableRow\">";
			strRoleList = strRoleList		+ "<input type=\"radio\" value=\"" + Integer.toString(objRole.getRoleID()) + "\" checked name=\"rdoRole\"></td>";
			strRoleList = strRoleList 	+ "</tr>";

	        }
		else{
			strRoleList = strRoleList 	+ "<tr>";
                        strRoleList = strRoleList 		+ "<td width=\"173\" class=\"OddTableRow\">" + Integer.toString(objRole.getRoleID() )+ "</td>";
			strRoleList = strRoleList		+ "<td class=\"OddTableRow\">" + objRole.getName() +  "</td>";
			strRoleList = strRoleList		+ "<td class=\"OddTableRow\">";
			strRoleList = strRoleList		+ "<input type=\"radio\" value=\"" + Integer.toString(objRole.getRoleID()) + "\" checked name=\"rdoRole\"></td>";
			strRoleList = strRoleList 	+ "</tr>";

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
      document.frmRole.txtAction.value=p_intNumber;
      document.frmRole.submit();
    }
</script>
<title>Role List</title>
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
				<p align="center">Role List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmRole" method="POST" action="rolelist.jsp">
							<table border="0" width="100%" id="table10" cellspacing="0" cellpadding="0">
								<tr>
									<td align=center>
									<table border="0" width="50%" id="table11" cellspacing="0" cellpadding="0" class="TableBorderFrm">
										<tr>
											<td class="OddTableRow">Project</td>
											<td class="OddTableRow">
											<select size="1" name="cboProject" class="ComboBoxStyle">
											<%=strProjectOption %></select></td>
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
									Role ID</td>
									<td class="HeaderTable">Role Name</td>
									<td class="HeaderTable">Select</td>
								</tr>
                                                                <%=strRoleList%>
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



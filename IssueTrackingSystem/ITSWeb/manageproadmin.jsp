<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>

<%
User objUser;
Project objProject;
Set setTemp;
Iterator iter;

int intResult,intSubmit;//1=Insert, 2=Delete, 3=Reload Project combobox
String strProjectOption,strUserOption,strUserList,strAlert,strError,strSelectedProjectID;
//strInUserID = User to delete right of project admin
//strOutUserID = User to insert right of project admin
String strInUserID,strOutUserID;



//init variables
objUser = new User();
objProject = new Project();
strUserList="";
strUserOption="";
strProjectOption="";
strError="";
strAlert="";

//get form data
if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
strOutUserID = Utility.ConvertNullToEmpty(request.getParameter("cboUser"));
strInUserID = Utility.ConvertNullToEmpty(request.getParameter("txtSelectedUserID"));

//Insert or Delete a user have right of project admin
if(intSubmit>0){


	switch(intSubmit){
        case 1://Insert a new project admin

		if(strOutUserID!=""){
	        	objUser.setUserID(Integer.parseInt(strOutUserID));
	                AdminSystemRight objAdminRight = new AdminSystemRight();
                        objAdminRight.setSystemRightID(3); // 3 = project admin
                        objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
                        intResult = objUser.addAdminSystemRight(objAdminRight,objProject);
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert('The selected user was inserted sucessfully');";
	                }
	                else
	                	strError = "Cannot insert this user";
        	}
                else
                	strError = "You did not select any user to insert";
                break;
        case 2://Remove selected user of list of project admin

		if(strInUserID!=""){
	        	objUser.setUserID(Integer.parseInt(strInUserID));
			AdminSystemRight objAdminRight = new AdminSystemRight();
                        objAdminRight.setSystemRightID(3); // 3 = project admin
                        objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
                        intResult = objUser.removePorjectAdminRight(objAdminRight,objProject);
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert('The selected user has been removed of list of company admin');";
				break;
	                }
	                else
	                	strError = "Cannot delete this user";
        	}
                else
                	strError = "You did not select any user to delete";
        }
}

//Get list of projectss
setTemp = objProject.getAllProject();
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
	//Get list of  users who have not right of project admin
        objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
  	setTemp = objUser.getListUserNotProjectAdmin(objProject);
	iter = setTemp.iterator();
	for (int i=0; iter.hasNext();i++ ) {
		objUser = (User) iter.next();
	        strUserOption = strUserOption + "<option value='" + objUser.getUserID() +"' >" + objUser.getFullName() +"</option><br>";
	}
	//Get list of  users who have right of project admin
        setTemp = objUser.getListUserProjectAdmin(objProject);
	iter = setTemp.iterator();
	for (int i=0; iter.hasNext();i++ ) {
		objUser = (User) iter.next();
	        if((i%2)==0){
			strUserList = strUserList + "<tr>";
			strUserList = strUserList	+ "<td class=\"EvenTableRow\">" + objUser.getUserName() + "</td>";
			strUserList = strUserList	+ "<td class=\"EvenTableRow\" align=\"center\">";
			strUserList = strUserList	+	"<img border=\"0\" src=\"images/trash.gif\" width=\"14\" height=\"14\" onclick=\"javascript:Delete(" + Integer.toString(objUser.getUserID()) + ");\"></td>";
			strUserList = strUserList + "</tr>";

	        }
		else{
		       	strUserList = strUserList + "<tr>";
			strUserList = strUserList	+ "<td class=\"OddTableRow\">" + objUser.getUserName() + "</td>";
			strUserList = strUserList	+ "<td class=\"OddTableRow\" align=\"center\">";
			strUserList = strUserList	+	"<img border=\"0\" src=\"images/trash.gif\" width=\"14\" height=\"14\" onclick=\"javascript:Delete(" + Integer.toString(objUser.getUserID()) + ");\"></td>";
			strUserList = strUserList + "</tr>";
	        }

	}
}




%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<script type="" language="javascript" >

function Init(){
	<%
	if((intSubmit>0)&&(strError=="")){
		out.println(strAlert);
        }
	%>
}

function Insert(){
      document.frmProAdmin.txtAction.value=1;
      document.frmProAdmin.submit();
}

function Delete(p_intUserID){
      document.frmProAdmin.txtAction.value=2;
      document.frmProAdmin.txtSelectedUserID.value=p_intUserID;
      document.frmProAdmin.submit();
}

function LoadProject(){
	/*var intProjectID;
        intProjectID = document.frmProAdmin.cboProject[document.frmProAdmin.cboProject.selectedIndex].value;
        alert(intProjectID);*/
        document.frmProAdmin.submit();
}

</script>
<link href="style/formstyle.css" type=text/css rel=stylesheet>
<title>Manage project administrators</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menuapplicationadmin.jsp" flush="true"/>
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
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<form name = "frmProAdmin" method="POST" action="manageproadmin.jsp">

				<table border="0" width="30%" id="table7" class="TableBorderFrm">
					<tr>
						<td class="CellBorderCaptionFrm" width="40%">
						<p align="center">Project</td>
						<td class="CellBorderCaptionFrm" width="50%">
						<p align="center">User</td>
						<td class="CellBorderCaptionFrm" width="10%">
						&nbsp;</td>
					</tr>
					<tr>
						<td class="CellBorderFrm" width="40%">
									<select size="1" name="cboProject" class="ComboBoxStyle" onchange="javascript:LoadProject();">
										<%=strProjectOption %>
									</select></td>
						<td class="CellBorderFrm" width="50%">
									<select size="1" name="cboUser" class="ComboBoxStyle">
										<%=strUserOption %>
									</select></td>
						<td class="CellBorderFrm" width="10%">
									<input type="button" value="Insert" name="btnInsert" class="ButtonStyle" onclick="javascript:Insert();"></td>
					</tr>
				</table>
				<input name=txtAction ID=txtAction value="" type=hidden>
                                <input name=txtSelectedUserID ID=txtSelectedUserID value="" type=hidden>
				</form>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="30%" id="table9" class="BorderTable">
					<tr>
						<td class="HeaderTable">
						<p align="center">Users</td>
						<td class="HeaderTable">&nbsp;</td>
					</tr>
					<%=strUserList %>
				</table>
				</td>
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

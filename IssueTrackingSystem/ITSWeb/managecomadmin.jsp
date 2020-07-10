<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>

<%
User objUser;
Set setTemp;
Iterator iter;

int intResult,intSubmit;//1=Insert, 2=Delete
String strUserOption,strUserList,strAlert,strError,strSelectedUserID;

//init variables
objUser = new User();
strUserList="";
strUserOption="";
strError="";
strAlert="";

//get form data
if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

if(intSubmit>0){


	switch(intSubmit){
        case 1://Insert a new company admin
        	strSelectedUserID = Utility.ConvertNullToEmpty(request.getParameter("cboUser"));
		if(strSelectedUserID!=""){
	        	objUser.setUserID(Integer.parseInt(strSelectedUserID));
	                Project objProject = new Project();
                        AdminSystemRight objAdminRight = new AdminSystemRight();
                        objAdminRight.setSystemRightID(1);
                        objProject.setProjectID(0);//this ID has no use
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
        case 2://Remove selected user of list of company admin
 	   	strSelectedUserID = Utility.ConvertNullToEmpty(request.getParameter("txtSelectedUserID"));
		if(strSelectedUserID!=""){
	        	objUser.setUserID(Integer.parseInt(strSelectedUserID));
	                AdminSystemRight objAdminRight = new AdminSystemRight();
                        objAdminRight.setSystemRightID(1);
                        intResult = objUser.removeCompanyAdminRight(objAdminRight);
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

//Get list of  users who have not right of company admin
setTemp = objUser.getListUserNotCompanyAdmin();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objUser = (User) iter.next();
        strUserOption = strUserOption + "<option value='" + objUser.getUserID() +"' >" + objUser.getFullName() +"</option><br>";
}

//Get list of  users who have right of company admin
setTemp = objUser.getListUserCompanyAdmin();
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
      document.frmComAdmin.txtAction.value=1;
      document.frmComAdmin.submit();
}

function Delete(p_intUserID){
      document.frmComAdmin.txtAction.value=2;
      document.frmComAdmin.txtSelectedUserID.value=p_intUserID;
      document.frmComAdmin.submit();
}
</script>
<link href="style/formstyle.css" type=text/css rel=stylesheet>
<title>Manage company administrator</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">

<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menucompanyadmin.jsp" flush="true"/>
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
				<form name = "frmComAdmin" method="POST" action="managecomadmin.jsp">

				<table border="0" width="30%" id="table7" class="TableBorderFrm">
					<tr>
						<td class="CellBorderCaptionFrm" colspan="2">
						<p align="center">User</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
									<select size="1" name="cboUser" class="ComboBoxStyle">
										<%=strUserOption %>
									</select></td>
						<td class="CellBorderFrm">
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

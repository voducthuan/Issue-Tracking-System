<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>

<%
String strLoginName,strPassword,strFullName,strEmail,strSubmit,strDeptOptions,strTemp;
String strError="",strAlert="";
int intDeptID,intResult=-1;
Department objDept;
Set setTemp;
Iterator iter;
User objUser;
//Init variables
strDeptOptions = "";

//Get form data
strLoginName = Utility.ConvertNullToEmpty(request.getParameter("txtLoginName"));
strPassword = Utility.ConvertNullToEmpty(request.getParameter("txtPassword"));
strFullName = Utility.ConvertNullToEmpty(request.getParameter("txtFullName"));
strEmail = Utility.ConvertNullToEmpty(request.getParameter("txtEmail"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));
strTemp = Utility.ConvertNullToEmpty(request.getParameter("cboDepartment"));

if(strTemp!=""){
	intDeptID = Integer.parseInt(strTemp);
}
else
	intDeptID = 0;
//Get dapartment
objDept = new Department();
setTemp = objDept.getAllDepartment();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objDept = (Department) iter.next();
        if(objDept.getDepartmentID()==intDeptID)
             strDeptOptions = strDeptOptions + "<option  selected value='" + objDept.getDepartmentID() + "' >" + objDept.getDescription() +"</option><br>";
        else
             strDeptOptions = strDeptOptions + "<option value='" + objDept.getDepartmentID() +"' >" + objDept.getDescription() +"</option><br>";
      }
//check if this form was submited
if(strSubmit!=""){
	objUser = new User();
        objUser.setUser(0,strLoginName,strFullName,strPassword,strEmail);
        objDept.setDepartmentID(intDeptID);
        intResult = objUser.add(objDept);
        if(intResult==SysConstant.OK){
        	//response.sendRedirect("userlist.jsp");
        	strAlert = "alert('Create new user sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "userlist.jsp\";";

        }
        else if(intResult==SysConstant.ERROR_DUPLICATE)
        	strError = "Add fail, This username is already exist.";
        else
        	strError = "Add fail, Please check data and try again.";
}

%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link href="style/formstyle.css" type=text/css rel=stylesheet>
<script type="" language="javascript" >

function Init(){
	<%
		if((strSubmit!="")&&(strError=="")){
			out.println(strAlert);
		}
	%>
}


function Submit(p_intNumber){
	if(!IsValidForm()){
		document.frmAddUser.txtAction.value=p_intNumber;
        	document.frmAddUser.submit();
        }
}

function IsValidForm()
{

  	if(frmAddUser.txtLoginName.value=="")
	{
		alert("Login name cannot be null");
		frmAddUser.txtLoginName.focus();
		return true;
	}
	if(frmAddUser.txtPassword.value=="")
	{
		alert("Password cannot be null");
		frmAddUser.txtPassword.focus();
		return true;
	}

	return false;

}

</script>

<title>Add User</title>
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
				<table border="0" width="40%" id="table7" class="TableBorderFrm">
					<tr>
						<td class="CellBorderCaptionFrm">
						<img border="0" src="images/login.gif" width="16" height="16">User
						profile</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmAddUser" method="POST" action="adduser.jsp">

							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Login Name</td>
									<td>
									<input type="text" name="txtLoginName" value='<%=strLoginName%>' size="20" class="TextBoxStyle" maxlength="20"></td>
								</tr>
								<tr>
									<td class="Label">Password</td>
									<td>
									<input type="password" name="txtPassword" value='<%=strPassword%>' size="20" class="TextBoxStyle" maxlength="64"></td>
								</tr>
								<tr>
									<td class="Label">Full Name</td>
									<td>
									<input type="text" name="txtFullName" value='<%=strFullName%>' size="20" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td class="Label">Email</td>
									<td>
									<input type="text" name="txtEmail" value='<%=strEmail%>' size="20" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td class="Label">Department</td>
									<td>
									<select size="1" name="cboDepartment" class="ComboBoxStyle">
										<%=strDeptOptions %>
									</select></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
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
				<td>
				<p align="center">&nbsp;</td>
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

<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>


<%
String strUserID,strLoginName,strPassword,strFullName,strEmail,strSubmit,strDeptOptions,strDeptID;
String strError="",strAlert="";
int intDeptID,intResult=-1;
Department objDept;
Set setTemp;
Iterator iter;
User objUser;
//Init variables
strDeptOptions = "";
objDept = new Department();

//Get form data
strUserID = Utility.ConvertNullToEmpty(request.getParameter("UserID"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));


//check if this form was submited
if(strSubmit!=""){

	strLoginName = Utility.ConvertNullToEmpty(request.getParameter("txtLoginName"));
	strPassword = Utility.ConvertNullToEmpty(request.getParameter("txtPassword"));
	strFullName = Utility.ConvertNullToEmpty(request.getParameter("txtFullName"));
	strEmail = Utility.ConvertNullToEmpty(request.getParameter("txtEmail"));
	strDeptID = Utility.ConvertNullToEmpty(request.getParameter("cboDepartment"));

        objUser = new User();
        objUser.setUser(Integer.parseInt(strUserID),strLoginName,strFullName,strPassword,strEmail);
        objDept.setDepartmentID(Integer.parseInt(strDeptID));
        intResult = objUser.upadate(objDept);
        if(intResult==SysConstant.OK){
        	//response.sendRedirect("userlist.jsp");
        	strAlert = "alert('Updated user sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "userlist.jsp\";";

        }
        else if(intResult==SysConstant.ERROR_DUPLICATE)
        	strError = "Update fail, This username is already exist.";
        else
        	strError = "Update fail, Please check data and try again.";
}
else{
 //first time load this page, get information of user
  	objUser = new User();
        objUser.setUserID(Integer.parseInt(strUserID));
        objUser.load();

        strLoginName = objUser.getUserName();
	strPassword = Utility.ConvertNullToEmpty(objUser.getPassword());
	strFullName = Utility.ConvertNullToEmpty(objUser.getFullName());
	strEmail = Utility.ConvertNullToEmpty(objUser.getEmail());
        objDept.getUserDepartment(objUser);
        strDeptID = Integer.toString(objDept.getDepartmentID());
}

//Get dapartment
if(strDeptID!=""){
	intDeptID = Integer.parseInt(strDeptID);
}
else
	intDeptID = 0;

setTemp = objDept.getAllDepartment();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objDept = (Department) iter.next();
        if(objDept.getDepartmentID()==intDeptID)
             strDeptOptions = strDeptOptions + "<option  selected value='" + objDept.getDepartmentID() + "' >" + objDept.getDescription() +"</option><br>";
        else
             strDeptOptions = strDeptOptions + "<option value='" + objDept.getDepartmentID() +"' >" + objDept.getDescription() +"</option><br>";
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
		document.frmEdit.txtAction.value=p_intNumber;
        	document.frmEdit.submit();
        }
}
function IsValidForm()
{

  	if(frmEdit.txtLoginName.value=="")
	{
		alert("Login name cannot be null");
		frmEdit.txtLoginName.focus();
		return true;
	}
	if(frmEdit.txtPassword.value=="")
	{
		alert("Password cannot be null");
		frmEdit.txtPassword.focus();
		return true;
	}

	return false;

}
</script>
<title>Update User</title>
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
						<form name="frmEdit" method="POST" action="updateuser.jsp">

							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Login Name</td>
									<td>
									<input type="text" name="txtLoginName" value='<%=strLoginName%>' size="20" class="ReadOnlyTextBoxStyle" maxlength="20"></td>
								</tr>
								<tr>
									<td class="Label">Password</td>
									<td>
									<input type="password" name="txtPassword" value='<%=strPassword%>' size="20" class="TextBoxStyle" maxlength="64"></td>
								</tr>
								<tr>
									<td class="Label">Full Name</td>
									<td>
									<input type="text" name="txtFullName" value="<%=strFullName%>" size="20" class="TextBoxStyle" maxlength="50"></td>
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
                                                        <input name=UserID ID=UserID value='<%=strUserID%>' type=hidden>
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

<%@ page import="java.util.*"%>
<%@ page import="ITS.*"%>
<%@page import="tool.*"%>
<%
  String strError="";
  String sUserName = request.getParameter("txtUserName");
  String sPassword = request.getParameter("txtPassword");
  User user = new User();
  //if (sUserName!="" && sPassword!=""){
  if(request.getParameter("txtAction")!=null){
        user.setUserName(sUserName);
        int intResult=user.loadbyLoginName();
        if (intResult == SysConstant.OK){
          if (sPassword.compareToIgnoreCase(user.getPassword())==0){
            session.setAttribute("objuser",user);
            response.sendRedirect("issuelist.jsp");
          }
        }
        else
            strError = "Login fail, Please try again";
  }
  else if(request.getParameter("submit")!=null)
            strError ="Username or Password must be not blank";

//  if (sUserName==null) sUserName = "";
//  if (sPassword==null) sPassword = "";
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link href="style/formstyle.css" type=text/css rel=stylesheet>
<title>Login</title>
</head>
<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9">
<jsp:include page="header.jsp" flush="true"/>
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
						<img border="0" src="images/login.gif" width="16" height="16" alt="login image">Login</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmLogin" method="POST" action="login.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Login Name</td>
									<td>
									<input type="text" name="txtUserName" size="20" class="TextBoxStyle"></td>
								</tr>
								<tr>
									<td class="Label">Password</td>
									<td>
									<input type="password" name="txtPassword" size="20" class="TextBoxStyle"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="submit" value="Login" name="btnLogin" class="ButtonStyle" onclick="javascript:document.frmLogin.txtAction.value=1;"></td>
								</tr>
							</table>
                                                        <input name=txtAction ID=txtAction value="" type="hidden">
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
				<p align="center">[<a class="LinkTextStyle" href="systemadmin.jsp">Administration</a>]</td>
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

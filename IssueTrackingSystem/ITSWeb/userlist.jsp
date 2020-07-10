<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>

<%
User objUser;
Set setTemp;
Iterator iter;

int intSubmit;//1=Add, 2=Update, 3 =Delete
int intResult;
String strSelectedUserID,strError;
String strUserList,strNextPage,strAlert;
//init variables
objUser = new User();
strUserList="";
strError="";
strAlert="";

//get form data
if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

if(intSubmit>0){

	strSelectedUserID = Utility.ConvertNullToEmpty(request.getParameter("cboSelect"));
	switch(intSubmit){
        case 1:
        	strNextPage = "adduser.jsp";
        	response.sendRedirect(strNextPage);
		return;
        case 2:
 	   	if(strSelectedUserID!=""){
                	strNextPage = "updateuser.jsp?UserID=" + strSelectedUserID ;
                	response.sendRedirect(strNextPage);
                	return;
                }
                else
                	strError = "You should select an user to edit";
                break;
        case 3:
        	if(strSelectedUserID!=""){
	        	objUser.setUserID(Integer.parseInt(strSelectedUserID));
	                intResult = objUser.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert('The selected user was deleted sucessfully');";
				break;
	                }
	                else
	                	strError = "Cannot delete this user";
        	}
                else
                	strError = "You did not select any user to delete";
        }
}

//Get user list
setTemp = objUser.getAllUser();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objUser = (User) iter.next();
        if((i%2)==0){
        	strUserList = strUserList + "<tr>";
		strUserList = strUserList	+ "<td width=\"173\" class=\"EvenTableRow\">";
                strUserList = strUserList		+ Integer.toString(objUser.getUserID());
                strUserList = strUserList	+ "</td>\n";
		strUserList = strUserList 	+ "<td class=\"EvenTableRow\">" + objUser.getUserName() + "</td>";
		strUserList = strUserList 	+ "<td class=\"EvenTableRow\">" + objUser.getFullName() + "</td>";
		strUserList = strUserList 	+ "<td class=\"EvenTableRow\">";
                strUserList = strUserList   		+ "<a href=\"" + "mailto:" + objUser.getEmail() + "\">" + objUser.getEmail() + "</a>";
                strUserList = strUserList	+ "</td>";
		strUserList = strUserList 	+ "<td class=\"EvenTableRow\">";
		strUserList = strUserList		+ "<input type=\"radio\" value=\"" + Integer.toString(objUser.getUserID()) + "\" name=\"cboSelect\">";
               	strUserList = strUserList	+ "</td>";
	       	strUserList = strUserList + "</tr>";
        }
	 else{
	       	strUserList = strUserList + "<tr>";
	        strUserList = strUserList	+ "<td width=\"173\" class=\"OddTableRow\">";
	        strUserList = strUserList		+ Integer.toString(objUser.getUserID());
	        strUserList = strUserList	+ "</td>";
		strUserList = strUserList 	+ "<td class=\"OddTableRow\">" + objUser.getUserName() + "</td>";
		strUserList = strUserList 	+ "<td class=\"OddTableRow\">" + objUser.getFullName() + "</td>";
		strUserList = strUserList 	+ "<td class=\"OddTableRow\">";
	        strUserList = strUserList   		+ "<a href=\"" + "mailto:" + objUser.getEmail() + "\">" + objUser.getEmail() + "</a>";
	        strUserList = strUserList	+ "</td>";
		strUserList = strUserList 	+ "<td class=\"OddTableRow\">";
		strUserList = strUserList		+ "<input type=\"radio\" value=\"" + Integer.toString(objUser.getUserID()) + "\" name=\"cboSelect\">";
	        strUserList = strUserList	+ "</td>";
	        strUserList = strUserList + "</tr>";
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
      document.frmUser.txtAction.value=p_intNumber;
      document.frmUser.submit();
    }
</script>
<title>User List</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menucompanyadmin.jsp" flush="true"/>
	<tr>
		<td>
		<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
			<tr>
				<td align="center"><font color="#ff0000"><%=strError%></font></td>
			</tr>
			<tr>
				<td class="ListTitle">
				<p align="center">User List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="80%" id="table7">
					<tr>
						<td>
						<form name="frmUser" method="POST" action="userlist.jsp">

							<table border="0" width="100%" id="table8" class="BorderTable">
								<tr>
									<td class="HeaderTable" width="165">
									User ID</td>
									<td class="HeaderTable">User Name</td>
									<td class="HeaderTable">Full Name</td>
									<td class="HeaderTable">E-mail</td>
									<td class="HeaderTable">Select</td>
								</tr>
								<%=strUserList%>
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

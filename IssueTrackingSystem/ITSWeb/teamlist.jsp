<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
Team objTeam;
Set setTemp;
Iterator iter;

int intSubmit;//1=Add, 2=Update, 3 =Delete
int intResult;
String strSelectedTeamID,strError;
String strTeamList,strNextPage,strAlert;
//init variables
objTeam = new Team();
strTeamList="";
strError="";
strAlert="";

//get form data
strSelectedTeamID = Utility.ConvertNullToEmpty(request.getParameter("cboSelect"));

if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

if(intSubmit>0){


	switch(intSubmit){
        case 1:
        	strNextPage = "addteam.jsp";
        	response.sendRedirect(strNextPage);
		break;
        case 2:
 	   	if(strSelectedTeamID !=""){
                	strNextPage = "updateteam.jsp?TeamID=" + strSelectedTeamID ;
                  	response.sendRedirect(strNextPage);
                  	return;
                }
                else
                	strError = "You did not select any team to edit";
                break;
        case 3:
		if(strSelectedTeamID !=""){
	        	objTeam.setTeamID(Integer.parseInt(strSelectedTeamID));
	                intResult = objTeam.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert('The selected Team was deleted sucessfully');";
				break;
	                }
	                else
	                	strError = "Cannot delete this team";
		}
                else
                	strError = "You did not select any team to delete";
        }
}

//Get Project list
setTemp = objTeam.getAllTeam();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objTeam = (Team) iter.next();
        if((i%2)==0){
        	strTeamList = strTeamList + "<tr>";
		strTeamList = strTeamList	+ "<td width=\"173\" class=\"EvenTableRow\">";
                strTeamList = strTeamList		+ Integer.toString(objTeam.getTeamID());
                strTeamList = strTeamList	+ "</td>\n";
		strTeamList = strTeamList 	+ "<td class=\"EvenTableRow\">" + objTeam.getName() + "</td>";
		strTeamList = strTeamList	+ "</td>";
		strTeamList = strTeamList 	+ "<td class=\"EvenTableRow\">";
		strTeamList = strTeamList		+ "<input type=\"radio\" value=\"" + Integer.toString(objTeam.getTeamID()) + "\" name=\"cboSelect\">";
               	strTeamList = strTeamList	+ "</td>";
	       	strTeamList = strTeamList + "</tr>";
        }
	 else{
	       	strTeamList = strTeamList + "<tr>";
		strTeamList = strTeamList	+ "<td width=\"173\" class=\"OddTableRow\">";
                strTeamList = strTeamList		+ Integer.toString(objTeam.getTeamID());
                strTeamList = strTeamList	+ "</td>\n";
		strTeamList = strTeamList 	+ "<td class=\"OddTableRow\">" + objTeam.getName() + "</td>";
		strTeamList = strTeamList	+ "</td>";
		strTeamList = strTeamList 	+ "<td class=\"OddTableRow\">";
		strTeamList = strTeamList		+ "<input type=\"radio\" value=\"" + Integer.toString(objTeam.getTeamID()) + "\" name=\"cboSelect\">";
               	strTeamList = strTeamList	+ "</td>";
	       	strTeamList = strTeamList + "</tr>";

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
      document.frmTeam.txtAction.value=p_intNumber;
      document.frmTeam.submit();
    }
</script>
<title>Team List</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9">
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
				<p align="center">Team List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmTeam" method="POST" action="teamlist.jsp">
							<table border="0" width="100%" id="table8" class="BorderTable">
								<tr>
									<td class="HeaderTable">Team ID</td>
									<td class="HeaderTable">Team Name</td>
									<td class="HeaderTable">Select</td>
								</tr>
								<%=strTeamList%>
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

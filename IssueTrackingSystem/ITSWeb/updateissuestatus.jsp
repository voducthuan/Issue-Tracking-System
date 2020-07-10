<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
String strIssueStatusID,strIssueStatusName,strSubmit,strProjectID;
String strError="",strAlert="";
int intResult=-1;
//Init variables
IssueStatus objIssueStatus;
//Get form data
strIssueStatusID = Utility.ConvertNullToEmpty(request.getParameter("IssueStatusID"));
strProjectID= Utility.ConvertNullToEmpty(request.getParameter("ProjectID"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));

//check if this form was submited
if(strSubmit!=""){
	strIssueStatusName = Utility.ConvertNullToEmpty(request.getParameter("txtIssueStatusName"));
	objIssueStatus = new IssueStatus();
        Project objProject= new Project();
        objProject.setProjectID(Integer.parseInt(strProjectID));
        objProject.load();
        //objPhase.setPhase(strpTeamName,Integer.parseInt(strTeamID));
        objIssueStatus.setIssueStatus(Integer.parseInt(strIssueStatusID),strIssueStatusName,objProject);
        intResult = objIssueStatus.update();
        if(intResult==SysConstant.OK){
                strAlert = "alert('Updated Issue sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "issuestatuslist.jsp\";";

        }
        else
        	strError = "Update fail, Please check data and try again.";
}
else{
 //first time load this page, get information of project
  	objIssueStatus = new IssueStatus();
        objIssueStatus.setStatusID(Integer.parseInt(strIssueStatusID));
        objIssueStatus.load();
        strIssueStatusName = objIssueStatus.getName();
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

  	if(frmEdit.txtIssueStatusName.value=="")
	{
		alert("Issue Status Name cannot be null");
		frmEdit.txtIssueStatusName.focus();
		return true;
	}
	return false;

}
</script>
<title>Update Issue Status</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menuprojectadmin.jsp" flush="true"/>
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
						Issue Status</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmEdit" method="POST" action="updateissuestatus.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Issue Status Name</td>
									<td>
									<input type="text" name="txtIssueStatusName" value='<%=strIssueStatusName%>' size="20" class="TextBoxStyle" maxlength="30"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
                                                        <input name=IssueStatusID ID=IssueStatusID value='<%=strIssueStatusID%>' type=hidden>
                                                        <input name=ProjectID ID=ProjectID value='<%=strProjectID%>' type=hidden>
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


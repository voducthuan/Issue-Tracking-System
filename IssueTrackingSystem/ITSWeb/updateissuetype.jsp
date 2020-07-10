<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
String strIssueTypeID,strIssueTypeName,strSubmit,strProjectID;
String strError="",strAlert="";
int intResult=-1;
//Init variables
IssueType objIssueType;
//Get form data
strIssueTypeID = Utility.ConvertNullToEmpty(request.getParameter("IssueTypeID"));
strProjectID= Utility.ConvertNullToEmpty(request.getParameter("ProjectID"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));

//check if this form was submited
if(strSubmit!=""){
	strIssueTypeName = Utility.ConvertNullToEmpty(request.getParameter("txtIssueTypeName"));
	objIssueType = new IssueType();
        Project objProject= new Project();
        objProject.setProjectID(Integer.parseInt(strProjectID));
        objProject.load();
        //objPhase.setPhase(strpTeamName,Integer.parseInt(strTeamID));
        objIssueType.setIssueType(Integer.parseInt(strIssueTypeID),strIssueTypeName,objProject);
        intResult = objIssueType.update();
        if(intResult==SysConstant.OK){
                strAlert = "alert('Updated Issue sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "issuetypelist.jsp\";";

        }
        else
        	strError = "Update fail, Please check data and try again.";
}
else{
 //first time load this page, get information of project
  	objIssueType = new IssueType();
        objIssueType.setTypeID(Integer.parseInt(strIssueTypeID));
        objIssueType.load();
        strIssueTypeName = objIssueType.getName();
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

  	if(frmEdit.txtIssueTypeName.value=="")
	{
		alert("Issue Type Name cannot be null");
		frmEdit.txtIssueTypeName.focus();
		return true;
	}
	return false;

}
</script>
<title>Update Issue Type</title>
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
						Issue Type</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmEdit" method="POST" action="updateissuetype.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Issue Type Name</td>
									<td>
									<input type="text" name="txtIssueTypeName" value='<%=strIssueTypeName%>' size="20" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
                                                        <input name=IssueTypeID ID=IssueTypeID value='<%=strIssueTypeID%>' type=hidden>
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


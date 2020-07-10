<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
String strDescription,strIssueID;
String strError,strAlert,strSubmit;
int intResult;
Comment objComment;
User objUser,objActor;
Issue objIssue;
ProjectMember objProMem;
Project objProject;
//init variables
strError = "";
strAlert = "";
objComment = new Comment();
objUser = new User();
objIssue = new Issue();
objProMem = new ProjectMember();
objProject = new Project();
//Get form data
strDescription = Utility.ConvertNullToEmpty(request.getParameter("txtDesription"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));
strIssueID = Utility.ConvertNullToEmpty(request.getParameter("IssueID"));


objActor = (User) session.getAttribute("objuser");

//check if this form was submited
if(strSubmit!=""){
	objIssue.setIssueID(Integer.parseInt(strIssueID));
        objIssue.load();

 	objUser.setUserID(objActor.getUserID());

	objProject.setProjectID(objIssue.getSubmiter().getProject().getProjectID());
        objProMem.setProject(objProject);
        objProMem.setUser(objUser);

        objComment.setIssue(objIssue);
        objComment.setProjectmember(objProMem);
        objComment.setDescription(strDescription);

        intResult = objComment.add();
        if(intResult==SysConstant.OK){
               	strAlert = "alert('Create new comment sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "updateissue.jsp?txtIssue="+ strIssueID+ "\";";

        }
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
		document.frmAddComment.txtAction.value=p_intNumber;
        	document.frmAddComment.submit();
        }
}

function IsValidForm()
{
  	if(frmAddComment.txtDesription.value=="")
	{
		alert("Description cannot be null");
		frmAddComment.txtDesription.focus();
		return true;
	}
	return false;

}

</script>

<title>Add Comment</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menuissuetracking.jsp" flush="true"/>

	<tr>
		<td>
		<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
			<tr>
				<td align="center"><font color="#ff0000"><%=strError%></font></td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="70%" id="table7" class="TableBorderFrm">
					<tr>
						<td class="CellBorderCaptionFrm">
						<img border="0" src="images/issue.gif" width="16" height="16">
						Comment</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmAddComment" method="POST" action="addcomment.jsp">

							<table border="0" width="100%" id="table9">
								<tr>
									<td width="100%" class="Label"><%=objActor.getFullName() %> </td>
								</tr>
								</table>
							<table border="0" width="100%" id="table10">
								<tr>
									<td width="96" class="Label">Description :</td>
									<td>
									<textarea rows="5" name="txtDesription" cols="121" class="TextBoxStyle" value="<%=strDescription%>"></textarea></td>
								</tr>
							</table>
							<table border="0" width="100%" id="table8">
								<tr>
									<td width="349" class="Label">&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
                                                        <input name=txtAction ID=txtAction value="" type=hidden>
                                                        <input name=IssueID ID=IssueID value="<%=strIssueID%>" type=hidden >
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
		</table>
		</td>
	</tr>
</table>

</table><jsp:include page="footer.jsp" flush="true"/>

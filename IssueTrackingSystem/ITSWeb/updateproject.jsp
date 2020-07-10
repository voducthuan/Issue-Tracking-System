<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
String strProjectID,strProjectName,strProjectDes,strSubmit;
String strError="",strAlert="";
int intResult=-1;
//Init variables
//strDeptOptions = "";
Project objProject;
//Get form data
strProjectID = Utility.ConvertNullToEmpty(request.getParameter("ProjectID"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));

//check if this form was submited

if(strSubmit!=""){

	strProjectName = Utility.ConvertNullToEmpty(request.getParameter("txtProjectName"));
	strProjectDes = Utility.ConvertNullToEmpty(request.getParameter("txtProjectDes"));
	objProject = new Project();
        objProject.setProject(Integer.parseInt(strProjectID),strProjectName,strProjectDes);
        intResult = objProject.update();
        if(intResult==SysConstant.OK){
                strAlert = "alert('Updated Project sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "projectlist.jsp\";";

        }
        else if(intResult==SysConstant.ERROR_DUPLICATE)
        	strError = "Update fail, This username is already exist.";
        else
        	strError = "Update fail, Please check data and try again.";
}
else{
 //first time load this page, get information of project
  	objProject = new Project();
        objProject.setProjectID(Integer.parseInt(strProjectID));
        objProject.load();

        strProjectName = objProject.getName();
	strProjectDes = Utility.ConvertNullToEmpty(objProject.getDescription());
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

  	if(frmEdit.txtProjectName.value=="")
	{
		alert("Project Name cannot be null");
		frmEdit.txtProjectName.focus();
		return true;
	}
	return false;

}
</script>
<title>Update Project</title>
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
				<table border="0" width="40%" id="table7" class="TableBorderFrm">
					<tr>
						<td class="CellBorderCaptionFrm">
						Project</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmEdit" method="POST" action="updateproject.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Project Name</td>
									<td>
									<input type="text" name="txtProjectName" value='<%=strProjectName%>' size="30" class="TextBoxStyle" maxlength="10"></td>
								</tr>
								<tr>
									<td class="Label">Project Description</td>
									<td>
									<input type="text" name="txtProjectDes" value='<%=strProjectDes%>' size="30" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
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

<jsp:include page="footer.jsp" flush="true"/>

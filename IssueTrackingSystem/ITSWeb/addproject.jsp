<%@ page import="java.util.*" %>
<%@ page import="ITS.*" %>
<%@page import="tool.*"%>
<%
    String strSubmit, sProjectName, sProjectDes,strCopy;
    String strError="",strAlert="";
    int intResult=-1;
    sProjectName = Utility.ConvertNullToEmpty(request.getParameter("txtProjectName"));
    sProjectDes = Utility.ConvertNullToEmpty(request.getParameter("txtProjectDes"));
    strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));
    strCopy = Utility.ConvertNullToEmpty(request.getParameter("chkCopy"));
    if(strSubmit!=""){
        Project project=new Project();
        project.setName(sProjectName);
        project.setDescription(sProjectDes);
        intResult = project.add();
        if(intResult==SysConstant.OK){
            if(strCopy!=""){
              intResult = project.loadByName();
              project.copyTemplate();
            }
        	strAlert = "alert('Create new project sucessfully');";
                strAlert = strAlert + "window.location.href =\"" + "projectlist.jsp\";";
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
		document.frmAddProject.txtAction.value=p_intNumber;
        	document.frmAddProject.submit();
        }
}
function IsValidForm()
{
  	if(frmAddProject.txtProjectName.value=="")
	{
		alert("Project Name cannot be null");
		frmAddProject.txtProjectName.focus();
		return true;
	}
		return false;
}
</script>
<title>Add Project</title>
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
						<form name="frmAddProject" method="POST" action="addproject.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Project Name</td>
									<td>
									<input type="text" name="txtProjectName" size="35" class="TextBoxStyle" maxlength="10"></td>
								</tr>
								<tr>
									<td class="Label">Project Description</td>
									<td>
									<input type="text" name="txtProjectDes" size="35" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td class="Label">Copy Template</td>
									<td>
									<input type="checkbox" name="chkCopy" value="ON"></td>
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


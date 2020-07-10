<%@ page import="java.util.*" %>
<%@ page import="ITS.*" %>
<%@page import="tool.*"%>
<%
    String strSubmit, strProjectID, strIssueTypeName, strCopy;
    String strError="",strAlert="";
    int intResult=-1;
    strProjectID = Utility.ConvertNullToEmpty(request.getParameter("ProjectID"));
    strIssueTypeName = Utility.ConvertNullToEmpty(request.getParameter("txtIssueTypeName"));
    strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));
    if(strSubmit!=""){
        IssueType objIssueType = new IssueType();
        Project objProject=new Project();
        objProject.setProjectID(Integer.parseInt(strProjectID));
        //objProject.load();
        objIssueType.setProject(objProject);
        objIssueType.setName(strIssueTypeName);
        intResult = objIssueType.add();
        if(intResult==SysConstant.OK){
              	strAlert = "alert('Create new Issue Type sucessfully');";
                strAlert = strAlert + "window.location.href =\"" + "issuetypelist.jsp\";";
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
		document.frmAdd.txtAction.value=p_intNumber;
        	document.frmAdd.submit();
        }
}
function IsValidForm()
{

  	if(frmAdd.txtIssueTypeName.value=="")
	{
		alert("Issue Type Name cannot be null");
		frmAdd.txtIssueTypeName.focus();
		return true;
	}
	return false;
}

</script>
<title>Add Issue Type</title>
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
						<form name="frmAdd" method="POST" action="addissuetype.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Issue Type Name</td>
									<td>
									<input type="text" name="txtIssueTypeName" size="35" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
                                                        <input name=txtAction ID=txtAction value="" type=hidden>
                                                        <input name=ProjectID ID=ProjectID value='<%=strProjectID%>' type=hidden>
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


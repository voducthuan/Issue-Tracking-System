<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
String strDomainID,strSubSystemID,strSubSystemName,strSubmit;
String strError="",strAlert="";
int intResult=-1;
//Init variables
SubSystem objSubsystem;
//Get form data
strDomainID = Utility.ConvertNullToEmpty(request.getParameter("DomainID"));
strSubSystemID= Utility.ConvertNullToEmpty(request.getParameter("SubSystemID"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));
//check if this form was submited
if(strSubmit!=""){
	strSubSystemName = Utility.ConvertNullToEmpty(request.getParameter("txtSubSystemName"));
	objSubsystem = new SubSystem();
        Domain objDomain= new Domain();
        objDomain.setDomainID(Integer.parseInt(strDomainID));
        objSubsystem.setSubSystem(Integer.parseInt(strSubSystemID),strSubSystemName,objDomain);
        intResult = objSubsystem.update();
        if(intResult==SysConstant.OK){
                strAlert = "alert('Updated Subsystem sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "subsystemlist.jsp\";";

        }
        else
        	strError = "Update fail, Please check data and try again.";
}
else{
 //first time load this page, get information of project
  	objSubsystem = new SubSystem();
        objSubsystem.setSubSystemID(Integer.parseInt(strSubSystemID));
        objSubsystem.load();
        strSubSystemName = objSubsystem.getName();
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

  	if(frmEdit.txtSubSystemName.value=="")
	{
		alert("Subsystem Name cannot be null");
		frmEdit.txtSubSystemName.focus();
		return true;
	}
	return false;

}
</script>
<title>Update Subsystem</title>
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
						Subsystem</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmEdit" method="POST" action="updatesubsystem.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Subsystem Name</td>
									<td>
									<input type="text" name="txtSubSystemName" value='<%=strSubSystemName%>' size="20" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
                                                        <input name=DomainID ID=DomainID value='<%=strDomainID%>' type=hidden>
                                                        <input name=SubSystemID ID=SubSystemID value='<%=strSubSystemID%>' type=hidden>
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




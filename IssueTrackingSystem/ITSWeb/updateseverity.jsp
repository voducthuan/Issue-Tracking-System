<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
String strSeverityID,strSeverityName,strSeverityMark,strSubmit,strProjectID;
String strError="",strAlert="";
int intResult=-1;
//Init variables
Severity objSeverity;
//Get form data
strSeverityID = Utility.ConvertNullToEmpty(request.getParameter("SeverityID"));
strProjectID= Utility.ConvertNullToEmpty(request.getParameter("ProjectID"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));

//check if this form was submited

if(strSubmit!=""){
	strSeverityName = Utility.ConvertNullToEmpty(request.getParameter("txtSeverityName"));
	strSeverityMark= Utility.ConvertNullToEmpty(request.getParameter("txtSeverityMark"));
        objSeverity = new Severity();
        Project objProject= new Project();
        objProject.setProjectID(Integer.parseInt(strProjectID));
        objProject.load();
        //objPhase.setPhase(strpTeamName,Integer.parseInt(strTeamID));
        objSeverity.setSeverity(Integer.parseInt(strSeverityID),strSeverityName,Integer.parseInt(strSeverityMark),objProject);
        intResult = objSeverity.update();
        if(intResult==SysConstant.OK){
                strAlert = "alert('Updated Severity sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "severitylist.jsp\";";

        }
        else
        	strError = "Update fail, Please check data and try again.";
}
else{
 //first time load this page, get information of project
  	objSeverity = new Severity();
        objSeverity.setSeverityID(Integer.parseInt(strSeverityID));
        objSeverity.load();
        strSeverityName = objSeverity.getName();
	strSeverityMark=String.valueOf(objSeverity.getMark());
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
function ValidNumeric(sValue)
{
	var oRegExp  = /(^\d{1,5}(\.\d{1,2})?$)/;
	return oRegExp.test(sValue);
}
function Submit(p_intNumber){
	if(!IsValidForm()){
		document.frmEdit.txtAction.value=p_intNumber;
        	document.frmEdit.submit();
        }
}
function IsValidForm()
{

  	if(frmEdit.txtSeverityName.value=="")
	{
		alert("Serverity Name cannot be null");
		frmEdit.txtSeverityName.focus();
		return true;
	}
        if(frmEdit.txtSeverityMark.value=="")
	{
		alert("Serverity Mark cannot be null");
		frmEdit.txtSeverityMark.focus();
		return true;
	}
	else if(!ValidNumeric(frmEdit.txtSeverityMark.value)){
                alert("You must enter an integer in mark field");
                return true;
        }
        return false;

}
</script>
<title>Update Domain</title>
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
						Severity</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmEdit" method="POST" action="updateseverity.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Severity Name</td>
									<td>
									<input type="text" name="txtSeverityName" value='<%=strSeverityName%>' size="20" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td class="Label">Severity Mark</td>
									<td>
									<input type="text" name="txtSeverityMark" value='<%=strSeverityMark%>' size="12" class="TextBoxStyle" maxlength="11"></td>
								</tr>
                                                                <tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
                                                        <input name=SeverityID ID=SeverityID value='<%=strSeverityID%>' type=hidden>
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


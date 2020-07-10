<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
String strDepID,strDepName,strSubmit;
String strError="",strAlert="";
int intResult=-1;
//Init variables
//strDeptOptions = "";
Department objDep;
//Get form data
strDepID = Utility.ConvertNullToEmpty(request.getParameter("DepartmentID"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));

//check if this form was submited

if(strSubmit!=""){
	strDepName = Utility.ConvertNullToEmpty(request.getParameter("txtDepName"));
	objDep = new Department();
        objDep.setDepartment(strDepName,Integer.parseInt(strDepID));
        intResult = objDep.update();
        if(intResult==SysConstant.OK){
                strAlert = "alert('Updated Department sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "departmentlist.jsp\";";

        }
        else
        	strError = "Update fail, Please check data and try again.";
}
else{
 //first time load this page, get information of project
  	objDep = new Department();
        objDep.setDepartmentID(Integer.parseInt(strDepID));
        objDep.load();
        strDepName = objDep.getDescription();
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

  	if(frmEdit.txtDepName.value=="")
	{
		alert("Deparment Name cannot be null");
		frmEdit.txtDepName.focus();
		return true;
	}
	return false;

}
</script>
<title>Update Team</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menucompanyadmin.jsp" flush="true"/>
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
						Department</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmEdit" method="POST" action="updatedepartment.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Department Name</td>
									<td>
									<input type="text" name="txtDepName" value='<%=strDepName%>' size="30" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
                                                        <input name=DepartmentID ID=DepartmentID value='<%=strDepID%>' type=hidden>
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

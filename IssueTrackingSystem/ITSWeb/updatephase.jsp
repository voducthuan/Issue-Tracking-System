<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
String strPhaseID,strPhaseName,strSubmit,strProjectID;
String strError="",strAlert="";
int intResult=-1;
//Init variables
//strDeptOptions = "";
Phase objPhase;
//Get form data
strPhaseID = Utility.ConvertNullToEmpty(request.getParameter("PhaseID"));
strProjectID= Utility.ConvertNullToEmpty(request.getParameter("ProjectID"));
strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));

//check if this form was submited

if(strSubmit!=""){
	strPhaseName = Utility.ConvertNullToEmpty(request.getParameter("txtPhaseName"));
	objPhase = new Phase();
        //objPhase.load();
        //objPhase.setPhaseID(Integer.parseInt(strPhaseID));
        //objPhase.setDescription(strPhaseName);
        // new project
        Project objProject= new Project();
        objProject.setProjectID(Integer.parseInt(strProjectID));
        objProject.load();
        //objPhase.setPhase(strpTeamName,Integer.parseInt(strTeamID));

        objPhase.setPhase(Integer.parseInt(strPhaseID),strPhaseName,objProject);
        intResult = objPhase.update();
        if(intResult==SysConstant.OK){
                strAlert = "alert('Updated phase sucessfully');";
	        strAlert = strAlert + "window.location.href =\"" + "phaselist.jsp\";";

        }
        else
        	strError = "Update fail, Please check data and try again.";
}
else{
 //first time load this page, get information of project
  	objPhase = new Phase();
        objPhase.setPhaseID(Integer.parseInt(strPhaseID));
        objPhase.load();
        strPhaseName = objPhase.getDescription();
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

  	if(frmEdit.txtPhaseName.value=="")
	{
		alert("Phase Name cannot be null");
		frmEdit.txtPhaseName.focus();
		return true;
	}
	return false;

}
</script>
<title>Update Phase</title>
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
						Phase</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmEdit" method="POST" action="updatephase.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Phase Name</td>
									<td>
									<input type="text" name="txtPhaseName" value='<%=strPhaseName%>' size="20" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
                                                        <input name=PhaseID ID=PhaseID value='<%=strPhaseID%>' type=hidden>
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



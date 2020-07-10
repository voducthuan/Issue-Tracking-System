<%@ page import="java.util.*" %>
<%@ page import="ITS.*" %>
<%@page import="tool.*"%>
<%
    String strSubmit, strDomainID, strSubSystemName, strCopy;
    String strError="",strAlert="";
    int intResult=-1;
    strDomainID = Utility.ConvertNullToEmpty(request.getParameter("DomainID"));
    strSubSystemName = Utility.ConvertNullToEmpty(request.getParameter("txtSubSystemName"));
    strSubmit = Utility.ConvertNullToEmpty(request.getParameter("txtAction"));
    if(strSubmit!=""){
        SubSystem objSubSystem=new SubSystem();
        Domain objDomain=new Domain();
        objDomain.setDomainID(Integer.parseInt(strDomainID));
        objSubSystem.setDomain(objDomain);
        objSubSystem.setName(strSubSystemName);
        intResult = objSubSystem.add();
        if(intResult==SysConstant.OK){
              	strAlert = "alert('Create new Subsystem sucessfully');";
                strAlert = strAlert + "window.location.href =\"" + "subsystemlist.jsp\";";
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

  	if(frmAdd.txtSubSystemName.value=="")
	{
		alert("Subsystem Name cannot be null");
		frmAdd.txtSubSystemName.focus();
		return true;
	}
	return false;
}

</script>
<title>Add Iteration</title>
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
						<form name="frmAdd" method="POST" action="addsubsystem.jsp">
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label">Subsystem Name</td>
									<td>
									<input type="text" name="txtSubSystemName" size="35" class="TextBoxStyle" maxlength="50"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
								</tr>
							</table>
                                                        <input name=txtAction ID=txtAction value="" type=hidden>
                                                        <input name=DomainID ID=DomainID value='<%=strDomainID%>' type=hidden>
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


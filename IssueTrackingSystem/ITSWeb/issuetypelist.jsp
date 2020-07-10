<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>

<%
User objUser, objActor;
Project objProject;
Set setTemp;
Iterator iter;
IssueType objIssueType;
int intResult, intSubmit; //1=Add, 2=Update, 3=Delete
String strProjectOption,strIssueTypeList,strAlert, strError,strNextPage;
String strSelectedProjectID,strSelectedIssueTypeID;
//init variables
strProjectOption = "";
strIssueTypeList = "";
strAlert = "";
strError = "";
strNextPage="";
objUser = new User();
objProject = new Project();
objIssueType = new IssueType();

//Get form data
if (Utility.ConvertNullToEmpty(request.getParameter("txtAction")) != "") {
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;
strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
strSelectedIssueTypeID = Utility.ConvertNullToEmpty(request.getParameter("rdoIssueType"));
//Insert or Delete a user have right of project admin
if (intSubmit > 0) {
  switch (intSubmit) {
    case 1: //Add new Issue type
        strNextPage = "addissuetype.jsp?ProjectID=" + strSelectedProjectID;
        response.sendRedirect(strNextPage);
        return;
    case 2: //Edit Issue type
        if(strSelectedIssueTypeID!=""){
             	strNextPage = "updateissuetype.jsp?IssueTypeID=" + strSelectedIssueTypeID ;
               	strNextPage=strNextPage + "&ProjectID="+strSelectedProjectID;
                response.sendRedirect(strNextPage);
               	return;
        }
        else
              	strError = "You should select an issue type to edit";
        break;

    case 3: //Delete Issue type
        if(strSelectedIssueTypeID!=""){
	      	objIssueType.setTypeID(Integer.parseInt(strSelectedIssueTypeID));
	         intResult = objIssueType.delete();
                 if(intResult==SysConstant.OK){
	               	strAlert = "alert('The selected issue type was deleted sucessfully');";
			break;
                 }
	         else
	               	strError = "Cannot delete this issue type";
        }
        else
              	strError = "You did not select any issue type to delete";
        break;
  }
}
//Get list of projects
objActor = (User) session.getAttribute("objuser");
objUser.setUserID(objActor.getUserID());
 //objUser.setUserID(1);
setTemp = objUser.getListProjectAdminedByUser();
iter = setTemp.iterator();
for (int i = 0; iter.hasNext(); i++) {
   objProject = (Project) iter.next();
   //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
   if (strSelectedProjectID == "")
     strSelectedProjectID = Integer.toString(objProject.getProjectID());
   if ((strSelectedProjectID != "") && (Integer.parseInt(strSelectedProjectID) == objProject.getProjectID())) {
     strProjectOption = strProjectOption + "<option selected value='" + objProject.getProjectID() + "' >" + objProject.getDescription() + "</option><br>";
   }
   else
     strProjectOption = strProjectOption + "<option value='" + objProject.getProjectID() + "' >" + objProject.getDescription() + "</option><br>";
}
objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
objIssueType.setProject(objProject);
setTemp = objIssueType.getListIssueType();
iter = setTemp.iterator();
for (int i = 0; iter.hasNext(); i++) {
  objIssueType = (IssueType) iter.next();
   if ((i % 2) == 0) {
            strIssueTypeList = strIssueTypeList + "<tr>";
            strIssueTypeList = strIssueTypeList        + "<td width=\"173\" class=\"EvenTableRow\">" +  Integer.toString(objIssueType.getTypeID()) + "</td>";
            strIssueTypeList = strIssueTypeList        + "<td class=\"EvenTableRow\">" + objIssueType.getName() + "</td>";
            strIssueTypeList = strIssueTypeList        + "<td class=\"EvenTableRow\">";
            strIssueTypeList = strIssueTypeList               + "<input type=\"radio\" value=\"" + Integer.toString(objIssueType.getTypeID()) +  "\" name=\"rdoIssueType\"></td>";
            strIssueTypeList = strIssueTypeList + "<tr>";
    }
    else {
            strIssueTypeList = strIssueTypeList + "<tr>";
            strIssueTypeList = strIssueTypeList        + "<td width=\"173\" class=\"OddTableRow\">" +  Integer.toString(objIssueType.getTypeID()) + "</td>";
            strIssueTypeList = strIssueTypeList        + "<td class=\"OddTableRow\">" + objIssueType.getName() + "</td>";
            strIssueTypeList = strIssueTypeList        + "<td class=\"OddTableRow\">";
            strIssueTypeList = strIssueTypeList               + "<input type=\"radio\" value=\"" + Integer.toString(objIssueType.getTypeID()) +  "\" name=\"rdoIssueType\"></td>";
            strIssueTypeList = strIssueTypeList + "<tr>";
    }

}



%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link href="style/formstyle.css" type=text/css rel=stylesheet>
<script type="" language="javascript" >

function Init(){
	<%
	if((intSubmit>0)&&(strError=="")){
		out.println(strAlert);
        }
	%>
}


function Submit(p_intNumber){
	document.frmIssueType.txtAction.value=p_intNumber;
      	document.frmIssueType.submit();
}


</script>
<title>Issue Type List</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menuprojectadmin.jsp" flush="true"/>
	<tr>
		<td>
		<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
			<tr>
				<td align="center"><font color="#ff0000"><%=strError%></font></td>
			</tr>
			<tr>
				<td class="ListTitle">
				<p align="center">Issue Type List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmIssueType" method="POST" action="issuetypelist.jsp">

							<table border="0" width="100%" id="table10" cellspacing="0" cellpadding="0">
								<tr>
									<td align=center>
									<table border="0" width="50%" id="table11" cellspacing="0" cellpadding="0" class="TableBorderFrm">
										<tr>
											<td class="OddTableRow">Project</td>
											<td class="OddTableRow">
											<select size="1" name="cboProject" class="ComboBoxStyle">
                                                                                          <%=strProjectOption %>
											</select></td>
											<td class="OddTableRow" width="60">
									<input type="button" value="Apply" name="btnApply" class="ButtonStyle" onclick="javascript:Submit(4);"></td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							<br>
							<table border="0" width="100%" id="table8" class="BorderTable">
								<tr>
									<td class="HeaderTable" width="165">
									Issue Type ID</td>
									<td class="HeaderTable">Issue Type Name</td>
									<td class="HeaderTable">Select</td>
								</tr>
								<%=strIssueTypeList %>
							</table>
							<table border="0" width="100%" id="table9">
								<tr>
									<td width="30%">&nbsp;</td>
									<td width="20%">
									<input type="button" value="Add" name="btnAdd" class="ButtonStyle" onclick="javascript:Submit(1);"></td>
									<td width="20%">
									<input type="button" value="Update" name="btnUpdate" class="ButtonStyle" onclick="javascript:Submit(2);"></td>
									<td width="30%">
									<input type="button" value="Delete" name="btnDelete" class="ButtonStyle" onclick="javascript:Submit(3);"></td>
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
				<td>&nbsp;</td>
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

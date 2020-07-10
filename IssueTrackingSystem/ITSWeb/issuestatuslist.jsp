<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
IssueStatus objIssueStatus;
Project objProject;
Set setTemp;
Iterator iter;
int intResult,intSubmit;//1=Insert, 2=Delete, 3=Reload Project combobox
String strProjectOption,strIssueStatusList,strAlert,strError,strSelectedProjectID, strSelectedIssueStatusID;
String strNextPage;

//init variables
objIssueStatus = new IssueStatus();
objProject = new Project();
User objActor=new User();
User objUser=new User();
strIssueStatusList="";
strProjectOption="";
strError="";
strAlert="";

//get form data

strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
strSelectedIssueStatusID=Utility.ConvertNullToEmpty(request.getParameter("rdoIssueStatus"));

if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

// select Add/Edit/Delete
if(intSubmit>0){
	switch(intSubmit){
        case 1:
	   	if(strSelectedProjectID !=""){
                  	strNextPage = "addissuestatus.jsp?ProjectID=" + strSelectedProjectID;
                  	response.sendRedirect(strNextPage);
                  	return;
                }
                else
                	strError = "There is no project to add issue status";
                break;
        case 2:
 	   	if(strSelectedIssueStatusID !=""){
                	strNextPage = "updateissuestatus.jsp?IssueStatusID=" + strSelectedIssueStatusID ;
	        	strNextPage=strNextPage + "&ProjectID="+strSelectedProjectID;
                        response.sendRedirect(strNextPage);
                        return;
                }
        	else
                	strError = "You did not select any issue status to edit";
                break;
        case 3:
        	if(strSelectedIssueStatusID!=""){
                	objIssueStatus.setStatusID(Integer.parseInt(strSelectedIssueStatusID));
	                intResult = objIssueStatus.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert('The selected issue was deleted sucessfully');";
				break;
	                }
	                else
	                	strError = "Cannot delete this issue status";
                }
                else
                	strError = "You did not select any issue status to delete";

        }
}

//Get list of projects by user login
objActor = (User) session.getAttribute("objuser");
objUser.setUserID(objActor.getUserID());
setTemp = objUser.getListProjectAdminedByUser();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objProject = (Project) iter.next();
        //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
        if(strSelectedProjectID=="")
        	strSelectedProjectID = Integer.toString(objProject.getProjectID());
        if((strSelectedProjectID!="")&&(Integer.parseInt(strSelectedProjectID)== objProject.getProjectID())){
	       	strProjectOption = strProjectOption + "<option selected value='" + objProject.getProjectID() +"' >" + objProject.getDescription() +"</option><br>";
        }
	else
        	strProjectOption = strProjectOption + "<option value='" + objProject.getProjectID() +"' >" + objProject.getDescription() +"</option><br>";
}

if(strSelectedProjectID!=""){
	//Get list of  phase based on projectID
        objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
  	objIssueStatus.setProject(objProject);
        setTemp = objIssueStatus.getListIssueStatus();
	iter = setTemp.iterator();
	for (int i=0; iter.hasNext();i++ ) {
		objIssueStatus = (IssueStatus) iter.next();
	        if((i%2)==0){
			strIssueStatusList = strIssueStatusList 	+ "<tr>";
                        strIssueStatusList = strIssueStatusList 		+ "<td width=\"173\" class=\"EvenTableRow\">" + Integer.toString(objIssueStatus.getStatusID() )+ "</td>";
			strIssueStatusList = strIssueStatusList		+ "<td class=\"EvenTableRow\">" + objIssueStatus.getName() +  "</td>";
			strIssueStatusList = strIssueStatusList		+ "<td class=\"EvenTableRow\">";
			strIssueStatusList = strIssueStatusList		+ "<input type=\"radio\" value=\"" + Integer.toString(objIssueStatus.getStatusID()) + "\" checked name=\"rdoIssueStatus\"></td>";
			strIssueStatusList = strIssueStatusList 	+ "</tr>";

	        }
		else{
			strIssueStatusList = strIssueStatusList 	+ "<tr>";
                        strIssueStatusList = strIssueStatusList 		+ "<td width=\"173\" class=\"OddTableRow\">" + Integer.toString(objIssueStatus.getStatusID() )+ "</td>";
			strIssueStatusList = strIssueStatusList		+ "<td class=\"OddTableRow\">" + objIssueStatus.getName() +  "</td>";
			strIssueStatusList = strIssueStatusList		+ "<td class=\"OddTableRow\">";
			strIssueStatusList = strIssueStatusList		+ "<input type=\"radio\" value=\"" + Integer.toString(objIssueStatus.getStatusID()) + "\" checked name=\"rdoIssueStatus\"></td>";
			strIssueStatusList = strIssueStatusList 	+ "</tr>";

	        }

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
      document.frmIssueStatus.txtAction.value=p_intNumber;
      document.frmIssueStatus.submit();
    }
</script>
<title>Issue Statue List</title>
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
				<p align="center">Issue Status List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmIssueStatus" method="POST" action="issuestatuslist.jsp">
							<table border="0" width="100%" id="table10" cellspacing="0" cellpadding="0">
								<tr>
									<td align=center>
									<table border="0" width="50%" id="table11" cellspacing="0" cellpadding="0" class="TableBorderFrm">
										<tr>
											<td class="OddTableRow">Project</td>
											<td class="OddTableRow">
											<select size="1" name="cboProject" class="ComboBoxStyle">
											<%=strProjectOption %></select></td>
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
									Issue Status ID</td>
									<td class="HeaderTable">Issue Status Name</td>
									<td class="HeaderTable">Select</td>
								</tr>
                                                                <%=strIssueStatusList%>
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
<jsp:include page="footer.jsp" flush="true"/>


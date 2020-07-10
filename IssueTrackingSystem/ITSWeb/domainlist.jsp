<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
Domain objDomain;
Project objProject;
Set setTemp;
Iterator iter;
int intResult,intSubmit;//1=Insert, 2=Delete, 3=Reload Project combobox
String strProjectOption,strDomainList,strAlert,strError,strSelectedProjectID, strSelectedDomainID;
String strNextPage;

//init variables
objDomain = new Domain();
objProject = new Project();
User objActor=new User();
User objUser=new User();
strDomainList="";
strProjectOption="";
strError="";
strAlert="";

//get form data

strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
strSelectedDomainID=Utility.ConvertNullToEmpty(request.getParameter("rdoDomain"));

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
                  	strNextPage = "adddomain.jsp?ProjectID=" + strSelectedProjectID;
                  	response.sendRedirect(strNextPage);
                  	return;
                }
                else
                	strError = "There is no project to add domain";
                break;
        case 2:
 	   	if(strSelectedDomainID !=""){
                	strNextPage = "updatedomain.jsp?DomainID=" + strSelectedDomainID ;
	        	strNextPage=strNextPage + "&ProjectID="+strSelectedProjectID;
                        response.sendRedirect(strNextPage);
                        return;
                }
        	else
                	strError = "You did not select any domain to edit";
                break;
        case 3:
        	if(strSelectedDomainID!=""){
                	objDomain.setDomainID(Integer.parseInt(strSelectedDomainID));
	                intResult = objDomain.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert('The selected domain was deleted sucessfully');";
				break;
	                }
	                else
	                	strError = "Cannot delete this domain";
                }
                else
                	strError = "You did not select any domain to delete";

        }
}

//Get list of projectss
objActor = (User) session.getAttribute("objuser");
objUser.setUserID(objActor.getUserID());
 // objUser.setUserID(1);
setTemp = objUser.getListProjectAdminedByUser();
//setTemp = objProject.getAllProject();
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
  	objDomain.setProject(objProject);
        setTemp = objDomain.getListDomain();
	iter = setTemp.iterator();
	for (int i=0; iter.hasNext();i++ ) {
		objDomain = (Domain) iter.next();
	        if((i%2)==0){
			strDomainList = strDomainList 	+ "<tr>";
                        strDomainList = strDomainList 		+ "<td width=\"173\" class=\"EvenTableRow\">" + Integer.toString(objDomain.getDomainID() )+ "</td>";
			strDomainList = strDomainList		+ "<td class=\"EvenTableRow\">" + objDomain.getName() +  "</td>";
			strDomainList = strDomainList		+ "<td class=\"EvenTableRow\">";
			strDomainList = strDomainList		+ "<input type=\"radio\" value=\"" + Integer.toString(objDomain.getDomainID()) + "\" checked name=\"rdoDomain\"></td>";
			strDomainList = strDomainList 	+ "</tr>";

	        }
		else{
			strDomainList = strDomainList 	+ "<tr>";
                        strDomainList = strDomainList 		+ "<td width=\"173\" class=\"OddTableRow\">" + Integer.toString(objDomain.getDomainID() )+ "</td>";
			strDomainList = strDomainList		+ "<td class=\"OddTableRow\">" + objDomain.getName() +  "</td>";
			strDomainList = strDomainList		+ "<td class=\"OddTableRow\">";
			strDomainList = strDomainList		+ "<input type=\"radio\" value=\"" + Integer.toString(objDomain.getDomainID()) + "\" checked name=\"rdoDomain\"></td>";
			strDomainList = strDomainList 	+ "</tr>";

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
      document.frmDomain.txtAction.value=p_intNumber;
      document.frmDomain.submit();
    }
</script>
<title>Domain List</title>
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
				<p align="center">Domain List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmDomain" method="POST" action="domainlist.jsp">
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
									Domain ID</td>
									<td class="HeaderTable">Domain Name</td>
									<td class="HeaderTable">Select</td>
								</tr>
                                                                <%=strDomainList%>
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



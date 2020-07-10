<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
Project objProject;
Set setTemp;
Iterator iter;
int intSubmit;//1=Add, 2=Update, 3 =Delete
int intResult;
String strSelectedProjectID,strError;
String strProjectList,strNextPage,strAlert;
//init variables
objProject = new Project();
strProjectList="";
strError="";
strAlert="";

strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboSelect"));

if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

if(intSubmit>0){


	switch(intSubmit){
        case 1:
        	strNextPage = "addproject.jsp";
        	response.sendRedirect(strNextPage);
		break;
        case 2:
        	if(strSelectedProjectID!=""){
                  	strNextPage = "updateproject.jsp?ProjectID=" + strSelectedProjectID ;
                  	response.sendRedirect(strNextPage);
                  	return;
                }
                else
                	strError = "You did not select any project to edit";
                break;
        case 3:
	       	if(strSelectedProjectID!=""){
	                  objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
	                  intResult = objProject.delete();
	                  if(intResult==SysConstant.OK){
	                    strAlert = "alert('The selected Project was deleted sucessfully');";
	                    break;
	                  }
	                  else
	                  strError = "Cannot delete this project";
                }
                else
                	strError = "You did not select any project to delete";
        }
}

//Get Project list
setTemp = objProject.getAllProject();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objProject = (Project) iter.next();
        if((i%2)==0){
        	strProjectList = strProjectList + "<tr>";
		strProjectList = strProjectList	+ "<td width=\"173\" class=\"EvenTableRow\">";
                strProjectList = strProjectList		+ Integer.toString(objProject.getProjectID());
                strProjectList = strProjectList	+ "</td>\n";
		strProjectList = strProjectList 	+ "<td class=\"EvenTableRow\">" + objProject.getName() + "</td>";
		strProjectList = strProjectList 	+ "<td class=\"EvenTableRow\">" + objProject.getDescription() + "</td>";
		strProjectList = strProjectList	+ "</td>";
		strProjectList = strProjectList 	+ "<td class=\"EvenTableRow\">";
		strProjectList = strProjectList		+ "<input type=\"radio\" value=\"" + Integer.toString(objProject.getProjectID()) + "\" name=\"cboSelect\">";
               	strProjectList = strProjectList	+ "</td>";
	       	strProjectList = strProjectList + "</tr>";
        }
	 else{
	       	strProjectList = strProjectList + "<tr>";
		strProjectList = strProjectList	+ "<td width=\"173\" class=\"OddTableRow\">";
                strProjectList = strProjectList		+ Integer.toString(objProject.getProjectID());
                strProjectList = strProjectList	+ "</td>\n";
		strProjectList = strProjectList 	+ "<td class=\"OddTableRow\">" + objProject.getName() + "</td>";
		strProjectList = strProjectList 	+ "<td class=\"OddTableRow\">" + objProject.getDescription() + "</td>";
		strProjectList = strProjectList	+ "</td>";
		strProjectList = strProjectList 	+ "<td class=\"OddTableRow\">";
		strProjectList = strProjectList		+ "<input type=\"radio\" value=\"" + Integer.toString(objProject.getProjectID()) + "\" name=\"cboSelect\">";
               	strProjectList = strProjectList	+ "</td>";
	       	strProjectList = strProjectList + "</tr>";
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
      document.frmProject.txtAction.value=p_intNumber;
      document.frmProject.submit();
    }
</script>
<title>Project List</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menuapplicationadmin.jsp" flush="true"/>

	<tr>
		<td>
		<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
			<tr>
				<td align="center"><font color="#ff0000"><%=strError%></font></td>
			</tr>
			<tr>
				<td class="ListTitle">
				<p align="center">Project List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmProject" method="POST" action="projectlist.jsp">
							<table border="0" width="100%" id="table8" class="BorderTable">
								<tr>
									<td class="HeaderTable">Project ID</td>
									<td class="HeaderTable">Project Name</td>
									<td class="HeaderTable">Project Description</td>
                                                                        <td class="HeaderTable">Select</td>
								</tr>
								<%=strProjectList%>
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


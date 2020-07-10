<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>

<%
User objUser, objActor; ;
Project objProject;
IssueStatus objIssueStatus;
IssueType objIssueType;
Severity objSeverity;
Artifact objArtifact;
SubSystem  objSubSystem;
Reproducibility objReproducibility;
ProjectMember objProMem,objSummiter,objAssignedUser;
Issue objIssue;
Set setTemp;
Iterator iter;
int intResult, intSubmit, intCountIssue; //1=ExportXML, 2=Add, 3=Update, 3=Delete
String strProjectOption, strSubmitterOption,strAssignedUserOption;
String strIssueList, strAlert, strError,strNextPage;
String strSelectedProjectID, strSelectedSubmitterID, strSelectedAssignedUserID,strSelectedIssueID;

//init variables
objUser = new User();
objActor = new User();
objProject = new Project();
objIssueStatus = new IssueStatus();
objIssueType = new IssueType();
objSeverity = new Severity();
objArtifact = new Artifact();
objSubSystem = new SubSystem();
objReproducibility = new Reproducibility();
objProMem = new ProjectMember();
objIssue = new Issue();
objSummiter = new ProjectMember();
objAssignedUser = new ProjectMember();;
strProjectOption = "";
strSubmitterOption = "";
strAssignedUserOption = "";
strIssueList = "";
strError = "";
strAlert = "";
strNextPage ="";
intCountIssue = 0;
 //get form data
if (Utility.ConvertNullToEmpty(request.getParameter("txtAction")) != "") {
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;
strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
strSelectedSubmitterID = Utility.ConvertNullToEmpty(request.getParameter("cboSubmitter"));
if(strSelectedSubmitterID=="") strSelectedSubmitterID = "0";//Filter all
strSelectedAssignedUserID = Utility.ConvertNullToEmpty(request.getParameter("cboAssignedUser"));
if(strSelectedAssignedUserID=="") strSelectedAssignedUserID = "0";//Filter all
strSelectedIssueID = Utility.ConvertNullToEmpty(request.getParameter("rdoIssue"));

//Insert or Delete a user have right of project admin
if (intSubmit > 0) {
	switch (intSubmit) {
	case 1: //ExportXML
		break;
      	case 2: //Add
		strNextPage = "addissue.jsp?txtProject=" + strSelectedProjectID;
        	response.sendRedirect(strNextPage);
		return;
        case 3: //Update
		if(strSelectedIssueID!=""){
                	strNextPage = "updateissue.jsp?txtIssue=" + strSelectedIssueID ;
                	response.sendRedirect(strNextPage);
                	return;
                }
                else
                	strError = "You should select an issue to edit";
                break;

	case 4: //Delete
        	if(strSelectedIssueID!=""){
	        	objIssue.setIssueID(Integer.parseInt(strSelectedIssueID));
	                intResult = objIssue.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert('The selected issue was deleted sucessfully');";
				break;
	                }
	                else
	                	strError = "Cannot delete this issue";
        	}
                else
                	strError = "You did not select any issue to delete";
	}
}

//Get list of projects
objActor = (User) session.getAttribute("objuser");
objUser.setUserID(objActor.getUserID());
setTemp = objUser.getListJoinedProject();
iter = setTemp.iterator();
for (int i = 0; iter.hasNext(); i++) {
	objProject = (Project) iter.next();
	//If this is fist load of this page, set strSelectedProjectID = first Project ID in list
	if (strSelectedProjectID == "")
		strSelectedProjectID = Integer.toString(objProject.getProjectID());
	if ((strSelectedProjectID != "") && (Integer.parseInt(strSelectedProjectID) == objProject.getProjectID())) {
		strProjectOption = strProjectOption + "<option selected value='" + objProject.getProjectID() + "' >" + objProject.getName() + "</option>";
	}
	else
		strProjectOption = strProjectOption + "<option value='" + objProject.getProjectID() + "' >" + objProject.getName() + "</option>";
}

if(strSelectedProjectID !=""){
  objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
  //Get list of project members
objProMem.setProject(objProject);
setTemp = objProMem.getListProjectMember();
iter = setTemp.iterator();
if(strSelectedSubmitterID=="0")
	strSubmitterOption = "<option selected value=\"0\">All</option>";
else
	strSubmitterOption = "<option value=\"0\">All</option>";
if(strSelectedAssignedUserID=="0")
	strAssignedUserOption = "<option selected value=\"0\">All</option>";
else
	strAssignedUserOption = "<option value=\"0\">All</option>";


for (int i = 0; iter.hasNext(); i++) {
	objProMem = (ProjectMember) iter.next();
	objUser = objProMem.getUser();
        if ((strSelectedSubmitterID != "0") && (Integer.parseInt(strSelectedSubmitterID) == objUser.getUserID())) {
                strSubmitterOption = strSubmitterOption + "<option selected value='" + objUser.getUserID() + "' >" + objUser.getFullName() + "</option>";
        }
        else
                strSubmitterOption = strSubmitterOption + "<option value='" + objUser.getUserID() + "' >" + objUser.getFullName() + "</option>";

        if ((strSelectedAssignedUserID != "") && (Integer.parseInt(strSelectedAssignedUserID) == objUser.getUserID())) {
                strAssignedUserOption = strAssignedUserOption + "<option selected value='" + objUser.getUserID() + "' >" + objUser.getFullName() + "</option>";
        }
        else
                strAssignedUserOption = strAssignedUserOption + "<option value='" + objUser.getUserID() + "' >" + objUser.getFullName() + "</option>";

}

//Get list of issues
objProMem.setProject(objProject);
objIssue.setSubmiter(objProMem);
setTemp = objIssue.getListProjectIssue();
iter = setTemp.iterator();
for (int i = 0; iter.hasNext(); i++) {

       objIssue = (Issue) iter.next();
       objIssueStatus = objIssue.getIssuestatus();
       objIssueType = objIssue.getIssuetype();
       objSeverity = objIssue.getSeverity();
       objArtifact = objIssue.getArtifact();
       objSubSystem = objIssue.getSubsystem();
       objReproducibility = objIssue.getReproducibility();
       objSummiter = objIssue.getSubmiter();
       objAssignedUser = objIssue.getAssignedUser();

       //Apply Filter issue here
       boolean bShow = false;
       if(Integer.parseInt(strSelectedSubmitterID)==0){
       		if((Integer.parseInt(strSelectedAssignedUserID)==0)||(Integer.parseInt(strSelectedAssignedUserID)==objAssignedUser.getUser().getUserID())){
               		bShow = true;
                }
       }
       else if(Integer.parseInt(strSelectedAssignedUserID)==0){
         	if(Integer.parseInt(strSelectedSubmitterID)==objSummiter.getUser().getUserID())
	       		bShow = true;
            }
      else if((Integer.parseInt(strSelectedSubmitterID)==objSummiter.getUser().getUserID())&&(Integer.parseInt(strSelectedAssignedUserID)==objAssignedUser.getUser().getUserID())){
		bShow = true;
		}
       if(!bShow) continue;
       intCountIssue +=1;
       if ((i % 2) == 0) {
            strIssueList = strIssueList + "<tr>";
            strIssueList = strIssueList        + "<td width=\"44\" class=\"EvenTableRow\" nowrap>" + Integer.toString(objIssue.getIssueID()) + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"160\" nowrap>" + objIssue.getTitle() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"55\" nowrap>" + objIssueStatus.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"95\" nowrap>" + objIssueType.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"55\" nowrap>" + objSeverity.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"56\" nowrap>" + Integer.toString(objIssue.getPriority()) + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"66\" nowrap>" + objSummiter.getUser().getFullName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"47\" nowrap>"  + objAssignedUser.getUser().getFullName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"66\" nowrap>" + objIssue.getAssignedDate() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"154\" nowrap>" + objArtifact.getDescription() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"84\" nowrap>" + objSubSystem.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"143\" nowrap>" + objReproducibility.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" nowrap>" + objIssue.getBuildNumber() + "</td>";
            strIssueList = strIssueList        + "<td class=\"EvenTableRow\" width=\"40\" nowrap>";
            strIssueList = strIssueList               + "<input type=\"radio\" value=\"" + Integer.toString(objIssue.getIssueID()) + "\"  name=\"rdoIssue\"></td>";
            strIssueList = strIssueList + "<tr>";
    }
    else {
            strIssueList = strIssueList + "<tr>";
            strIssueList = strIssueList        + "<td width=\"44\" class=\"EvenTableRow\" nowrap>" + Integer.toString(objIssue.getIssueID()) + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"160\" nowrap>" + objIssue.getTitle() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"55\" nowrap>" + objIssueStatus.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"95\" nowrap>" + objIssueType.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"55\" nowrap>" + objSeverity.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"56\" nowrap>" + Integer.toString(objIssue.getPriority()) + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"66\" nowrap>" + objSummiter.getUser().getFullName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"47\" nowrap>"  + objAssignedUser.getUser().getFullName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"66\" nowrap>" + objIssue.getAssignedDate() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"154\" nowrap>" + objArtifact.getDescription() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"84\" nowrap>" + objSubSystem.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"143\" nowrap>" + objReproducibility.getName() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" nowrap>" + objIssue.getBuildNumber() + "</td>";
            strIssueList = strIssueList        + "<td class=\"OddTableRow\" width=\"40\" nowrap>";
            strIssueList = strIssueList               + "<input type=\"radio\" value=\"" + Integer.toString(objIssue.getIssueID()) + "\"  name=\"rdoIssue\"></td>";
            strIssueList = strIssueList + "<tr>";
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
	document.frmIssue.txtAction.value=p_intNumber;
      	document.frmIssue.submit();
  }

function LoadPage(){
        document.frmIssue.txtAction.value=0;
     	document.frmIssue.submit();
  }
</script>
<title>Issue List</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menuissuetracking.jsp" flush="true"/>

        <tr>

          	<td>
		<table border="0" width="100%" id="table6" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0">
			<tr>
				<td class="ListTitle">
				<p align="center"><font color="#ff0000"><%=strError%></td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="100%" id="table7" cellspacing="0" cellpadding="0">
					<tr>
						<td>
						<form name="frmIssue" method="POST" action="issuelist.jsp">

							<table border="0" width="100%" id="table10" cellspacing="0" cellpadding="0">
								<tr>
									<td align="center">
									<table border="0" width="100%" id="table11" class="TableBorderFrm">
										<tr>
											<td class="CellBorderCaptionFrm" nowrap width="11%">
											Project:
											<select size="1" name="cboProject" class="ComboBoxStyle" onchange="javascript:LoadPage();">
												<%=strProjectOption %>
											</select></td>
											<td class="CellBorderCaptionFrm" width="35%" nowrap>
											Filter : Submitter&nbsp;
											<select size="1" name="cboSubmitter" class="ComboBoxStyle" onchange="javascript:LoadPage();">
                                                                                                <%=strSubmitterOption %>
											</option>
											</select> Assigned user
											<select size="1" name="cboAssignedUser" class="ComboBoxStyle" onchange="javascript:LoadPage();">
                                                                                                <%=strAssignedUserOption%>
											</option>
											</select></td>
											<td class="CellBorderCaptionFrm" width="7%">
											<input type="button" value="Export XML" name="btnExportXML" class="ButtonAutoSizeStyle" onclick="javascript:Submit(1);"></td>
											<td class="CellBorderCaptionFrm" align="right">
											Total issues :<%=Integer.toString(intCountIssue) %> </td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							<br>
							<table border="0" width="100%" id="table8" class="BorderTable">
								<tr>
									<td class="HeaderTable" width="44" nowrap>
									ID</td>
									<td class="HeaderTable" width="160" nowrap>Issue
									Title</td>
									<td class="HeaderTable" width="55" nowrap>Status</td>
									<td class="HeaderTable" width="95" nowrap>Type</td>
									<td class="HeaderTable" width="55" nowrap>Severity</td>
									<td class="HeaderTable" width="56" nowrap>
									Priority</td>
									<td class="HeaderTable" width="66" nowrap>
									Submitter</td>
									<td class="HeaderTable" width="47" nowrap>
									Assign.</td>
									<td class="HeaderTable" width="66" nowrap>
									Sub.date</td>
									<td class="HeaderTable" width="154" nowrap>
									Artifact</td>
									<td class="HeaderTable" width="84" nowrap>
									Sub system</td>
									<td class="HeaderTable" width="143" nowrap>
									Reproducibility</td>
									<td class="HeaderTable" nowrap>Build Num</td>
									<td class="HeaderTable" width="40" nowrap>Select</td>
								</tr>
								<%=strIssueList %>
							</table>
							<table border="0" width="100%" id="table9">
								<tr>
									<td width="30%">&nbsp;</td>
									<td width="20%">
									<input type="button" value="Add" name="btnAdd" class="ButtonStyle" onclick="javascript:Submit(2);"></td>
									<td width="20%">
									<input type="button" value="Update" name="btnUpdate" class="ButtonStyle" onclick="javascript:Submit(3);"></td>
									<td width="30%">
									<input type="button" value="Delete" name="btnDelete" class="ButtonStyle" onclick="javascript:Submit(4);"></td>
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

<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
  User objUser, objActor;
  Project objProject;
  Role objRole;
  TrackingRight objRight;
  ProjectMember objProMem;
  Set setTemp;
  Iterator iter;
  int intResult, intSubmit; //1=Insert, 2=Delete
  String strProjectOption, strUserOption, strRoleOption, strRightOption;
  String strUserList, strAlert, strError;
  String strSelectedProjectID, strSelectedRoleID, strSelectedRightID;
  //strInUserID = User to delete right of project admin
  //strOutUserID = User to insert right of project admin
  String strInUserID, strOutUserID;
  //init variables
  objUser = new User();
  objActor = new User();
  objProject = new Project();
  objRole = new Role();
  objRight = new TrackingRight();
  objProMem = new ProjectMember();
  strUserList = "";
  strUserOption = "";
  strProjectOption = "";
  strRoleOption = "";
  strRightOption = "";
  strError = "";
  strAlert = "";
  //get form data
  if (Utility.ConvertNullToEmpty(request.getParameter("txtAction")) != "") {
    intSubmit = Integer.parseInt(request.getParameter("txtAction"));
  }
  else
    intSubmit = 0;
  strSelectedProjectID = Utility.ConvertNullToEmpty(request.getParameter("cboProject"));
  strOutUserID = Utility.ConvertNullToEmpty(request.getParameter("cboUser"));
  strInUserID = Utility.ConvertNullToEmpty(request.getParameter("txtSelectedUserID"));
  strSelectedRoleID = Utility.ConvertNullToEmpty(request.getParameter("cboRole"));
  strSelectedRightID = Utility.ConvertNullToEmpty(request.getParameter("cboRight"));
  //Insert or Delete a user have right of project admin
  if (intSubmit > 0) {
    switch (intSubmit) {
    case 1: //Insert a new member to project
      if ((strSelectedProjectID!="")&&(strOutUserID != "") && (strSelectedRoleID != "") && (strSelectedRightID != "")) {
        objUser.setUserID(Integer.parseInt(strOutUserID));
        objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
        objRole.setRoleID(Integer.parseInt(strSelectedRoleID));
        objRight.setTrackingRightID(Integer.parseInt(strSelectedRightID));
        objProMem = new ProjectMember();
        objProMem.setProjectMember(objUser, objProject, objRole, objRight);
        intResult = objProMem.add();
        if (intResult == SysConstant.OK) {
          strAlert = "alert(\"The selected user was inserted sucessfully into project\")";
        }
        else
          strError = "Cannot insert this user";
      }
      else
        strError = "You must select User, Role, Right to insert";
      break;
    case 2: //Remove selected user of list of project admin
      if (strInUserID != "") {
        objUser.setUserID(Integer.parseInt(strInUserID));
        objProject.setProjectID(Integer.parseInt(strSelectedProjectID));
        //objRole,objRight are redundant in function below
        //we just need ProjectID and UserID to delete this user out of project member list
        objProMem.setProjectMember(objUser, objProject, objRole, objRight);
        intResult = objProMem.delete();
        if (intResult == SysConstant.OK) {
          strAlert = "alert(\"The selected user has been removed of list of project's members\");";
          break;
        }
        else
          strError = "Cannot delete this user";
      }
      else
        strError = "You did not select any user to delete";
    }
  }
  //Get list of projects who this actor admin
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
  //Get list of Users who are not members of project
  setTemp = objUser.getListUserNotInProject(objProject);
  iter = setTemp.iterator();
  for (int i = 0; iter.hasNext(); i++) {
    objUser = (User) iter.next();
    //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
    if (strOutUserID == "")
      strOutUserID = Integer.toString(objUser.getUserID());
    if ((strOutUserID != "") && (Integer.parseInt(strOutUserID) == objUser.getUserID())) {
      strUserOption = strUserOption + "<option selected value='" + objUser.getUserID() + "' >" + objUser.getFullName() + "</option><br>";
    }
    else
      strUserOption = strUserOption + "<option value='" + objUser.getUserID() + "' >" + objUser.getFullName() + "</option><br>";
  }
  //Get list of Roles
  objRole.setProject(objProject);
  setTemp = objRole.getListProjectRole();
  iter = setTemp.iterator();
  for (int i = 0; iter.hasNext(); i++) {
    objRole = (Role) iter.next();
    //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
    if (strSelectedRoleID == "")
      strSelectedRoleID = Integer.toString(objRole.getRoleID());
    if ((strSelectedRoleID != "") && (Integer.parseInt(strSelectedRoleID) == objRole.getRoleID())) {
      strRoleOption = strRoleOption + "<option selected value='" + objRole.getRoleID() + "' >" + objRole.getName() + "</option><br>";
    }
    else
      strRoleOption = strRoleOption + "<option value='" + objRole.getRoleID() + "' >" + objRole.getName() + "</option><br>";
  }
  //Get list of Rights
  setTemp = objRight.getAllTrackingRight();
  iter = setTemp.iterator();
  for (int i = 0; iter.hasNext(); i++) {
    objRight = (TrackingRight) iter.next();
    //If this is fist load of this page, set strSelectedProjectID = first Project ID in list
    if (strSelectedRightID == "")
      strSelectedRightID = Integer.toString(objRight.getTrackingRightID());
    if ((strSelectedRightID != "") && (Integer.parseInt(strSelectedRightID) == objRight.getTrackingRightID())) {
      strRightOption = strRightOption + "<option selected value='" + objRight.getTrackingRightID() + "' >" + objRight.getName() + "</option><br>";
    }
    else
      strRightOption = strRightOption + "<option value='" + objRight.getTrackingRightID() + "' >" + objRight.getName() + "</option><br>";
  }
  //Get list of project members
  objProMem.setProject(objProject);
  setTemp = objProMem.getListProjectMember();
  iter = setTemp.iterator();
  for (int i = 0; iter.hasNext(); i++) {
    objProMem = (ProjectMember) iter.next();
    objUser = objProMem.getUser();
    objProject = objProMem.getProject();
    objRole = objProMem.getRole();
    objRight = objProMem.getTrackingright();
    if ((i % 2) == 0) {
      strUserList = strUserList + "<tr>";
      strUserList = strUserList + "<td class=\"EvenTableRow\" width=\"210\">" + objUser.getFullName() + "</td>";
      strUserList = strUserList + "<td class=\"EvenTableRow\" width=\"174\">" + objRole.getName() + "</td>";
      strUserList = strUserList + "<td class=\"EvenTableRow\" width=\"141\">" + objRight.getName() + "</td>";
      strUserList = strUserList + "<td class=\"EvenTableRow\" align=\"center\">";
      if(objActor.getUserID()!=objUser.getUserID())
      	strUserList = strUserList + "<img border=\"0\" src=\"images/trash.gif\" width=\"14\" height=\"14\" onclick=\"javascript:Delete(" + Integer.toString(objUser.getUserID()) + ");\"></td>";
      strUserList = strUserList + "</tr>";
    }
    else {
      strUserList = strUserList + "<tr>";
      strUserList = strUserList + "<td class=\"OddTableRow\" width=\"210\">" + objUser.getFullName() + "</td>";
      strUserList = strUserList + "<td class=\"OddTableRow\" width=\"174\">" + objRole.getName() + "</td>";
      strUserList = strUserList + "<td class=\"OddTableRow\" width=\"141\">" + objRight.getName() + "</td>";
      strUserList = strUserList + "<td class=\"OddTableRow\" align=\"center\">";
      if(objActor.getUserID()!=objUser.getUserID())
	strUserList = strUserList + "<img border=\"0\" src=\"images/trash.gif\" width=\"14\" height=\"14\" onclick=\"javascript:Delete(" + Integer.toString(objUser.getUserID()) + ");\"></td>";
      strUserList = strUserList + "</tr>";
    }
  }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<script type="" language="javascript" >

function Init(){
	<%
	if((intSubmit>0)&&(strError=="")){
		out.println(strAlert);
        }
	%>
}

function Insert(){
      document.frmProMem.txtAction.value=1;
      document.frmProMem.submit();
}

function Delete(p_intUserID){
      document.frmProMem.txtAction.value=2;
      document.frmProMem.txtSelectedUserID.value=p_intUserID;
      document.frmProMem.submit();

}

function LoadProject(){

        document.frmProMem.submit();
}
</script>
<link href="style/formstyle.css" type=text/css rel=stylesheet>
<title>Project managers</title>
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
        <td align="center">
          <font color="#ff0000"><%=strError%>          </font>
        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="center">
          <form name="frmProMem" method="POST" action="managepromember.jsp">
          <table border="0" width="60%" id="table7" class="TableBorderFrm">
            <tr>
              <td class="CellBorderCaptionFrm" width="20%">
                <p align="center">Project
              </td>
              <td class="CellBorderCaptionFrm" width="30%">
                <p align="center">User
              </td>
              <td class="CellBorderCaptionFrm" width="20%">
                <p align="center">Role
              </td>
              <td class="CellBorderCaptionFrm" width="20%">
                <p align="center">Right
              </td>
              <td class="CellBorderCaptionFrm" width="10%">&nbsp;              </td>
            </tr>
            <tr>
              <td class="CellBorderFrm" width="20%">
                <select size="1" name="cboProject" class="ComboBoxStyle" onchange="javascript:LoadProject();"><%=strProjectOption %>                </select>
              </td>
              <td class="CellBorderFrm" width="30%">
                <select size="1" name="cboUser" class="ComboBoxStyle"><%=strUserOption %>                </select>
              </td>
              <td class="CellBorderFrm" width="20%">
                <select size="1" name="cboRole" class="ComboBoxStyle"><%=strRoleOption %>                </select>
              </td>
              <td class="CellBorderFrm" width="20%">
                <select size="1" name="cboRight" class="ComboBoxStyle"><%=strRightOption %>                </select>
              </td>
              <td class="CellBorderFrm" width="10%">
                <input type="button" value="Insert" name="btnInsert" class="ButtonStyle" onclick="javascript:Insert();">
              </td>
            </tr>
          </table>
          <input name=txtAction ID=txtAction value="" type=hidden>
          <input name=txtSelectedUserID ID=txtSelectedUserID value="" type=hidden>
          </form>
        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="center">
          <table border="0" width="50%" id="table9" class="BorderTable">
            <tr>
              <td class="HeaderTable" width="210">
                <p align="center">Users
              </td>
              <td class="HeaderTable" align="center" width="174">Role              </td>
              <td class="HeaderTable" align="center" width="141">Right              </td>
              <td class="HeaderTable">&nbsp;</td>
            </tr>
	<%=strUserList %>
	</table>
        </td>
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
</table><jsp:include page="footer.jsp" flush="true"/>



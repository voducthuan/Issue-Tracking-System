<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>

<%
  String strLoginName, strPassword, strProject,strTemp = "",strError="",strNextPage="";
  int intRight,intResult;
  User objUser;
  Project objProject;
  AdminSystemRight objAddminRight;
  Set setProject,setAdminRight;
  Iterator iter;
  objProject = new Project();
 // ProjectMember objProMem;
  TrackingRight objTrackingRight;

  strLoginName = request.getParameter("txtLoginName");
  strPassword = request.getParameter("txtPassword");
  if(request.getParameter("chkRight")!=null)
       intRight = Integer.parseInt(request.getParameter("chkRight"));
  else
       intRight = 0;
  strProject = request.getParameter("cboProject");

  try
  {
      setProject = objProject.getAllProject();
      iter = setProject.iterator();
      for (int i=0; iter.hasNext();i++ ) {
        objProject = (Project) iter.next();
        if(i==0)
             strTemp = "<option selected value='" + objProject.getProjectID() + "' >" + objProject.getName() +"</option><br>";
        else
             strTemp = strTemp + "<option value='" + objProject.getProjectID() +"' >" + objProject.getName() +"</option><br>";
      }
  }
  catch (Exception e) {
  }


  if(request.getParameter("txtAction")!=null)
  {
      objUser = new User();
      objUser.setUserName(strLoginName);
      intResult = objUser.loadbyLoginName();
      if((intResult != SysConstant.OK)||(strPassword.compareToIgnoreCase(objUser.getPassword())!=0))
        strError = "Login fail, Please try again";
      else
      {
            setAdminRight = objUser.getAdminsystemright();
            switch(intRight){
            case 1:
                  iter = setAdminRight.iterator();
                  for (; iter.hasNext();) {
                    objAddminRight = (AdminSystemRight) iter.next();
                    if(objAddminRight.getSystemRightID()==1){

                       strNextPage = "managecomadmin.jsp";
                       session.setAttribute("objuser",objUser);
                       response.sendRedirect(strNextPage);
                       return;
                     }
                  }
                  strError = "Login fail, You don't have right of Company Administration ";
                  break;
            case 2:
                  iter = setAdminRight.iterator();
                  for (; iter.hasNext();) {
                    objAddminRight = (AdminSystemRight) iter.next();
                    if(objAddminRight.getSystemRightID()==2){

                       strNextPage = "manageappadmin.jsp";
                       session.setAttribute("objuser",objUser);
                      response.sendRedirect(strNextPage);
                      return;
                    }
                  }
                  strError = "Login fail, You don't have right of Application Administration  ";
                  break;
            case 3:
                  	boolean isProAdmin=false;
			iter = setAdminRight.iterator();
                      	for (; iter.hasNext();) {
	                    objAddminRight = (AdminSystemRight) iter.next();
	                    if(objAddminRight.getSystemRightID()==3){
                       		isProAdmin=true;
                                break;
	                    }
                      	}
                        if(isProAdmin){
                            	setProject = objUser.getListProjectOfSystemAdmin();
                       		iter = setProject.iterator();
				for (; iter.hasNext();) {
					objProject = (Project)iter.next();
                                	if(objProject.getProjectID()==Integer.parseInt(strProject)){
                                		strNextPage = "domainlist.jsp";
						session.setAttribute("objuser",objUser);
						response.sendRedirect(strNextPage);
                                                return;
        	                        	//break;

                	                }
                       		}
                        	// this user don't have project manager right on any project
	                         strError = "Login fail, You don't have Project Administration right on this project";
                    	}
                        else
				strError = "Login fail, You don't have Project Administration right";
            }//end switch
  	}//end else
  }//end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link href="style/formstyle.css" type=text/css rel=stylesheet>
<script type="" language="javascript" >
    function Submit(p_intNumber){
      document.frmLogin.txtAction.value=p_intNumber;
      if(p_intNumber==1){
        document.frmLogin.submit();
      }
    }
</script>

<title>Login</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9">

<jsp:include page="header.jsp" flush="true"/>

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
                  <img border="0" src="images/login.gif" width="16" height="16">
                  Administration
                </td>
              </tr>
              <tr>
                <td class="CellBorderFrm">
                  <form name="frmLogin" method="POST" action="systemadmin.jsp">

                  <table border="0" width="100%" id="table8" class="BorderTable">
                    <tr>
                      <td class="Label">Login Name</td>
                      <td>
                        <input type="text" name="txtLoginName" size="20" class="TextBoxStyle">
                      </td>
                    </tr>
                    <tr>
                      <td class="Label">Password</td>
                      <td>
                        <input type="password" name="txtPassword" size="20" class="TextBoxStyle">
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" class="CellBorderFrm">
                        <table border="0" width="100%" id="table9">
                          <tr>
                            <td class="Label">
                              <input type="radio" value="1" checked name="chkRight">
                              Company Administration
                              <br>
                              In order to:
                              <br>
                              - create / delete departments
                              <br>
                              - define teams
                              <br>
                              - define users
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" class="CellBorderFrm">
                        <table border="0" width="100%" id="table10">
                          <tr>
                            <td class="Label">
                              <input type="radio" name="chkRight" value="2">

                              Application
                              Administration
                              <br>
                              In order to:
                              <br>
                              - create / delete projects
                              <br>

                              - define other application
                              administrators
                              <br>
                              - define project administrators
                              <br>
                              - see current sessions
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" class="CellBorderFrm">
                        <table border="0" width="100%" id="table11">
                          <tr>
                            <td class="Label">
                              <input type="radio" name="chkRight" value="3">
                              Project Administration
                              <select size="1" name="cboProject" class="ComboBoxStyle">
                                <%=strTemp%>
                              </select>
                              <br>
                              In order to:
                              <br>
                              - create / delete domains
                              <br>

                              - create / delete sub-systems, and
                              assign them to a domain
                              <br>

                              - assign profiles (developer,
                              responsible, supervisor...) to
                              people
                              <br>
                              - assign people to domains.
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <input type="button" onclick="javascript:Submit(1);" value="Login" name="btnLogin" class="ButtonStyle">
                      </td>
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
          <td>
            <p align="center">              [
              <a class="LinkTextStyle" href="login.jsp">
                Back
                to application
</a>
              ]

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
</table>
<jsp:include page="footer.jsp" flush="true"/>

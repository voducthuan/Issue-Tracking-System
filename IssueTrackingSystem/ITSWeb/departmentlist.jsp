<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
Department objDept;
Set setTemp;
Iterator iter;

int intSubmit;//1=Add, 2=Update, 3 =Delete
int intResult;
String strSelectedDeptID,strError;
String strDeptList,strNextPage,strAlert;
//init variables
objDept = new Department();
strDeptList="";
strError="";
strAlert="";

//get form data
if(Utility.ConvertNullToEmpty(request.getParameter("txtAction"))!=""){
	intSubmit = Integer.parseInt(request.getParameter("txtAction"));
}
else
	intSubmit = 0;

if(intSubmit>0){

	strSelectedDeptID = Utility.ConvertNullToEmpty(request.getParameter("cboSelect"));
	switch(intSubmit){
        case 1:
        	strNextPage = "adddepartment.jsp";
        	response.sendRedirect(strNextPage);
		break;
        case 2:
        	if(strSelectedDeptID!=""){
                  	strNextPage = "updatedepartment.jsp?DepartmentID=" + strSelectedDeptID ;
                  	response.sendRedirect(strNextPage);
                  	return;
                }
                else
                	strError = "You did not select any department to edit";
                break;
        case 3:
        	if(strSelectedDeptID!=""){
                	objDept.setDepartmentID(Integer.parseInt(strSelectedDeptID));
	                intResult = objDept.delete();
	                if(intResult==SysConstant.OK){
	                	strAlert = "alert('The selected department was deleted sucessfully');";
				break;
	                }
	                else
	                	strError = "Cannot delete this department";
                }
                else
                	strError = "You did not select any department to delete";

        }
}

//Get user list
setTemp = objDept.getAllDepartment();
iter = setTemp.iterator();
for (int i=0; iter.hasNext();i++ ) {
	objDept = (Department) iter.next();
        if((i%2)==0){
		strDeptList = strDeptList + "<tr>";
                strDeptList = strDeptList	+ "<td width=\"173\" class=\"EvenTableRow\">";
                strDeptList = strDeptList		+ Integer.toString(objDept.getDepartmentID());
                strDeptList = strDeptList	+ "</td>";
		strDeptList = strDeptList	+ "<td class=\"EvenTableRow\">" + objDept.getDescription() +"</td>";
		strDeptList = strDeptList	+ "<td class=\"EvenTableRow\">";
		strDeptList = strDeptList	 	+ "<input type=\"radio\" value=\"" +  Integer.toString(objDept.getDepartmentID()) + "\"  name=\"cboSelect\">";
                strDeptList = strDeptList	+ "</td>";
	       	strDeptList = strDeptList + "</tr>";
        }
        else{
      		strDeptList = strDeptList + "<tr>";
                strDeptList = strDeptList	+ "<td width=\"173\" class=\"OddTableRow\">";
                strDeptList = strDeptList		+ Integer.toString(objDept.getDepartmentID());
                strDeptList = strDeptList	+ "</td>";
		strDeptList = strDeptList	+ "<td class=\"OddTableRow\">" + objDept.getDescription() +"</td>";
		strDeptList = strDeptList	+ "<td class=\"OddTableRow\">";
		strDeptList = strDeptList	 	+ "<input type=\"radio\" value=\"" +  Integer.toString(objDept.getDepartmentID()) + "\"  name=\"cboSelect\">";
                strDeptList = strDeptList	+ "</td>";
	       	strDeptList = strDeptList + "</tr>";
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
      document.frmDept.txtAction.value=p_intNumber;
      document.frmDept.submit();
    }
</script>
<title>Department List</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">
<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menucompanyadmin.jsp" flush="true"/>
	<tr>
		<td>
		<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
			<tr>
				<td align="center"><font color="#ff0000"><%=strError%></font></td>
			</tr>
			<tr>
				<td class="ListTitle">
				<p align="center">Department List</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="50%" id="table7">
					<tr>
						<td>
						<form name="frmDept" method="POST" action="departmentlist.jsp">

							<table border="0" width="100%" id="table8" class="BorderTable">
								<tr>
									<td class="HeaderTable" width="165">
									Department ID</td>
									<td class="HeaderTable">Department Name</td>
									<td class="HeaderTable">Select</td>
								</tr>
								<%=strDeptList%>
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

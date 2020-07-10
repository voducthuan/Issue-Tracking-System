<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>
<%
User objUser;
objUser = (User) session.getAttribute("objuser");

%>
<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0">
  <tr>
  <td>
  <table border="0" width="100%" id="tablen" cellspacing="0" cellpadding="0">
	<tr height="21">
		<td background="images\Header11.jpg" width="768">&nbsp;</td>
		<td background="images\Header12.jpg">&nbsp;</td>
	</tr>
	<tr height="42">
		<td background="images\Header21.jpg" width="768" nowrap>
		  <table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0">
			<tr>
				<td width="6%">&nbsp;</td>
				<td width="94%" class="TileStyle"> Issue Tracking System</td>
			</tr>
			</table>
		</td>
		<td background="images\Header22.jpg">&nbsp;</td>
	</tr>
	<tr height="28">
		<td background="images\Header31.jpg" width="768">
		<table border="0" width="100%" id="table5">
			<tr>
				<td width="409">&nbsp;</td>
				<td width="38">
				<%
                                if(objUser !=null)
                                	out.println("<img border=\"0\" src=\"images/login.gif\" width=\"16\" height=\"16\">");
				else
                               		out.println("<img border=\"0\" src=\"images/notlogin.gif\" width=\"16\" height=\"16\">");
                                %>
                                </td>

                                <td class="LoginStatusStyle">
                                <%
                               		if(objUser !=null)
                                        	out.println("Welcome " + objUser.getUserName());
                                        else
                                        	out.println("Not login");
                                %>
                                </td>
			</tr>
		</table>
		</td>
		<td background="images\Header32.jpg">&nbsp;</td>
	</tr>
  </table>
  </td>
    </tr>

<%@page import="tool.*"%>
<%@page import="ITS.*"%>
<%@page import="java.util.*"%>


<%

User objUser;

objUser = (User) session.getAttribute("objuser");
if(objUser !=null)
	session.removeAttribute("objuser");




%>




<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link href="style/formstyle.css" type=text/css rel=stylesheet>
<script type="" language="javascript" >
function Init(){
	window.location.href = "systemadmin.jsp";

}



</script>
<title>Update User</title>
</head>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="javascript:Init();">

</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
  <body>
   <script language="javascript" type="text/javascript">
  		function check(form){
  			if(document.loginform.AdminName.value==""){
  				alert("请输入管理员名称");
  				document.loginform.AdminName.focuns();
  				return false;
  			}
  			if(document.loginform.Password.value==""){
  				alert("请输入密码");
  				document.loginform.Password.focuns();
  				return false;
  			}
  		}
  		window.onload=function(){
  			document.getElementById("AdminName").focus();
  			document.getElementById("AdminName").value="";
  			document.getElementById("Password").value="";
  		}
  	</script> 
    <form name="loginform" action="manager/login-check.jsp" method="post" onsubmit="return check(this)">
    <table>
    	<tr><td colspan="2" align="center">博客管理系统管理员登陆</td></tr>
    	<tr><td><input name="AdminName" type="text" /></td></tr>
    	<tr><td><input name="Password" type="password" /></td></tr>
    	<tr><td><input type="submit" value="登陆"/></td></tr>
    </table>
    </form>
  </body>
</html>

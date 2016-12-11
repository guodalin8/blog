<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.common.*" %>
<%
Users users=new Users();
String username=request.getParameter("AdminName");
String password=request.getParameter("Password");
if(!users.isExist(username, password))
	out.println("<script>alert('用户名或密码错误');window.location.href('login.jsp');</script>");
else{
	Utilty.writeCookie(response, "admin", username);
	response.sendRedirect("menu.jsp");
}
%>

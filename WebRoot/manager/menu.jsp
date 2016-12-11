<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*" %>
<%@	include file="islogin.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>博客管理系统后台</title>
  </head>
  
  <body>
   	<table width="256" border="0">
   		<tr><td>博客管理系统后台</td></tr>
   		<tr><td>欢迎您：<%=Utilty.readCookie(request, "admin")%><a href="/blog/manager/logout.jsp">退出</a></td></tr>
   		<tr><td><a href="/blog/manager/blog-edit.jsp?action=add">发布博文</a></td></tr>
   		<tr><td><a href="/blog/manager/blog-manage.jsp">博文管理</a></td></tr>
   		<tr><td><a href="/blog/manager/class-edit.jsp?action=add">添加博文分类</a></td></tr>
   		<tr><td><a href="/blog/manager/class-manage.jsp?">博文分类管理</a></td></tr>
   		<tr><td><a href="/blog/manager/users-manage.jsp">用户管理</a></td></tr>
   	</table>
  </body>
</html>

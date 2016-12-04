<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@	include file="islogin.jsp" %>
<%@	page import="com.ch7.common.*" %>
<%@	page import="com.ch7.model.*" %>
<%@	page import="com.ch7.dal.*" %>
<%
	Users user=new Users();
	int result=0;
	result=user.delete(request.getParameter("username"));
	if(result==1){
		out.println("<script>alert('删除用户成功');window.location.href('users-manage.jsp');</script>");
	}else{
		out.println("<script>alert('删除用户失败');window.location.href('users-manage.jsp');</script>");
	}
%>

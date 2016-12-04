<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.ch7.common.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String data =Utilty.readCookie(request, "admin");
	if(DataValidator.isNullOrEmpty(data)){
		response.sendRedirect("login.jsp");
	}
%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@	include file="islogin.jsp" %>
<%@	page import="com.ch7.common.*" %>
<%@	page import="com.ch7.model.*" %>
<%@	page import="com.ch7.dal.*" %>
<%
	String data1=Utilty.readCookie(request, "user");
	if(DataValidator.isNullOrEmpty(data)){
		response.sendRedirect("index.jsp");
	}else{
		Utilty.writeCookie(response, "user", data1, 0);
		response.sendRedirect("index.jsp");
	}
%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*" %>
<%
	ClassF cls=new ClassF();
	int result=0;
	result=cls.delete(DataConverter.toInt(request.getParameter("id")));
	if(result==1){
		out.println("<script>alert('分类删除成功');window.location.href('class-manage.jsp');</script>");
	}else{
		out.println("<script>alert('分类删除失败');window.location.href('class-manage.jsp');</script>");
	}
%>
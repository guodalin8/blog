<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*" %>
<%
	Comment comment=new Comment();
	int result=0;
	result=comment.delete(DataConverter.toInt(request.getParameter("id")));
	if(result==1){
		out.println("<script>alert('博文评论删除成功');window.location.href('comment-manage.jsp?blogid="+request.getParameter("blogid")+"');</script>");
	}else{
		out.println("<script>alert('博文评论删除失败');window.location.href('comment-manage.jsp?blogid="+request.getParameter("blogid")+"');</script>");
	}
%>
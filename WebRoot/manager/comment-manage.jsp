<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Comment comment=new Comment();
	String keyword=request.getParameter("keyword");
	int blogid=DataConverter.toInt(request.getParameter("blogid"));
	List<CommentInfo> list=comment.getListByBlogId(blogid);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>My JSP 'comment-manage.jsp' starting page</title>
  </head>
  
  <body>
   	<p>当前位置：评论管理</p>
   	<table width="1000">
   		<tr>
   			<td>评论内容</td>
   			<td>评论人</td>
   			<td>评论时间</td>
   			<td>操作</td>
   		</tr>
   		<%
   			for(CommentInfo info:list){
   		%>
   		<tr>
   			<td width="700"><%=Utilty.Substring(info.getContext(), 100) %></td>
   			<td width="100"><%=info.getUsername() %></td>
   			<td width="100"><%=info.getCreatedtime() %></td>
   			<td width="100">
   				<a href="comment-delete.jsp?id=<%=info.getId() %>&blogid=<%=info.getBlogid() %>">删除</a>
   			</td>
   		</tr>
   		
   		<%
   			}
   		%>
   	</table>
  </body>
</html> 

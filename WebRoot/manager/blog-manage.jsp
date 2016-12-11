<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@	include file="islogin.jsp" %>
<%@	page import="com.ch7.model.*" %>
<%@	page import="com.ch7.dal.*" %>

<%
	request.setCharacterEncoding("utf-8");
	Blog blog=new Blog();
	String keyword=request.getParameter("keyword");
	List<BlogInfo> list=blog.getList(keyword);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <body>
    <p>当前位置：博文管理</p>
    <form id="form1" name="form1" method="post"action="blog-manage.jsp">
    	请输入要查询的博文标题：
    	<input type="text" name="keyword" id="keyword" />
    	<input type="submit" name="button" id="button" value="查询" />
    </form>
    <table width="98%" border="1">
    	<tr>
    		<td>博文标题</td>
    		<td>所属分类</td>
    		<td>发布时间</td>
    		<td>操作</td>
    	</tr>
    	<%
    		for(BlogInfo info:list){
    	%>
    	<tr>
    		<td><%=info.getTitle() %></td>
    		<td><%=info.getClassName() %></td>
    		<td><%=info.getCreatedtime() %></td>
    		<td>
    			<a href="blog-edit.jsp?id=<%=info.getId()%>&action=edit">编辑</a>
    			|<a href="blog-delete.jsp?id=<%=info.getId()%>">删除</a>
    			|<a href="comment-manage.jsp?blogid=<%=info.getId()%>">评论</a>
    		</td>
    	</tr>
    	<%
    		}
    	%>
    </table>
  </body>


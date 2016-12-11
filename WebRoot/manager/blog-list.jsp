<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*" %>
<%
	Blog blog=new Blog();
	int classId=DataConverter.toInt(request.getParameter("classId"));
	List<BlogInfo> list=blog.getListByClassId(classId);
	//获得博文分类
	ClassF cls=new ClassF();
	List<ClassInfo> clist=cls.getList();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'blog-list.jsp' starting page</title>

  </head>
  
  <body>
    <div id="content">
    	<%
    		for(BlogInfo info:list){
    	%>
    	<div class="post">
    		<h1 class="title"><a href="blog-information.jsp?id=<%=info.getId()%>"><%=info.getTitle() %></a></h1>
    		<p class="byline"><%=info.getCreatedtime() %></p>
    		<div class="entry">
    			<p><%=Utilty.Substring(info.getContext(), 300) %>
    		</div>
    		<p class="meta"><a href="#" class="more">分类：<%=info.getClassName() %></a>
    			&nbsp;&nbsp;&nbsp;<a href="#" class="more">详情</a>&nbsp;&nbsp;&nbsp;
    		</p>
    	</div>
    	<%
    		}
    	%>
    </div>
  </body>
</html>

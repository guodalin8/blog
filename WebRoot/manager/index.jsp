<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@	include file="islogin.jsp" %>
<%@	page import="com.ch7.model.*" %>
<%@	page import="com.ch7.dal.*" %>
<%@	page import="com.ch7.common.*" %>
<%
	Blog blog=new Blog();
	List<BlogInfo>list=blog.getList(null);
	ClassF cls=new ClassF();
	List<ClassInfo> clist=cls.getList();
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'blog-manage.jsp' starting page</title>

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
				<p><%=Utilty.Substring(info.getContext(), 300) %></p>
			</div>
			<p class="meta"><a href="#" class="more">分类：<%=info.getClassName()%></a>&nbsp;&nbsp;&nbsp; 
				<a href="#" class="more">详情：</a>&nbsp;&nbsp;&nbsp; <a href="blog-information.jsp?id=
				<%=info.getId()%>" class="comments">我要评论</a>
			</p>
		</div>
		<%
			}
		%>
	</div>
	<div id="sidebar">
		<ul>
			<li>
				<h2>日志分类</h2>
				<ul>
					<%for(ClassInfo cinfo:clist){ %>
						<li>
							<a href="blog-list.jsp?classId=<%=cinfo.getId() %>">
							<%=cinfo.getName() %>
							</a>
						</li>
						<%
					}
						%>
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Blog blog=new Blog();
	int id=DataConverter.toInt(request.getParameter("id"));
	System.out.print("#####333333333##"+id);
	BlogInfo info=blog.getBlogInfo(id);
	if(info==null){
		out.println("<script>alert('博文ID有误');window.location.href('index.jsp');</script>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'blog-information.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div id="content">
    	<div class="post">
    	
    		<h1 class="title"><%=info.getTitle() %></h1>
    		<p class="byline"><%=info.getCreatedtime() %></p>
    		<div class="entry">
    			<p><%=info.getContext() %></p>
    		</div>
    		<p class="meta"><a href="#" class="more">分类：<%=info.getClassName() %></a></p>
    	</div>
    	<a name="comment" id="comment"></a>
    	<p class="meta">评论：</p><br>
    	<%
    		Comment comment=new Comment();
    		List<CommentInfo> cmlist=comment.getListByBlogId(id);
    		for(CommentInfo cminfo:cmlist){
    			out.println(cminfo.getContext()+"<br>");
    			out.println(cminfo.getCreatedtime()+"&nbsp;&nbsp;&nbsp;&nbsp;"+cminfo.getUsername()+"<br><hr>");
    		}
    	%>
    	<jsp:include page="comment.jsp">
    	<jsp:param value="<%=id%>" name="id"/>
    	</jsp:include>
    </div> 
  </body>
</html>

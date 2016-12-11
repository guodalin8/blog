<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*" %>
<%
if("login".equals(request.getParameter("action")))
{
	Users users=new Users();
	String username=request.getParameter("txtUserName");
	String password=request.getParameter("txtPassword");
	if(!users.isExist(username,password)){
		out.println("<script>alert('用户名或密码错误');window.location.href('blog-information.jsp?id="+DataConverter.toInt(request.getParameter("id"))+"');</script>");
	}else{
		Utilty.writeCookie(response, "user", username);
		response.sendRedirect("blog-information.jsp?id="+DataConverter.toInt(request.getParameter("id")));
	}
}
if("save".equals(request.getParameter("action")))
{
	Comment comment=new Comment();
	CommentInfo info=new CommentInfo();
	info.setBlogid(DataConverter.toInt(request.getParameter("id")));
	info.setContext(request.getParameter("txtContext"));
	info.setUsername(Utilty.readCookie(request, "user"));
	comment.insert(info);
	response.sendRedirect("blog-information.jsp?id="+DataConverter.toInt(request.getParameter("id")));
}
%>
<%
	String data=Utilty.readCookie(request, "user");
	if(DataValidator.isNullOrEmpty(data))
	{
%>


<form id="form1" name="form1" method="post" action="comment.jsp?action=login">
	<table>
		<tr>
			<td><input name="id" type="hidden" id="id" value="<%=request.getParameter("id") %>"/></td>
			<td><input name="txtUserName" type="text" id="txtUserName" /></td>
			<td><input name="txtPassword" type="password" id="txtPassword" /></td>
			<td><input type="submit" name="button" id="button" value="提交"/><a href="register.jsp">注册</a></td>
		</tr>
	</table>
</form>
<%} else{ %>
欢迎你<%=Utilty.readCookie(request, "user") %><a href="logout.jsp">退出</a>
<form name="commentForm" method="post" action="comment.jsp?action=save">
	<input name="id" type="hidden" value="<%=request.getParameter("id") %>" />
	<textarea rows="4" cols="50" name="txtContext"></textarea>
	<input type="submit" name="button" value="回复" />
</form>
<%
	}
%>

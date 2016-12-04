<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@	include file="islogin.jsp" %>
<%@	page import="com.ch7.model.UsersInfo" %>
<%@	page import="com.ch7.dal.Users" %>

<%
	request.setCharacterEncoding("utf-8");
	Users user=new Users();
	String keyword=request.getParameter("keyword");
	List<UsersInfo> list=user.getList();
%>
<body>
<p> 当前位置：用户管理</p>
<table width="98%" border="1">
	<tr>
		<td>用户名</td>
		<td>Email</td>
		<td>身份</td>
		<td>操作</td>
	</tr>
	<%
		for(UsersInfo info:list){
	%>
	<tr>
		<td><%=info.getUsername() %></td>
		<td><%=info.getEmail() %></td>
		<td><%=info.getPower() %></td>
		<td>
			<a href="users-edit.jsp?username=<%=info.getUsername() %>&action=edit">编辑</a>|
			<a href="users-delete.jsp?username=<%=info.getUsername() %>">删除</a>
		</td>
	</tr>
	<%
		}
	%>
</table>
</body>
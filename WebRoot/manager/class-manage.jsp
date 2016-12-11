<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*" %>
<%
	request.setCharacterEncoding("utf-8");
	ClassF cls=new ClassF();
	String keyword=request.getParameter("keyword");
	List<ClassInfo> list=cls.getList();
%>
<body>
<p>当前位置：分类管理</p>
<table>
	<tr>
		<td>名称</td>
		<td>排序</td>
		<td>操作</td>
	</tr>
	<%
		for(ClassInfo info:list){
	%>
	<tr>
		<td><%=info.getName() %></td>
		<td><%=info.getSort() %></td>
		<td>
			<a href="class-edit.jsp?id=<%=info.getId() %>&action=edit">编辑</a>
			<a href="class-delete.jsp?id=<%=info.getId() %>">删除</a>
		</td>
	</tr>
	<%
		}
	%>
</table>
</body>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@	page import="com.ch7.common.*" %>
<%@	page import="com.ch7.model.*" %>
<%@	page import="com.ch7.dal.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String action=request.getParameter("action");
	UsersInfo info=new UsersInfo();
	Users user=new Users();
	if("reg".equals(action)){
		if(user.isExistUsersInfo(request.getParameter("txtUserName"))){
			out.println("<script>alert('用户已经存在');window.location.href('register.jsp');</script>");
		}else{
			info.setUsername(request.getParameter("txtUserName"));
			info.setPassword(request.getParameter("txtPassword"));
			info.setEmail(request.getParameter("txtEmail"));
			info.setPower("user");
			user.insert(info);
			out.println("<script>alert('注册成功');window.location.href('index.jsp');</script>");
		}
	}
%>
<div id="content">
	<form id="form1" name="form1" method="post" action="register.jsp?action=reg">
		<table>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="txtUserName" id="txtUserName"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="txtPassword" id="txtPassword"/></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input type="password" name="txtPassword2" id="txtPassword2"/></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="txtEmail" id="txtEmail"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" name="button" id="button" value="注册"/>
					<input type="reset" name="button2" id="button2" value="重置"/>
				</td>
			</tr>
		</table>
	</form>
</div>
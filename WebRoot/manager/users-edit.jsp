<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@	include file="islogin.jsp" %>
<%@	page import="com.ch7.common.*" %>
<%@	page import="com.ch7.model.*" %>
<%@	page import="com.ch7.dal.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String action=request.getParameter("action");
	String pageAction="";
	String username=request.getParameter("username");
	UsersInfo info=new UsersInfo();
	Users user=new Users();
	if("update".equals(action)){
		info=user.getUsersInfo(username);
		if(info==null){
			out.println("<script>alert('用户ID错误');window.location.href('users-manage.jsp');</script>");
		}
		info.setUsername(username);
		info.setPassword(request.getParameter("txtPassword"));
		info.setEmail(request.getParameter("txtEmail"));//待完善，未判断用户输入的邮箱格式是否正确
		info.setPower(request.getParameter("selPower"));
		if("update".equals(action)){
			user.update(info);
		}
		response.sendRedirect("users-manage.jsp");
	}
	if("edit".equals(action)){
		info=user.getUsersInfo(username);
		if(info==null){
			out.println("<script>alert('用户ID错误');window.location.href('users-manage.jsp');</script>");
		}
		pageAction="update";
	}
%>
<body>
	<p>当前位置：用户编辑</p>
	<form id="form1" name="form1" method="post" action="users-edit.jsp">
		<table width="100%" border="1">
			<tr>
				<td>用户名</td>
				<td><input type="text" name="txtUserName" id="txtUserName" width="500px" 
				value="<%=info.getUsername() %>" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="txtPassword" id="txtPassword" width="500px" value="<%=info.getPassword()%>"/></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="txtEmail" id="txtEmail" width="500px" value="<%=info.getEmail()%>"/></td>
			</tr>
			<tr>
				<td>身份</td>
				<td>
					<select name="selPower">
						<option value="admin">管理员</option>
						<option value="user">普通用户</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
			<input type="submit" name="button" id="button" value="提交"/>
			<input type="reset" name="button2" id="button2" value="重置"/>
			<input type="hidden" name="action" value="<%=pageAction%>"/>
			<input type="hidden" name="username" value="<%=info.getUsername() %>"/>
				</td>
			</tr>
		</table>
	</form>
</body>








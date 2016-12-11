<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String action=request.getParameter("action");
	String pageAction="";
	int id=DataConverter.toInt(request.getParameter("id"));
	ClassInfo info=new ClassInfo();
	ClassF cls=new ClassF();
	if("update".equals(action)||"insert".equals(action)){
		if("update".equals(action)){
			info=cls.getClassInfo(id);
			if(info==null){
				out.println("<script>alert('博文ID有误');window.location.href('login.jsp');</script>");
			}
			info.setId(id);
		}
		info.setName(request.getParameter("txtName"));
		info.setSort(DataConverter.toInt(request.getParameter("txtSort")));
		
		if("insert".equals(action)){
			cls.insert(info);
			
		}else{
			cls.update(info);
			response.sendRedirect("class-manage.jsp");
 			System.out.print("%%%%%%%%%"+info); 
		}
	}
	if("edit".equals(action)||"add".equals(action)){
		info=cls.getClassInfo(id);
		if(info==null){
			
		}
		pageAction="update";
	}
	if("add".equals(action)){
		pageAction="insert";
	}
	
%>
<body>
<p>当前位置：分类编辑</p>
<form id="form1" name="form1" method="post" action="class-edit.jsp">
<table>
<tr>
	<td>分类名称</td>
	<td>
		<input type="text" name="txtName" id="txtName" value="<%=info.getName() %>" />
	</td>
</tr>
<tr>
	<td>排序</td>
	<td>
		<input type="text" name="txtSort" id="txtSort" value="<%=info.getSort() %>" />
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" name="button" id="button" value="提交" />
		<input type="reset" name="button2" id="button2" value="重置" />
		<input type="hidden" name="action" id="txtSort" value="<%=pageAction %>" />
		<input type="hidden" name="id" value="<%=info.getId() %>" />
	</td>
</tr>

</table>
</form>
</body>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ch7.dal.Users" %>
<%@page import="com.ch7.model.*" %>
<%@page import="com.ch7.dal.*" %>
<%@page import="com.ch7.common.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String action=request.getParameter("action");
	String pageAction="";
	int id=DataConverter.toInt(request.getParameter("id"));
	BlogInfo info=new BlogInfo();
	Blog blog=new Blog();
	
	//保存
	if("update".equals(action)||"insert".equals(action)){
		if("update".equals(action)){
			info=blog.getBlogInfo(id);
			if(info==null){
				out.println("<script>alert('博文ID有误');window.location.href('login.jsp');</script>");
			}
			info.setId(id);
		}
		info.setTitle(request.getParameter("txtTitle"));
		info.setClassid(DataConverter.toInt(request.getParameter("selClass")));
		info.setContext(request.getParameter("content"));
		
		if("insert".equals(action)){
			info.setCreatedtime(Utilty.getNowDateTime());
			blog.insert(info);
		}else{
			blog.update(info);
			response.sendRedirect("blog-manage.jsp");
		}
	}
		//编辑
		if("edit".equals(action)||"add".equals(action)){
			info=blog.getBlogInfo(id);
			if(info==null){
				
			}
			pageAction="insert";
		}
		if("add".equals(action)){
			pageAction="insert";
		}
		/* //调用在线编辑器
		FCKeditor fckEditor=new FCKeditor(request,"content");
		fckEditor.setHeight("400");
		fckEditor.setValue(info.getContext()); */
		
		ClassF cls=new ClassF();
		List<ClassInfo>list=cls.getList();

%>
<!-- <script type="text/javascript">
function FCKeditor_OnComplete(editorInstance);{
	window.status=editorInstance.Description;
}
</script> -->
  
  <body>
    <p>当前位置：博文编辑</p>
    <form id="form1" name="form1" method="post" action="blog-edit.jsp">
    	<table>
    		<tr>
    		<td>博文标题</td>
    		<td><input type="text" name="txtTitle" id="txtTitle" width="500px" value="<%=info.getTitle() %>" /></td>
    		</tr>
    		<tr>
    		<td>博文所属分类</td>
    		<td>
    		<select name="selClass" id="selClass">
    			<%
    				for(ClassInfo cinfo:list){
    			%>
    			<option value="<%=cinfo.getId() %>"
    			<%if(cinfo.getId()==info.getClassid())out.print("selected"); %>>
    			<%=cinfo.getName() %></option>
    			<%
    				}
    			%>
    			
    		</select>
    		</td>
    		</tr>
    		<tr>
    			<td>博文内容</td>
    			 <td><textarea rows="4" cols="100" name="content"><%=info.getContext() %></textarea> </td>
    		</tr>
    		
    <tr>
	<td colspan="2">
		<input type="submit" name="button" id="button" value="提交" />
		<input type="reset" name="button2" id="button2" value="重置" />
		<input type="hidden" name="action" value="<%=pageAction %>" />
		<input type="hidden" name="id" value="<%=info.getId() %>" />
	</td>
	</tr>
    	</table>
    </form>
  </body>

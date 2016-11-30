<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xupt.se.ttms.model.Employee" %>
<%@ page import="java.util.ArrayList" %>
<% 
   String contextPath = request.getContextPath(); 
   request.setAttribute("contextPath", contextPath);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>员工信息</title>
<style>
body {width:100%}
.table th, .table td {  
text-align: center;
height:30px;
} 
</style>
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>

<div style="height:50px;line-height:50px;font-size:25px;vertical-align: middle;text-align: center" class="bg-primary">影院管理系统</div>

<div class="row" style="padding:10px 10px">
     <!-- 此处放弃使用iframe，直接利用include导入文件 -->
	<!-- 左导航栏 -->
	<%@include file="nav.jsp" %>  

	<div class="col-md-10" style="padding-top:10px">
	
		<!-- 查询块 -->
		<div class="search" ><!-- form-inline  -->
			<form class="form-inline" name="myForm" action="EmployeeServlet?method=search" method="post">
				<input type="text" class="form-control" name="emp_name" value="${search_emp_name}"/>
				<input type="submit" class="btn btn-primary" value="查   询" />&nbsp;&nbsp;
				<!-- 非管理员不能进行添加员工操作 -->
				<input type="button" class="btn btn-danger" value="增   加" onclick="javascript:window.location='add.jsp'"/>
			</form>
		</div>
		
		
		<!-- 员工信息显示-->
		<div style="padding-top:10px;">         <!-- 显示悬停风格 -->
			<table class="table table-bordered table-hover" style="text-align:center;">
		   		<tr>
		   			<th>用户id</th>
		   			<th>编号</th>
		   			<th>姓名</th>
		   			<th>电话</th>
		   			<th>地址</th>
		   			<th>邮箱</th>
		   			<th colspan=2>操作</th>
		   		</tr>
		   		<%
		   		ArrayList<Employee> list=(ArrayList<Employee>)request.getAttribute("list");
		   		if(list!=null && list.size()>0)
		   		{
			   		for(int i=0;i<list.size();i++)
			   		{
			   		    // 设定奇偶行数的class，即行背景颜色
			   		    if(i%2==0)
			   		        out.println("<tr class='success'>");
			   		    else
			   		    	out.println("<tr class='active'>");
		   		%>
		   			<th><%=list.get(i).getEmp_id()%></th>
		   			<th><%=list.get(i).getEmp_no()%></th>
		   			<th><%=list.get(i).getEmp_name()%></th>
		   			<th><%=list.get(i).getEmp_tel_num()%></th>
		   			<th><%=list.get(i).getEmp_addr()%></th>
		   			<th><%=list.get(i).getEmp_email()%></th>
                    <!-- 	在创建表格th时，将id直接绑定到该表格，方便执行修改删除 -->
		   			<th><a href="EmployeeServlet?method=searchById&emp_id=<%=list.get(i).getEmp_id()%>">修改</a></th>
		   			<th><a href="EmployeeServlet?method=delete&emp_id=<%=list.get(i).getEmp_id()%>&emp_name=${search_emp_name}">删除</a></th>
		   		</tr>
		   		<%
		   			}
		   		}
		   		%>
			</table>
		</div>
		
		<!-- 分页 -->
		<!-- 
		<div class="text-center">
			<nav>
			  <ul class="pagination">
			    <li><a href="#">首页</a></li>
			    <li><a href="#">上一页</a></li>
			    <li><a href="#">下一页</a></li>
			    <li><a href="#">末页</a></li>
			  </ul>
			</nav>
		</div>
		-->
	</div>
</div>

</body>
</html>
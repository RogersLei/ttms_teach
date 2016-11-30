<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>欢迎登陆</title>
    <meta charset="UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    .main{
        background-image:url("images/back.png");
    position:fixed;
    width:320px;
    height:240px;
    top:50%;
    left:50%;
    margin-left:-160px;
    margin-top:-120px;
    }
    body{
    margin:0;
    padding:0;
    }
    </style>
</head>
<body>
        <div class="main">
               
              <div class="">
                <h3 class="bg-primary" style="text-align:center">欢迎登录</h3>
              </div>
              <div class="">
                <table class="table table-hover">
                    <tr><td><img src="images/renyuan.png" width="24px">&nbsp;&nbsp;<input type="text" name="Emp_no" placeholder="员工编号"></td><td><p id="nonum"></p></td></tr>
                    <tr><td><img src="images/dingpiao.png" width="24px">&nbsp;&nbsp;<input type="text" name="Emp_pass" placeholder="员工密码"></td><td><p id="nopass"></p></td></tr>
                    <tr><td><input type="submit" class="btn btn-primary" value="登录"></td><td><a href="#" class="btn btn-primary">忘记密码</a></td></tr>
                    <tr><td>                
                    <%
                    String desc = (String)request.getSession().getAttribute("desc");
                    String flag = (String)request.getSession().getAttribute("flag");
                    if(flag=="false"){
                    %>
                    <span><%=desc %></span>
                    <%
                    }
                    %>
                    </td></tr>
                </table>
              </div>
        </div>
</body>
</html>
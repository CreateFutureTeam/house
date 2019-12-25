<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户登录</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/function.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
</head>
<body>
<div id="header" class="wrap">
</div>
<div id="regLogin" class="wrap">
	<div class="dialog">
		<div class="box">
			<h4>用户登录</h4>
			<form id="myForm">
				<div class="infos">
					<table class="field">					
						<tr>
							<td class="field">用 户 名：</td>
							<td>
								<input type="text" name="name" class="text" />
							</td>
						</tr>
						<tr>
							<td class="field">密　　码：</td>
							<td><input type="password" class="text" name="password" />
							</td>
						</tr>
						
					</table>
					<div class="buttons">
						<input type="button" value="立即登陆" onclick="login()"/>
						<input type='button' value='注册' onclick="register()"  />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>

<script type="text/javascript">
function login(){

		$.post("${pageContext.request.contextPath}/user/login",$("#myForm").serialize(),
				function(data){
					if(data.result=="tenants"){
						//如果是房客跳转到house_list
						location.href="${pageContext.request.contextPath}/page/house_list.jsp";
					}else if(data.result=="admin"){
						//如果是销售员跳转到manage
						location.href="${pageContext.request.contextPath}/page/manage.jsp";
					}else{
						//用户名或密码错误
						alert("用户名或密码错误");
					}
			
		},"json");
}
function register(){
	location.href="${pageContext.request.contextPath}/page/register.jsp";
}
</script>










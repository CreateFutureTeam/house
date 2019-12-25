<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<script type="${pageContext.request.contextPath}/text/javascript"
	src="scripts/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery.validate.min.js"></script>
</head>
<body>
	<div id="header" class="wrap"></div>
	<div id="regLogin" class="wrap">
		<div class="dialog">
			<dl class="clearfix">
				<dt>新用户注册</dt>
				<dd class="past">填写个人信息</dd>
			</dl>
			<div class="box">
				<form  action="${pageContext.request.contextPath}/user/register" method="post">
			
					<div class="infos">
						<table class="field" >
							<tr>
								<td class="field">用 户 名：</td>
								<td><input type="text" class="text" name="name" id="name" onblur="existName()"/>
									<span></span>
								</td>
							</tr>
							<tr>
								<td class="field">密 码：</td>
								<td><input type="password" class="text" name="password"
									id="password" /><span></span></td>
							</tr>
							<tr>
								<td class="field">确认密码：</td>
								<td><input type="password" class="text" name="repassword"
									id="repassword" /> <span></span></td>
							</tr>
							<tr>
								<td class="field">电 话：</td>
								<td><input type="text" class="text" name="telephone"
									id="telephone"/><span></span></td>
							</tr>
							<tr>
								<td class="field">用户姓名：</td>
								<td><input type="text" class="text" name="username"
									id="username" /><span></span></td>
							</tr>
							<tr>
								<td class="field">身份：</td>
								<td><select name="isadmin" id="isadmin">
										<option  value="2">请选择</option>
										<option value="1">业主</option>
										<option value="0">租客</option>
								</select></td>
							</tr>
						</table>
						<div class="buttons">
							<input type="submit" name="submit" value="立即注册" id="sub"/>
							 <input type="button" value="返回" onclick="javascript:history.back()"/>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>

<script type="text/javascript">
	 $(function(){
	var name=$("#name");
	var password=$("#password");
	var repassword=$("#repassword");
	var telephone=$("#telephone");
	var username=$("#username");
	var isadmin=$("#isadmin");
	//用户名 ，由字母开头，包含数字、字母、下划线4-16位
	name.on("blur",function(){
		$("#name").next("span").html("");
		  if(name.val()!==""){
			  var reg=/^[a-zA-Z]\w{3,15}$/;
				if(!reg.test(name.val())){
					$("#name").next("span").html("用户名格式错误");
				}else{
					$.post("${pageContext.request.contextPath}/user/existName",{name:$("#name").val()},
							function(data){
							if(data.result=="success"){
								//重复了
								$("#name").next("span").html("×用户名已存在");
							}
						
					},"json");
				}
		  }
		});
	//密码	数字、字母、下划线，6-12位
	password.on("blur",function(){
		$("#password").next("span").html("");
		if(password.val()!==""){
			var reg=/^\w{6,12}$/;
			if(!reg.test(password.val())){
				$("#password").next("span").html("密码格式不对");
			}
		}
	});
	//重复密码
	repassword.on("blur",function(){
 		$("#repassword").next("span").html("");
			var reg=/^\w{6,12}$/;
			if(repassword!==""){
			if(password.val()!==repassword.val()){
				$("#repassword").next("span").html("两次输入密码不同");
			}
			}
	});
	//电话
	telephone.on("blur",function(){
		$("#telephone").next("span").html("");
		if(telephone!==""){
			var reg=/^1[3578]\d{9}$/;
		if(!reg.test(telephone.val())){
			$("#telephone").next("span").html("电话号码格式不对");
		}
		}
});
	//提交按钮
	$("#sub").on("click",function(){
		if(name.val()===""){
			alert("请输入用户名！");
			return false;
		}else if(password.val()===""){
			alert("请输入密码");
			return false;
		}else if(repassword.val()===""){
			alert("请输入重复密码");
			return false;
		}else if(telephone.val()===""){
			alert("请输入手机号！");
			return false;
		}else if(username.val()===""){
			alert("请输入姓名");
			return false;
		}else if(isadmin.val()==="2"){
			alert("请选择用户类别");
			return false;
		}else if($("#name").next("span").html()!==""){
			alert("用户名错误");
			return false;
		}else if(password.next("span").html()!==""){
			alert("密码错误");
			return false;
		}else if(repassword.next("span").html()!==""){
			alert("重复密码错误");
			return false;
		}else if(telephone.next("span").html()!==""){
			alert("手机号错误");
			return false;
		}else{
			alert("表单提交成功！");
		}
	
});
}); 
	/* $("form").validate({
		rules:{
				name:{
					required:true,
					minlength:"4",
					maxlength:"6",
					remote:{
						url:"${pageContext.request.contextPath}/user/isExist",
						type:"post",
						dataType:"json",
						data:{
							name:function(){
								return $("#name").val();
							}
							
						}
					} 
				},
				password:{
					required:true,
					minlength:"4",
					maxlength:"16"
					
				},
				repassword:{
					required:true,
					equalTo:"[name='password']"
					
				},
				telephone: {
			                     required: true,
			                     maxlength:11,
			                     maxlength:11,
			                     isphoneNum:true
		                 }
					
					
		},
		messages:{
			name:{
				required:"用户名不能为空",
				minlength:"用户名不能少于4位",
				maxlength:"用户名不能多于6位",
			 	remote:"用户名已存在" 
			},
			password:{
				required:"密码不能为空",
				minlength:"用户名不能少于6位",
				maxlength:"用户名不能多于16位",
			 	remote:"用户名已存在" 
			},
			repassword:{
				required:"重复密码不能为空",
				equalTo:"两次密码不一致"
			},
			telephone:{
	                     required:"*请输入手机号",
	                     maxlength:"*请填写11位的手机号",
	                     minlength:"*请填写11位的手机号",
	                     isphoneNum:"请填写正确的手机号码"
	                 }
				
		}
		
		
	});
      //自定义手机号验证
        jQuery.validator.addMethod("isphoneNum", function(value, element) {
            debugger
            var length = value.length;
            var mobile = /^1[3|5|8]{1}[0-9]{9}$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写您的手机号码");


    })
 */
	 
</script>

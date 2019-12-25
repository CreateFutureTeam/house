<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改房屋信息</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/function.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
</head>
<body>
<div id="header" class="wrap">
</div>
<div id="regLogin" class="wrap">
	<div class="dialog">
		<dl class="clearfix">
			<dt>房屋信息修改</dt>
			<dd class="past">填写房屋信息</dd>

		</dl>
		<div class="box">
			<form id="myForm" method="post" action="${pageContext.request.contextPath}/house/updateSave">
				<input type="hidden" name="id" value="${house.id}"/>
				<div class="infos">
				<input type="hidden" name="id" id="id" value="${house.id}"/>
					<table class="field">
						<tr>
							<td class="field">标　　题：</td>
							<td>
								<input type="text" name="title" id="title" value="${house.title}"/><span style="color:red"></span>
							</td>
						</tr>
						<tr>
							<td class="field">户　　型：</td>
							<td>
							<!-- <select  class="text" name="type_id"><option value="1000">一室一厅</option></select -->
							<select name="typeId">
							 <option value="${house.typeId}" selected="selected">${house.typeName}</option> 
							<c:forEach items="${typeList}" var="type" varStatus="sta">
									<option value="${type.id }">${type.name}</option>
								
							</c:forEach>
							</select>
							<span style="color:red"></span>
							</td>
						</tr>
						<tr>
							<td class="field">面　　积：</td>
							<td>
								<input type="text" name="floorage" id="floorage" value="${house.floorage}" /><span style="color:red"></span>
							</td>
						</tr>
						<tr>
							<td class="field">价　　格：</td>
							<td>
							<input type="text" name="price" id="price" value="${house.price}"/><span style="color:red"></span>
							</td>
						</tr>
						 
						<tr>
							<td class="field">房产证日期：</td>
							<td>
								<input type="text" name="pubdate" id="pubdate" value="<fmt:formatDate value="${house.pubdate}" pattern="yyyy-MM-dd"/> "  />
								<span style="color:red"></span>
							</td>
						</tr>
						
                        <tr>
							<td class="field">位　　置：</td>
							<td>
							区：<select  class="text" name="districtId">
							<option value="1001">东城区</option>
							<option value="1002">西城区区</option>
							<option value="1000">丰台区</option>
							<option value="1004">海淀区</option>
							</select>
							<span style="color:red"></span>
                            	街：<select  class="text" name="streetId">
                            	
                            	
                            	</select>
                            	<span style="color:red"></span>
                            </td>
						</tr>
                        <tr>
							<td class="field">联系方式：</td>
							<td>
								<input type="text" name="contact" id="contact" value="${house.contact}"/>
								<span style="color:red"></span>
							</td>
						</tr>
                        <tr>
							<td class="field">详细信息：</td>
							<td><textarea name="description">${house.description}</textarea><span style="color:red"></span></td>
						</tr>
						<input type="hidden" name="strId" value="${house.streetId}"/>
						<input type="hidden" name="driId" value="${house.driId}"/>
						
					</table>
					<div class="buttons">
					<input type="submit"value="立即发布" id="sub"/>
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
			
			findAlldistrict();
			findStreet();
			 var title=$("#title");
			 var floorage=$("#floorage");
			 var price=$("#price");
			 var pubdate=$("#pubdate");
			 var contact=$("#contact");
			 var description=("[name=description]");
			 
			  //判断标题是否重复
			 title.on("blur",function(){
				 $("#title").next("span").html("");
				 if(title.val()!==""){
				 $.post("${pageContext.request.contextPath}/house/judgeTitleUpdate",{title:title.val(),id:$("#id").val()},
							function(data){
							if(data.result=="success"){
								//重复了
								$("#title").next("span").html("×用户名已存在");
							}else if(data.result=="false"){
								/* $("#title").next("span").html("empty"); */
							}
						
					},"json");
				 }
			 }); 
			 //面积只能是数字
			 floorage.on("blur",function(){
				 floorage.next("span").html("");
				  var reg=/^[1-9]\d*$/;
				  if(floorage.val()!==""){
					if(!reg.test(floorage.val())){
						floorage.next("span").html("面积格式错误");
					}
				  }
			 });
			 //价格只能是数字
			 price.on("blur",function(){
				 price.next("span").html("");
				  var reg=/^[1-9]\d*$/;
				  if(price.val()!==""){
					if(!reg.test(price.val())){
						price.next("span").html("面积格式错误");
					}
				  }
			 });
				  
			 //日期
			 pubdate.on("blur",function(){
				 pubdate.next("span").html("");
				  var reg=/^\d{4}-\d{2}-\d{2}$/;
				  if(pubdate.val()!==""){
					if(!reg.test(pubdate.val())){
						pubdate.next("span").html("日期格式错误");
					}
				  }
			 });
			 
			 contact.on("blur",function(){
				 contact.next("span").html("");
					if(contact.val()!==""){
						var reg=/^1[3578]\d{9}$/;
					if(!reg.test(contact.val())){
						contact.next("span").html("电话号码格式不对");
					}
					}
			});
		});
		function findAlldistrict(){
			var dirId=$("[name=driId]").val();
			$("[name=districtId]").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
			$("[name=districtId] option").remove();
			$.post("${pageContext.request.contextPath}/district/all",function(data){
				var options = "<option value=\"0\">请选择</option>";
				$(data).each(function(i,e){
					if(data!=null){
					if(e.id==dirId){
						options += "<option selected=\"selected\" value=\""+e.id+"\"  onclick=\"findStreet("+e.id+")\">"+e.name+"</option>";
					}
					else{
						options += "<option value=\""+e.id+"\" onclick=\"findStreet("+e.id+")\">"+e.name+"</option>";
					}
					}
				});
				$("[name=districtId]").append(options);
				
			},"json");
}
	function findStreet(sid){
		var dirId=$("[name=driId]").val();
		var strId=$("[name=strId]").val();
		$("[name=streetId]").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
		$.post("${pageContext.request.contextPath}/street/all",{id:sid,strId:dirId},function(data){
			var options = "<option value=\"0\">请选择</option>";
			$(data).each(function(i,e){
				if(data!=null){
					if(e.id==strId){
					options += "<option selected=\"selected\" value=\""+e.id+"\">"+e.name+"</option>";
					}
					else{
						options += "<option value=\""+e.id+"\">"+e.name+"</option>";
					}
				}
			});
			$("[name=streetId]").append(options);
			$("[name=driId]").val("0");
			$("[name=strId]").val("0"); 
		},"json");
	}
	$("#sub").on("click",function(){
		$("[name=districtId]").next("span").html("");
		$("[name=typeId]").next("span").html("");
		$("[name=streetId]").next("span").html("");
		
		if($("[name=title]").val()===""){
			alert("标题不能为空");
			return false;
		}else if($("[name=typeId]").val()==="0"){
			$("[name=typeId]").next("span").html("请选择类型");
			return false;   
		}else if($("[name=floorage]").val()===""){
			alert("面积不能为空");
			return false;
		}else if($("[name=price]").val()===""){
			alert("价格不能为空");
			return false;
		}else if($("[name=pubdate]").val()===""){
			alert("日期不能为空");
			return false;
		}else if($("[name=districtId]").val()==="0"){
			$("[name=districtId]").next("span").html("请选择区域");
			return false;
		} else if($("[name=streetId]").val()==="0"){
			$("[name=streetId]").next("span").html("请选择街道");
			return false;
		}else if($("[name=contact]").val()===""){
			alert("联系方式不能为空");
			return false;
		}else if($("[name=description]").val()===""){
			alert("描述不能为空");
			return false;
		}else if( $("#title").next("span").html()!==""){
			alert("标题重复");
			return false;
		}else if($("#floorage").next("span").html()!==""){
			alert("面积格式错误");
			return false;
		}else if($("#price").next("span").html()!==""){
			alert("面积格式错误");
			return false;
		}else if($("#pubdate").next("span").html()!==""){
			alert("日期格式错误");
			return false;
		}else if($("#contact").next("span").html()!==""){
			alert("联系方式错误");
			return false;
		}else{
			alert("提交成功");
		}
	
});
</script>
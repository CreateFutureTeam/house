<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int total = (Integer)request.getAttribute("total");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/function.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"></div>
	<div class="search">
		<label class="ui-green"><input type="button" name="search" value="发布房屋信息" onclick="goAdd()"/></label>	
		<label class="ui-green"><input type="button" name="search" value="退       出" onclick="exist()"/></label>
	</div>
</div>
<div class="main wrap">
<div id="houseArea">
	<table class="house-list">
		<!-- 有房屋 -->
		<tr>
			<td class="house-thumb">
			<span>
				<img src="${pageContext.request.contextPath}/images/thumb_house.gif"/>
			</span>
			</td>
			<td>
				<dl>
					<dt>
				<a href="#">sss</a>
				</dt>
					<dd>
						dddd  区，
						ddddd  街，
						10000    平米<br/>
						联系方式     ssss

					</dd>
				</dl>
			</td>
			<!-- 自己发布的信息有权限删除 -->
			<td class="house-type"><label class="ui-green"><input type="button"  name="search" value="修    改" /></label></td>
			<td class="house-price"><label class="ui-green"><input type="button" name="search" value="删    除" /></label></td>
			
			<!-- 不是自己发布的信息没有权限删除 
			<td colspan="2"></td>
			-->
		</tr>
	<!-- 无房屋 
	<tr>
		<td>无房屋信息输出</td>
	</tr>
	-->
	</table>
</div>
<input type="hidden" name="pageIndex" value="1"/>
<div class="page-bar">
			<ul class="page-num-ul">
				<li></li>
			</ul>
		 <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key" />页
	     <button type="button" class="page-btn" onclick="jump_to()" id="jump_to">GO</button>
		</span>
		</div> 
<script type="text/javascript">
		//方法不能套方法
		var pages=null;
		function goAdd(){
			location.href="${pageContext.request.contextPath}/page/add.jsp";
		}
		function exist(){
			location.href="${pageContext.request.contextPath}/user/exist";
		}
		$(function(){
			$("#inputPage").val("");
			findAll();
		});
		function findAll(){
			
			$("table tr").remove();
			$.post("${pageContext.request.contextPath}/house/findAllAdmin",{"pageIndex":$("[name=pageIndex]").val()},function(data){
				if(data.list!=null){
				$(data.list).each(function(i,e){
					var content="<tr>";
					content+="<td class=\"house-thumb\"><span>"+
					"<img src=\"${pageContext.request.contextPath}/images/thumb_house.gif\"/></span></td>";
					content+="<td><dl><dt><a href=\"#\">"+e.title+"</a></dt>"+
					"<dd>"+e.districtName+"区，"+e.streetName+"街,"+e.floorage +"平米<br/>"+"联系方式"+e.contact+"</dd></dl></td>";
					content+="<td class=\"house-type\"><label class=\"ui-green\"><input type=\"button\" onclick=\"goUpdate("+e.id+")\" name=\"search\" value=\"修    改\" /></label></td>";
					content+="<td class=\"house-price\"><label class=\"ui-green\"><input type=\"button\" onclick=\"goDelete("+e.id+")\" name=\"search\" value=\"删    除\" /></label></td>";
					content+="</tr>";	
					$("table").append(content);	
				});
				}else{
					var content="<tr>";
					content+="<td>无房屋信息输出</td>"
					content+="</tr>";
					$("table").append(content);	
				}
				//开始覆盖分页节点
				$(".page-num-ul li").html("共"+data.total+"条记录&nbsp;&nbsp;"+data.pageNum+"/"+data.pages+"页");
				//每次添加上一页下一页，都要把上一次的结果清除，否则会累加
				$(".page-num-ul a").remove();
				//动态的添加上一页，下一页
				if(!data.isFirstPage){
					$(".page-num-ul").append("<a href=\"javascript:jump(1)\">首页</a>"+
						"<a href=\"javascript:jump("+(data.pageNum-1)+")\">上一页</a>");
				}
				if(!data.isLastPage){
					$(".page-num-ul").append("<a href=\"javascript:jump("+(data.pageNum+1)+")\">下一页</a>"+
							"<a href=\"javascript:jump("+data.pages+")\">末页</a>");
				}
				
				 pages=data.pages;
				
			},"json");
		}
		function jump(pageNum){
			//动态的修改当前页数
			$("[name='pageIndex']").val(pageNum);
			//提交
			findAll();
		}
		function jump_to(){
			
			var regexp=/^[1-9]\d*$/;
			var pageNum=$("#inputPage").val();
			
			if(!regexp.test(pageNum)){
				$("#inputPage").val(1);
				jump(1);
			}else if((pageNum-pages) > 0){
				$("#inputPage").val(pages);
				jump(pages);
			}else{
				jump(pageNum);
			}
		}
		function goUpdate(id){
			
			location.href="${pageContext.request.contextPath}/house/goUpdate/"+id;
		}
		function goDelete(id){
			
			$.post("${pageContext.request.contextPath}/house/goDelete",{id:id},function(data){
				if(data.result=="success"){
					alert("删除成功");
					findAll();
				}else if(data.result=="false"){
					
					alert("这不是你发布的，没有权限删");
				}else{
					alert("用户名不存在");
				}
			},"json");
		}
	</script>
</body>

</html>
	
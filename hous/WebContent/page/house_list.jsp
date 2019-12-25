<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>租房 - 首页</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/function.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
</head>
<body>
<div id="navbar" class="wrap">

	<dl class="search clearfix">
		<form>
			<dt>
				<ul>
					<li class="bold">房屋信息</li>
					<li>
						标题：<input type="text" class="text" value='' name="title" />
						<label class="ui-blue"><input type="button" onclick='findAll()' name="search" value="搜索房屋" /></label>
					</li>
				</ul>
			</dt>
			<dd>
				<ul>
					<li class="first">
						价格
					</li>
					<li>
						<select name='price'>
							<option value='0-0'>不限</option>
							<option value='1-100'>100元以下</option>
							<option value='100-200'>100元—200元</option>
							<option value='200-1000000'>200元以上</option>
						</select>
					</li>
				</ul>
			</dd>
			<dd>
				<ul>
					<li class="first">房屋位置</li>
					<li>
							<select name='streetId' id='street'>
								<!-- <option value='0'>不限</option> -->
								<!-- <option value='1000'>知春路</option>
								<option value='1001'>中关村大街</option>
								<option value='1002'>学院路</option>
								<option value='1003'>朝阳路</option>	 -->							
							</select>
					</li>
				</ul>
			</dd>
			<dd>
				<ul>
					<li class="first">房型</li>
					<li>
							<select name='typeId'>
								<option value='0'>不限</option>
								<!-- <option value='1000'>一室一厅</option>
								<option value='1001'>一室两厅</option>
								<option value='1002'>两室一厅</option>
								<option value='1003'>两室两厅</option>			 -->					
							</select>
					</li>
				</ul>
			</dd>
			<dd>
				<ul>
					<li class="first">
						面积
					</li>
					<li>
							<select name='floorage'>
								<option value='0-0'>不限</option>
								<option value='1-40'>40以下</option>
								<option value='40-500'>40-500</option>
								<option value='500-1000000'>500以上</option>							
							</select>
					</li>
				</ul>
			</dd>
			<dd>
				<ul>
					<li class="first">
						开始时间
					</li>
					<li>
							<input type="text" name="beginTime" style="width:100px" />
					</li>
				</ul>
			</dd>
				<dd>
				<ul>
					<li class="first">
						结束时间
					</li>
					<li>
							<input type="text" name="endTime" style="width:100px" />
					</li>
				</ul>
			</dd>
		</form>
	</dl>
</div>
<div class="main wrap">
	<table class="house-list">
		<tr>
			<td class="house-thumb"><span>
				<img src="${pageContext.request.contextPath}/images/thumb_house.gif" />
			</span>	</td>
			<td>
				<dl>
					<dt>
						<input type="text" />
					</dt>
					<dd>
						朝阳区
						三元街
						100平米<br/>
						联系方式：13678900987
					</dd>
				</dl>
			</td>
			<td class="house-type"> </td>
			<td class="house-price"><span> 100</span>元/月</td>
		</tr>

	</table>
	
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
	</div>
</body>
</html>
<script type="text/javascript">
		//方法不能套方法
		var pages=null;
		
		$(function(){
			$("#inputPage").val("");
			findAll();
			 findStreet();
			findType();
		});
		function findAll(){
			var title=$("[name=title]").val();
			var price=$("[name=price]").val();
			var typeId=$("[name=typeId]").val();
			var floorage=$("[name=floorage]").val();
			var beginTime=$("[name=beginTime]").val();
			var endTime=$("[name=endTime]").val();
			$("table tr").remove();
			$.post("${pageContext.request.contextPath}/house/findAll",{pageIndex:$("[name=pageIndex]").val(),title:title,price:price,typeId:typeId,floorage:floorage,beginTime:beginTime,endTime:endTime},
					function(data){
				if(data.list!=null){
				$(data.list).each(function(i,e){
					var content="<tr>";
					content+="<td class=\"house-thumb\"><span>"+
					"<img src=\"${pageContext.request.contextPath}/images/thumb_house.gif\"/></span></td>";
					content+="<td><dl><dt><a href=\"#\">"+e.title+"</a></dt>"+
					"<dd>"+e.districtName+"区，"+e.streetName+"街,"+e.floorage +"平米<br/>"+"联系方式"+e.contact+"</dd></dl></td>";
					content+="</tr>";	
					$("table").append(content);	
				});
				}else{
					var content="<tr>";
					content+="<td>无房屋信息输出</td>";
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
		function findStreet(){
			
			$("[name=streetId]").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
			$.post("${pageContext.request.contextPath}/street/alls",function(data){
				var options = "<option value=\"0\">不限</option>";
				$(data).each(function(i,e){
					if(data!=null){
					options += "<option value=\""+e.id+"\">"+e.name+"</option>";	
					}
				});
				$("[name=streetId]").append(options);
				
			},"json");
		}
		function findType(){
			
			$("[name=typeId]").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
			$.post("${pageContext.request.contextPath}/type/all",function(data){
				var options = "<option value=\"0\">不限</option>";
				$(data).each(function(i,e){
					if(data!=null){
					options += "<option value=\""+e.id+"\">"+e.name+"</option>";	
					}
				});
				$("[name=typeId]").append(options);
				
			},"json");
		}
	
		
	</script>
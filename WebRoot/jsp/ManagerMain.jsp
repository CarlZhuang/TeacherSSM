<%@page import="org.great.bean.MenuBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
//获取项目路径
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教师端主界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/ManagerMain.css">
	<script type="text/javascript">
		//定时器setInterval(code,mms);code:代码执行函数，code会被不停调用；mms：毫秒值,清楚定时器clearInterval(interval);
	/*
		var interval;
		window.onload = function(){
			interval = setInterval(test,1000);
		}
		var a = 0;
		function test(){
			if(a==10){
				//清楚定时器
				clearInterval(interval);
			}
			console.log("test---" +  a);
			a++;
		}
	*/
	//定时器setTimeout(code,mms);code:代码执行函数，code只会被调用多次；mms:毫秒值。清楚定时器clearTimeout(timeout);
	/*	window.onload = function(){
			//setTimeout(function(){console.log("test");},1000);
			test();//方法不调用，他就不执行，方法调用自己的现象，叫递归
		}
		var a = 0;
		var timeout;
		function test(){
			if(a==10){
				console.log("jklh")
				clearTimeout(timeout);
				return;//结束递归循环
			}
			console.log("test---" + a);
			a++;
			timeout = setTimeout("test()",1000);
		}
	*/
		window.onload = function(){
			var a = document.getElementsByName("le");
			a[1].onclick = function (){
				getName();
			};
		};
		var timeout;
		function getName(){
			//写ajax向服务器请求“：getName.action
			//ajax创建对象
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}	
			//发送请求
			xmlhttp.open("POST","getName.action",true);
			xmlhttp.send();
			//接受响应数据
			xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
			  	var result = xmlhttp.responseText;
				var oldName = document.getElementById("name").innerText;
			  		if(!result.match(oldName)){
			  			document.getElementById("name").innerHTML = result;
			  			clearTimeout(timeout);
			  			return;
			  		}
					timeout = setTimeout("getName()",1000);
			  }
			};
			
			//2.TeacherMapper.xml添加一个select:
			//3.写TeacherMapper.java:添加一个方法，String getNameByteId(int teId)
			//4.在TeacherHandler.java：添加一个方法，public string getName(Htt);
			//5.ajax接受响应数据，innerText = result;
		}
		
		function showMenu(ele){
			//span元素子父节点li
			var level1Li = ele.parentNode;
			console.log(level1Li);
			//获取父节点li下所有ul节点
			var ul2s = level1Li.getElementsByTagName("ul");
			console.log(ul2s[0].style.display);
			if(ul2s[0].style.display === "none"){
				//设置ul显示
				ul2s[0].style.display = "block";
			}else{
				ul2s[0].style.display = "none";
			}
		}
	</script>
  </head>
  
  <body>
  		<div id="content">
        	<div id="conHead">
            	<h1>厦门市职业技能鉴定中心--OSTA劳动技能考试系统</h1>
                <h4>欢迎你，<span id="name">${teacherBean.teName}</span>,&nbsp;<a href="logoff.action">注销</a></h4>
            </div>
            <div id="conBody">
            	<div id="menus">
					<ul id="ul1">
                		<c:forEach items="${meus }" var="menu">
                			<!-- 获取一级子菜单 -->
                			<c:if test="${menu.mParent == 0 }">
                				<c:choose>
                					<c:when test="${menu.mTitle eq '监考管理' }">
										 <li  id="level1">
		                					<a href="${menu.mUrl }">${menu.mTitle }</a>
		                				</li>
                					</c:when>
                					<c:otherwise>
                						 <li  id="level1">
		                					<span onclick="showMenu(this)">${menu.mTitle }</span>
		                					<!-- 获取二级子菜单 -->
			                				<ul id="ul2" >
			                					<c:forEach items="${meus }" var="menu2">
				                					<c:if test="${menu2.mParent == menu.mId }">
			                            					<li id="level2">
			                            						<a name="le" href="${menu2.mUrl }" target="frameA">${menu2.mTitle }</a>
			                            					</li>
				                					</c:if>
			                					</c:forEach>
		                            		</ul>
		                				</li>
                					</c:otherwise>
                				</c:choose>
                			</c:if>
                		</c:forEach>
                    </ul>
                </div>
                <div id="frames">
                	<iframe name="frameA" src="<%=basePath %>/jsp/MainWelcome.html"></iframe>
                </div>
            </div>
        </div>
  </body>
</html>

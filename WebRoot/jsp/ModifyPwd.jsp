<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'ModifyInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>/css/ModifyPwd.css">
<script type="text/javascript">
		/*var intputs = document.getElementsByName("tePwd");
		function checkPwd(){
			var value = intputs[0].value;
			alert("value: " + value);
		}*/
		window.onload = function(){
			var tePwd2= false;
			var intputs = document.getElementsByName("tePwd");
			var warnings = document.getElementsByName("waring");
			//失去焦点该方法会被触发一次
			intputs[0].onblur = function(){
				if(intputs[0].value===""){
					warnings[0].innerText = "*密码不可为空！";
					warnings[0].style.color = "yellow";
				}else{
					//ajax创建对象
					var xmlhttp;
					if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
					  xmlhttp=new XMLHttpRequest();
					}else{// code for IE6, IE5
					  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
					}
					
					//接受响应数据
					xmlhttp.onreadystatechange=function(){
					  if (xmlhttp.readyState==4 && xmlhttp.status==200){
					  	var result = xmlhttp.responseText;
					  	warnings[0].innerHTML= result;
					  	if(result === "*密码正确！"){
						  	warnings[0].style.color = "green";
						  	tePwd2 = true;
					  	}else{
						  	warnings[0].style.color = "yellow";
						  	tePwd2 = false;
					  	}
					  }
					}
					 //ajax发送请求
					xmlhttp.open("post","checkPwd.action",true);
					xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
					xmlhttp.send("tePwd=" + intputs[0].value);
				  
				}
			}
			
			var teNewPwd2 = false;
			var teNewPwd = document.getElementById("teNewPwd");
			teNewPwd.onblur = function(){
				if(teNewPwd.value===""){
					warnings[1].innerText = "*新密码不可为空！";
					warnings[1].style.color = "yellow";
					teNewPwd2 = false;
				}else{
					warnings[1].innerText = "输入正确！";
					warnings[1].style.color = "green";
					teNewPwd2 = true;
				}
			}
			var teCheckPwd2 = false;
			var teCheckPwd = document.getElementById("teCheckPwd");
			teCheckPwd.onblur = function(){
				if(teCheckPwd.value===""){
					warnings[2].innerText = "*确认密码不可为空！";
					warnings[2].style.color = "yellow";
					teCheckPwd2 = false;
				}else{
					if(teNewPwd.value===teCheckPwd.value){
						warnings[2].innerText = "*输入正确";
						warnings[2].style.color = "green";
						teCheckPwd2 = true;
					}else{
						warnings[2].innerText = "*密码不一致";
						warnings[2].style.color = "yellow";
						teCheckPwd2 = false;
					}
				}
			}
		}
		function checkRules(){
			alert("teCheckPwd2: " + teCheckPwd2 + " ,teNewPwd2:" + teNewPwd2 + " ,tePwd2: " + tePwd2);
			if(teCheckPwd2&&teNewPwd2&&tePwd2){
				return true;
			}else{
				return false;
			}
		}
	</script>
</head>

<body>
	<div>
		<form action="modifyPwd.action" method="post" onsubmit="return checkRules()">
			<table>
				<tr>
					<td>原始密码:</td>
					<td><input name="tePwd" type="password" value="" />
					</td> 
					<td><span name="waring"></span>
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;新密码:</td>
					<td><input name="teNewPwd" id="teNewPwd" type="password" />
					</td>
					<td><span name="waring"></span>
					</td>
				</tr>
				<tr>
					<td>确认密码:</td>
					<td><input name="teCheckPwd" id="teCheckPwd" type="password" />
					</td>
					<td><span name="waring"></span>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交修改密码" id="btn" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

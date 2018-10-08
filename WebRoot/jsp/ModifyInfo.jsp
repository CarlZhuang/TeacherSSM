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
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/ModifyInfo.css">

  </head>
  
  <body>
       	<div>
        	<form action="modifyInfo.action" method="post">
            	<table>
                	<tr>
                    	<td>账号:</td>
                        <td>${teacherBean.teAcount}</td>
                        <td>姓名:</td>
                        <td><input name="teName" type="text" value="${teacherBean.teName}" /></td>
                    </tr>
                    <tr>
                    	<td>性别:</td>
                        <td><input name="teSex" type="text" value="${teacherBean.teSex}" /></td>
                        <td>姓名:</td>
                        <td><input name="tePhone" type="text" value="${teacherBean.tePhone}" /></td>
                    </tr>
                    <tr>
                        <td colspan="4"><input type="submit" value="提交修改" id="btn"/></td>
                    </tr>
                </table>
            </form>
        </div> 
  </body>
</html>

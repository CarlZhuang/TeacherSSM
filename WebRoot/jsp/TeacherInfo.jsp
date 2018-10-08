<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TeacherInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/TeacherInfo.css">

  </head>
  
  <body>
    	<div>
            <table>
               <tr>
                    <td>账号:</td>
                    <td>${teacherBean.teAcount}</td>
                    <td>姓名:</td>
                    <td><input name="teName" type="text" value="${teacherBean.teName}" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><input name="teSex" type="text" value="${teacherBean.teSex}" readonly="readonly" /></td>
                    <td>姓名:</td>
                    <td><input name="tePhone" type="text" value="${teacherBean.tePhone}" readonly="readonly" /></td>
                </tr>
            </table>
        </div>
  </body>
</html>

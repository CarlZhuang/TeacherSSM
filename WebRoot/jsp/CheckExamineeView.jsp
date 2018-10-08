<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CheckExamineeView.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=basePath%>/css/ExamineesInfo.css" type="text/css" rel="stylesheet" />
	
  </head>
  
  <body>
   <div>
            <table border="1px">
            	<caption><h1>考生列表</h1></caption>
            	
            	<tr>
            		<th>序号</th><th>姓名</th><th>身份证号</th><th>准考证号</th><th>考试名称</th><th>鉴定级别</th>
            	
            	</tr>
            	<c:forEach items="${examinee }" var="examin">

               <tr>
                    <th>${examin.exId}</th>
                    <th>${examin.exName}</th>
                    <th>${examin.exIdCard}</th>
                    <th>${examin.exExamCard}</th>
                    <th>${examInfoBean.eName }</th>
                    <th>${examInfoBean.eLevel }</th>
  
               </tr>

			</c:forEach>
            </table>
        </div>
   
  </body>
</html>

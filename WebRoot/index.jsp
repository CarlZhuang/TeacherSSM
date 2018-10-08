<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>OSTA教师端登陆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
	<script type="text/javascript">
		//如果当前窗口不是顶层窗口，那么顶层窗口重新加载一次
		if(window != top)
			//这里只得是重新加载本地地址栏url
			//top.location.href = location.href;
			top.location.href = "<%=basePath%>index.jsp";
	</script>
	<link rel="stylesheet" type="text/css" href="css/index.css">
  </head>
  
  <body>
    <div id="content">
        	<h1>OSTA劳动技能考试系统</h1>
            <div id="center">
            	<img src="img/osta.jpg" /> 
                <div id="login">
                	<form action="login.action" method="post">
                    	<table>
                        	<tr>
                            	<td>账号:</td>
                                <td>
                                	<input type="text" name="teAcount" />
                                </td>
                            </tr>
                            <tr>
                            	<td>密码:</td>
                                <td>
                                	<input type="password" name="tePwd" />
                                </td>
                            </tr>
                            <tr>
                            	<td id="put" colspan="2">
                               		<input type="submit" value="登录" />
                                    <input type="reset" value="重置" />
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div id="hidden"></div>
            </div>
            <h4>建议使用IE8以上版本或谷歌浏览器</h4>
        </div>
  </body>
</html>

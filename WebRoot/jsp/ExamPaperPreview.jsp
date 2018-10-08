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
    
    <title>试卷预览</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/ExaminationPaper.css">

  </head>
  
  <body>
  		<div id="content">
            <div id="question">
                <div id="title">
                	<h2>职业技能鉴定国家题库</h2>
                    <h2>${examInfoBean.eName }${examInfoBean.eNo}</h2>
                </div>
                 <h4 id="info">科目代码：${examInfoBean.eNo}&nbsp;&nbsp;&nbsp;&nbsp;科目名称：${examInfoBean.eName }&nbsp;&nbsp;&nbsp;&nbsp;准考证号：No&nbsp;&nbsp;&nbsp;&nbsp;考生姓名：StuName</h4>
                 <div id="subject">
                 	<!-- 显示大题干，遍历List<SubjectBean> -->
                 	<c:forEach items="${subjectBeans }" var="subject">
                 		<h4>${subject.sName}</h4>
                 		<ul id="single">
                 			<!-- 每个大题干下的所有子问题，遍历Map<Integer,List<QuestionBean>> -->
                 			<c:forEach items="${mapQuestions}" var="question">
                 				<!-- 判断该问题是不是属于当前的大题干 -->
                 				<c:if test="${question.key == subject.sId}">
                 					<!-- 遍历所有小问题，遍历List<QuestionBean> -->
                 					<c:forEach items="${question.value}" var="quest">
                 						<c:choose>
                 							<c:when test="${quest.qType eq '单选题'}">
                 								<li>
		                 							${quest.qNo}.${quest.qStem}<br/>
					                               		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A、${quest.qA}<br/>
					                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B、${quest.qB}<br/>
					                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C、${quest.qC}<br/>
					                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D、${quest.qD}<br/>
					                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                                    <input type="radio" value="A" name="answer" disabled="disabled" />A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                                    <input type="radio" value="B" name="answer" disabled="disabled"  />B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                                    <input type="radio" value="C" name="answer" disabled="disabled"  />C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                                    <input type="radio" value="D" name="answer" disabled="disabled" />D
					                                    <br/>
		                 						</li>
                 							</c:when>
                 							<c:otherwise>
                 								<c:if test="${quest.qType eq '多选题'}">
                 									<li>
			                 							${quest.qNo}.${quest.qStem}<br/>
						                               		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A、${quest.qA}<br/>
						                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B、${quest.qB}<br/>
						                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C、${quest.qC}<br/>
						                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D、${quest.qD}<br/>
						                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						                                    <input type="checkbox" value="A" name="answer" disabled="disabled" />A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						                                    <input type="checkbox" value="B" name="answer" disabled="disabled"  />B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						                                    <input type="checkbox" value="C" name="answer" disabled="disabled"  />C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						                                    <input type="checkbox" value="D" name="answer" disabled="disabled" />D
						                                    <br/>
			                 						</li>
                 								</c:if>
                 							</c:otherwise>
                 						</c:choose>
                 					</c:forEach>
                 				</c:if>
                 			</c:forEach>
                 		</ul>
                 	</c:forEach>
                 </div>
            </div>
            <div id="answer">
            	<div id="solution">
                	<p align="left">
                        注&nbsp;&nbsp;意&nbsp;&nbsp;事&nbsp;&nbsp;项<br/>
                        1、本试卷依据2005年颁布的《电表校工》国家职业标准定制，考试时间${examInfoBean.eTime}。<br/>
                        2、请在考试之前认真核实自己的姓名、准考证号和所在单位的名称。<br/>
                        3、清仔细阅读答题要求，在规定位置填写答案。
                        <br/><br/>
                        <span style="color: blue;">剩余时间：02:00:00</span>
                        <span style="margin-right:100px;float: right;">答题导航栏</span>
                    </p>
                    <br> 
                    <table id="tbSolu" cellpadding="0" cellspacing="0" border="1px">
                    	<!-- 遍历行数 -->
						<c:forEach items="${qNos}" begin = "0" end="${page - 1}" varStatus="item">
				       		 <tr>
					             <c:forEach items="${qNos}" begin = "${item.index*10}" end="${(item.index+1)*10 - 1}" var="p">
					                   <td>${p}</td>
					             </c:forEach>
							</tr>
							<tr>
								<c:forEach items="${qNos}" begin = "${item.index*10}" end="${(item.index+1)*10 - 1}" var="p">
					                   <td>&nbsp;</td>
					             </c:forEach>
							</tr>
						</c:forEach>                    	
                    </table>
                    <h4>共&nbsp;${fn:length(qNos)}&nbsp;题；&nbsp;&nbsp;&nbsp;&nbsp;已答&nbsp;0&nbsp;题；&nbsp;&nbsp;&nbsp;&nbsp;剩余&nbsp;${fn:length(qNos)}&nbsp;题</h4>
                    <br/>
                        <button id="btnHand" type="button" disabled="disabled" >交卷</button>                 	
                    <br/>
                    <br/>
                </div>
            </div>
        </div>
  </body>
</html>

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

<title>My JSP 'ModifyInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>/css/Invigilating.css">
<script type="text/javascript">
		var btns = null;
		window.onload = function(){
			var select = document.getElementById("select");
			var boxes = document.getElementsByName("box");
			select.onclick = function(){
				//如果“全选/反选”复选框没被选中，实现全选，反之做反选
				if(select.checked){
					//遍历
					for(var i = 0; i < boxes.length; i++){
						boxes[i].checked = "checked";
					}
				}else{
					//1,便利boxes
					for(var i = 0; i < boxes.length; i++){
						//在遍历里面做判断，如果当前这个checkbox被选中，那么要设置成不被选中
						if(boxes[i].checked){
							boxes[i].checked = false;
						}else{
							//如果当前这个checkbox不被选中的，那么要设置成选中
							boxes[i].checked = true;
						}
					}
				}
			};
			btns = document.getElementsByTagName("button");
			
			//检查监考端是否已开考
			checkStart();
			
			//开始考试按钮
			btns[0].onclick = function(){
				//除了开始考试按钮之外，其他按钮要被设置成可被点击，而开始按钮要被设置成不可点击
				btns[0].disabled = true;
				//便利btns，然后设置disabled = false;
				for(var i = 1; i < btns.length; i++){
						btns[i].disabled = false;
				}
				//"开始按钮"被点击，要改变监考状态变为1，获取考试更新后的状态以及总时间和当前考试时间
				start();
			};
			
			//强制交卷
			btns[1].onclick = function(){
				//判断考生有没有被勾选
				var isChecked =  false;
				var exIds = "";
				for(var box = 0 ;box < boxes.length; box++){
					if(boxes[box].checked){
						isChecked = true;
						exIds += boxes[box].value + "=";
					}
				}
				if(isChecked){
					//console.log("exIds: " + exIds);强制胶卷方法
					var force = confirm("您确定要对选中的学生进行“强制交卷”动作么？");
					if(force){
						forceExam(exIds);
					}
				}else{
					alert("请勾选考生在进行操作");
				}
			};
			//作弊
			btns[2].onclick = function(){
			var isChecked =  false;
				var exIds = "";
				for(var box = 0 ;box < boxes.length; box++){
					if(boxes[box].checked){
						isChecked = true;
						exIds += boxes[box].value + "=";
					}
				}
				if(isChecked){
					//console.log("exIds: " + exIds);强制胶卷方法
					var force = confirm("您确定要对选中的学生进行“作弊”动作么？");
					if(force){
						zuobi(exIds);
					}
				}else{
					alert("请勾选考生在进行操作");
				}
			};
			
			
			//违纪
			btns[3].onclick = function(){
			var isChecked =  false;
				var exIds = "";
				for(var box = 0 ;box < boxes.length; box++){
					if(boxes[box].checked){
						isChecked = true;
						exIds += boxes[box].value + "=";
					}
				}
				if(isChecked){
					//console.log("exIds: " + exIds);强制胶卷方法
					var force = confirm("您确定要对选中的学生进行“违纪”动作么？");
					if(force){
						weiji(exIds);
					}
				}else{
					alert("请勾选考生在进行操作");
				}
			};
				
		
			
			//考试暂停与恢复考试
			btns[4].onclick = function(){
				if(select.checked){
					if(btns[4].innerText === "暂停考试"){
						//暂停考试的事情，向服务器更改监考状态
						pauseConExam(2);
						//按钮由”暂停考试“变为”恢复考试“
						btns[4].innerText = "恢复考试";
						//停止时间
						clearTimeout(timeout);
					}else{
						//恢复考试，向服务器发请求更改监考状态
						pauseConExam(1);
						//按钮由”恢复考试“变为”暂停考试“
						btns[4].innerText = "暂停考试";
						//继续计时
						checkStart();
					}
				}else{
					alert("请全选所有考生！！！");
				}
			};
			
			
			
			//导出成绩
			btns[btns.length - 1].onclick = function(){
				//向服务器获取所有考生总成绩
				var xmlhttp;
				if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
				  xmlhttp=new XMLHttpRequest();
				}else{// code for IE6, IE5
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}	
				//发送请求
				xmlhttp.open("get","getAllExamineesScore.action",true);
				xmlhttp.send();
				//接受响应数据
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						var result = xmlhttp.responseText;
						//exID=score:1=30
						console.log(result);
						var scores = result.split("|");
						console.log(scores);
						for(var i = 0; i < scores.length - 1; i++){
							//1=未登录=score
							var score = scores[i].split("=");
							console.log("document.getElementById('score' + score[0]):　" + document.getElementById("score" + score[0]));
							document.getElementById("scores" + score[0]).innerText = ((score[1]==-1)? "缺考":score[1]);
						}
						
					}
				};
				//遮罩显示
				document.getElementById("zhezhao").style.display="block";
			};
			
			//s实时获取考生状态，
			getExamineeStateScore();
		};
		
		
		//取消遮罩
		function scoreCanser(){
		document.getElementById("zhezhao").style.display="none";
		}
		//导出成绩
		function scoreExport(){
			tableToExcel("score", "ExamineesScore");
		}
		
		function base64 (content) {
		    return window.btoa(unescape(encodeURIComponent(content)));         
		}
		/*
		 *@tableId: table的Id
		 *@fileName: 要生成excel文件的名字（不包括后缀，可随意填写）
		 */
		 function tableToExcel(tableID,fileName){
		   var table = document.getElementById(tableID);
		   var excelContent = table.innerHTML;
		   var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>";
		   excelFile += "<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head>";
		   excelFile += "<body><table>";
		   excelFile += excelContent;
		   excelFile += "</table></body>";
		   excelFile += "</html>";
		   var link = "data:application/vnd.ms-excel;base64," + base64(excelFile);
		   var a = document.createElement("a");
		   a.download = fileName+".xlsx";
		   a.href = link;
		   a.click();
		 }
		
		//强制胶卷
		function forceExam(exIds){
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}	
			//发送请求
			xmlhttp.open("get","forceExam.action?exIds=" + exIds,true);
			xmlhttp.send();
			//接受响应数据
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var result = xmlhttp.responseText;
				}
			};
		}
		
		//作弊
		function zuobi(exIds){
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}	
			//发送请求
			xmlhttp.open("get","zuobi.action?exIds=" + exIds,true);
			xmlhttp.send();
			//接受响应数据
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var result = xmlhttp.responseText;
				}
			};
		}
		//违纪
		function weiji(exIds){
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}	
			//发送请求
			xmlhttp.open("get","weiji.action?exIds=" + exIds,true);
			xmlhttp.send();
			//接受响应数据
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var result = xmlhttp.responseText;
				}
			};
		}
		
		//暂停/恢复考试
		function pauseConExam(state){
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}	
			//发送请求
			xmlhttp.open("get","pauseConExam.action?state=" + state,true);
			xmlhttp.send();
			//接受响应数据
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var result = xmlhttp.responseText;
				}
			};
		}
		
		//s实时获取考生状态，
		function getExamineeStateScore(){
			//ajax创建对象
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}	
			//发送请求
			xmlhttp.open("post","getExamineeStateScore.action",true);
			xmlhttp.send();
			//接受响应数据
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					//1=未登录=score|2=未登录=score|
					var result = xmlhttp.responseText;
					//console.log("getExamineeState->result: " + result);
					var examinees = result.split("|");
					for(var i = 0; i < examinees.length - 1; i++){
						//1=未登录=score
						var infos = examinees[i].split("=");
						//1,未登录,score
						//判断状态，改变颜色
						if(infos[1]==="等待考试" || infos[1]==="考试中"){
							document.getElementById(infos[0]).style.background = "white";
						}else if(infos[1]==="考试违纪"){
							document.getElementById(infos[0]).style.background = "yellow";
						}else if(infos[1]==="已交卷"){
							document.getElementById(infos[0]).style.background = "green";
						}else if(infos[1]==="考试作弊"){
							document.getElementById(infos[0]).style.background = "red";
						}else if(infos[1]==="强制交卷"){
							document.getElementById(infos[0]).style.background = "orange";
						}
						document.getElementById("state" + infos[0]).innerText = infos[1];
						//console.log("infos[1]: " + infos[1]);
						document.getElementById("score" + infos[0]).innerText = 
							(infos[2] == -1)? "无成绩" : infos[2] + " 分";
					}
					setTimeout("getExamineeStateScore()",1000);
				}
			};
		}
		
		//检查监考端是否已开考
		function checkStart(){
			//ajax创建对象
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}	
			//发送请求
			xmlhttp.open("get","checkStart.action",true);
			xmlhttp.send();
			//接受响应数据
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var result = xmlhttp.responseText;
					//考试中|7200|0
					//alert(result);
					var strs = result.split("|");
					var state = strs[0];
					var allTime = parseInt(strs[1]);
					var curTime = parseInt(strs[2]);
					var examTime =  allTime - curTime;
					if(state==="考试中"){
						document.getElementById("state").innerHTML = state;
						document.getElementById("time").innerHTML = changeTime(examTime);
						//按钮的不可点击要更改
						if(null != btns){
							btns[0].disabled = true;
							//便利btns，然后设置disabled = false;
							for(var i = 1; i < btns.length; i++){
									btns[i].disabled = false;
							}
						}
						//开始倒计时
						changeTimeAction(allTime,curTime);
					}
				}
			};
		}
		
		
		function start(){
			//ajax创建对象
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}	
			//发送请求
			xmlhttp.open("POST","start.action",true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("tState=1");
			//接受响应数据
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var result = xmlhttp.responseText;
					//考试中|7200|0
					//alert(result);
					var strs = result.split("|");
					var state = strs[0];
					var allTime = parseInt(strs[1]);
					var curTime = parseInt(strs[2]);
					var examTime =  allTime - curTime;
					document.getElementById("state").innerHTML = state;
					document.getElementById("time").innerHTML = changeTime(examTime);
					//开始倒计时
					changeTimeAction(allTime,curTime);
				}
			};
		}
		var timeout = null;
		//倒计时方法
		function changeTimeAction(allTime,curTime){
			var newCurTime = curTime + 1;
			console.log("newCurTime: " + newCurTime);
			document.getElementById("time").innerHTML = changeTime(allTime - newCurTime);
			
			//ajax创建对象
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}	
			//发送请求
			xmlhttp.open("get","changeCruTime.action?newCurTime=" + newCurTime.toString(),true);
			xmlhttp.send();
			
			//接受响应数据
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var result = xmlhttp.responseText;
					timeout = setTimeout(function(){changeTimeAction(allTime,newCurTime);},1000);
				}else if(xmlhttp.readyState == 4 && xmlhttp.status == 0){
					if(null != timeout){
						clearTimeout(timeout);
					}
				}
			};
		}
		
		//时间格式转化
		function changeTime(examTime){
			//时
			var hour = parseInt(examTime/3600);
			var strHour = "";
			if(hour < 10){
				strHour = "0"+hour;
			}else{
				strHour = ""+hour;
			}
			//分
			var min = parseInt(examTime%3600/60);
			var strMin = "";
			if(min < 10){
				strMin = "0"+min;
			}else{
				strMin = ""+min;
			}
			//秒
			var second = parseInt(examTime%3600%60);
			var strSecond = "";
			if(second < 10){
				strSecond = "0"+second;
			}else{
				strSecond = ""+second;
			}
			return strHour + ":" + strMin +":"+ strSecond;
		}
</script>
</head>

<body>
	<div id="content">
		<div id="conHead">
			<h1>${examInfoBean.eName}</h1>
			<h4>考试类型：${examInfoBean.eType}&nbsp;&nbsp;&nbsp;&nbsp;考试时间：${examInfoBean.eTime}&nbsp;&nbsp;&nbsp;&nbsp;考生人数：${fn:length(examineeBeans)}人&nbsp;&nbsp;&nbsp;&nbsp;鉴定级别：${examInfoBean.eLevel}&nbsp;&nbsp;&nbsp;&nbsp;鉴定工种：${examInfoBean.eWork}</h4>
		</div>
		<div id="conBody">
			<div id="menus">
				<ul id="ul1">
					<li id="level1">考试状态： <br /> <span id="state">${examState}</span></li>
					<li id="level1">考试时间倒计时：<br /> <span id="time">${time}</span></li>
					<li id="level1">
						<button>开始考试</button></li>
					<li id="level1">
						<button disabled="disabled">强制交卷</button></li>
					<li id="level1">
						<button disabled="disabled">作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;弊</button>
					</li>
					<li id="level1">
						<button disabled="disabled">违&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;纪</button>
					</li>
					<li id="level1">
						<button disabled="disabled">暂停考试</button></li>
					<li id="level1">
						<button disabled="disabled">导出成绩</button></li>
				</ul>
			</div>
			<div id="stulist">
				<h4>
					考生列表：<input id="select" type="checkbox" values="全选/反选" />全选/反选
				</h4>
				<table id="outside" cellpadding="0" cellspacing="0">
					<!-- 遍历行 -->
					<c:forEach items="${examineeBeans}" begin="0" end="${page - 1}"
						varStatus="con">
						<tr>
							<c:forEach items="${examineeBeans}" begin="${con.index*4}"
								end="${(con.index + 1)*4 - 1}" var="examinee" varStatus="exam">
								<td width="25%">
									<table id="${examinee.exId}" class="inside" >
										<tr>
											<td rowspan="1"><input type="checkbox" name="box"
												value="${examinee.exId}" />
											</td>
										</tr>
										<tr>
											<td>准考证号：</td>
											<td>${examinee.exExamCard}</td>
										</tr>
										<tr>
											<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
											<td>${examinee.exName}</td>
										</tr>
										<tr>
											<td>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</td>
											<td><span id="state${examinee.exId}" class="exState">${jStates[exam.index]}</span>
											</td>
										</tr>
										<tr>
											<td>成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;绩：</td>
											<!-- 这里的EL表达式不支持字符串拼接，因此会报错：NumberFormatExection异常 -->
											<td><span id="score${examinee.exId}" class="exScore">${(examnieeScores[exam.index]
													!= -1)?
													examnieeScores[exam.index]:"无成绩"}${(examnieeScores[exam.index]
													!= -1)? "分":""}</span>
											</td>
										</tr>
									</table></td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div id="zhezhao">
        	<dir id="zheCon">
        		<table id="score" border="1px">
            	<caption><h1>参考人员总成绩表</h1></caption>
               		<tr>
                    <td>序号</td>
                    <td>准考证号</td>
                    <td>姓名</td>
                    <td>考试科目</td>
                    <td>科目名称</td>
                    <td>工种</td>
                    <td>等级</td>
                    <td>成绩</td>
                </tr>
                <c:forEach items="${examineeBeans}" var="examinee" varStatus="exam">
	                <tr>
	                    <td>${exam.index + 1}</td>
	                    <td>${examinee.exExamCard}</td>
	                    <td>${examinee.exName}</td>
	                    <td>${examInfoBean.eNo}</td>
	                    <td>${examInfoBean.eName}</td>
	                    <td>${examInfoBean.eWork}</td>
	                    <td>${examInfoBean.eLevel}</td>
	                    <td id="scores${examinee.exId}">80</td>
	                </tr>
                </c:forEach>
            </table>
            <div id="btn">
            	<input type="button" value="导出成绩" onclick="scoreExport()"><input type="button" value="取消" onclick="scoreCanser()">
            </div>
        	</dir>
        </div>
</body>
</html>

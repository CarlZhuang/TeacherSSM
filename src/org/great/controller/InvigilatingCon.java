package org.great.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.great.bean.ExamInfoBean;
import org.great.bean.ExamineeBean;
import org.great.bean.TimeBean;
import org.great.mapper.TimeMapper;
import org.great.service.ExamInfoService;
import org.great.service.ExamineeService;
import org.great.service.JoinMapperService;
import org.great.service.SocreService;
import org.great.service.TimeService;
import org.great.service.util.TeacherUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InvigilatingCon {
	
	@Autowired
	private ExamInfoService examInfoService;
	@Autowired
	private ExamineeService examineeService;
	@Autowired
	private JoinMapperService joinMapperService;
	@Autowired
	private SocreService socreService;
	@Autowired
	private TimeService timeService;
	
	private ExamInfoBean examInfoBean;
	

	@RequestMapping("/getAllExamineesScore.action")
	public String getAllExamineesScore(HttpServletResponse response){
		List<ExamineeBean> examineeBeans = examineeService.findAllExamineesByeId(examInfoBean.geteId());
		//��ȡ���п����ĳɼ�
		String examineesScore = "";
		for (ExamineeBean examineeBean : examineeBeans) {
			int score = socreService.findExamineeScoreByexId(examineeBean.getExId());
			examineesScore += examineeBean.getExId() + "=" + score + "|";
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.print(examineesScore);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("/forceExam.action")
	public String forceExam(HttpServletRequest request, HttpServletResponse response){
		String exIds = request.getParameter("exIds");
		System.out.println("exIds: " + exIds);
		
		String[] exId = exIds.split("=");
		//���ݸ�����exId������tb_join��jStateֵΪ6
		for (int i = 0; i < exId.length; i++) {
			joinMapperService.updatejStateByexIdeId(
					6, Integer.valueOf(exId[i]), examInfoBean.geteId());
			System.out.println("exId: " + exId[i]);
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.print("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//作弊
	@RequestMapping("/zuobi.action")
	public String zuobi(HttpServletRequest request, HttpServletResponse response){
		String exIds = request.getParameter("exIds");
		System.out.println("exIds: " + exIds);
		
		String[] exId = exIds.split("=");
		//���ݸ�����exId������tb_join��jStateֵΪ6
		for (int i = 0; i < exId.length; i++) {
			joinMapperService.updatejStateByexIdeId(
					4, Integer.valueOf(exId[i]), examInfoBean.geteId());
			System.out.println("exId: " + exId[i]);
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.print("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	//违纪
	@RequestMapping("/weiji.action")
	public String weiji(HttpServletRequest request, HttpServletResponse response){
		String exIds = request.getParameter("exIds");
		System.out.println("exIds: " + exIds);
		
		String[] exId = exIds.split("=");
		//���ݸ�����exId������tb_join��jStateֵΪ6
		for (int i = 0; i < exId.length; i++) {
			joinMapperService.updatejStateByexIdeId(
					3, Integer.valueOf(exId[i]), examInfoBean.geteId());
			System.out.println("exId: " + exId[i]);
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.print("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * ��ȡ����״̫�ɼ�ID
	 * @param response
	 * @return
	 */
	@RequestMapping("/pauseConExam.action")
	public String getExamineeStateScore(HttpServletRequest request, HttpServletResponse response){
		String state = request.getParameter("state");
		System.out.println("state: " + state);
		timeService.updatetStateByeId(this.examInfoBean.geteId(), 
					Integer.valueOf(state));
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.print("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * ��ȡ����״̫�ɼ�ID
	 * @param response
	 * @return
	 */
	@RequestMapping("/getExamineeStateScore.action")
	public String getExamineeStateScore(HttpServletResponse response){
		//����Ҫ����ȥ������exId,jState(�����ο�״̬),sScore�������ܳɼ���
		//��ȡ���вμӱ��ο��ԵĿ�����Ϣ
		List<ExamineeBean> examineeBeans = examineeService.findAllExamineesByeId(
				examInfoBean.geteId());
		String strResult = "";
		for (ExamineeBean examineeBean : examineeBeans) {
			//�����μӿ��Ե�״̬
			int state = joinMapperService.findJoinState(examineeBean.getExId());
			String strState = "";
			if(state==0){
				strState = "未登录";
			}else if(state==1){
				strState = "等待考试";
			}else if(state==2){
				strState = "考试中";
			}else if(state==3){
				strState = "考试违纪";
			}else if(state==4){
				strState= "考试作弊";
			}else if(state==5){
				strState = "已交卷";
			}else if(state==6){
				strState = "强制交卷" ;
			}
			int score = socreService.findExamineeScoreByexId(examineeBean.getExId());
			strResult += examineeBean.getExId() + "=" + strState + "=" + score + "|";
		}
		//1=δ��¼=score|2=δ��¼=score|
		//System.out.println("strResult: " + strResult);
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.print(strResult);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/changeCruTime.action")
	public String changeCruTime(HttpServletRequest request,HttpServletResponse response){
		String newCurTime = request.getParameter("newCurTime");
		//System.out.println("newCurTime: " + newCurTime);
		//������tCurrent����ֶ��Լ�1
		//�������ݿ���¼࿼״̬��Ϊ1
		//��ȡMapper
		int count = timeService.updatetCurrentByeId(this.examInfoBean.geteId(),Integer.valueOf(newCurTime));
		if(count != 0){
			try {
				response.setCharacterEncoding("utf-8");
				PrintWriter printWriter = response.getWriter();
				printWriter.print(newCurTime);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	@RequestMapping("/start.action")
	public String startExam(HttpServletRequest request,HttpServletResponse response){
		
		String tState = request.getParameter("tState");
		System.out.println("tState: " + tState);
		
		int updated = timeService.updatetStateByeId(this.examInfoBean.geteId(), Integer.valueOf(tState));
		System.out.println("updated: " + updated);
		if(updated != 0){
			TimeBean timeBean = timeService.findTimeBeanByeId(examInfoBean.geteId());
			
			String result = TeacherUtil.getExamState(timeBean.gettState()) + "|" + timeBean.gettAll() + "|" +timeBean.gettCurrent();
			try {
				response.setCharacterEncoding("utf-8");
				PrintWriter printWriter =  response.getWriter();
				
				printWriter.print(result);
				
				printWriter.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}
	
	@RequestMapping("/checkStart.action")
	public String checkStart(HttpServletResponse response){
		if(null != examInfoBean){
			TimeBean timeBean = timeService.findTimeBeanByeId(this.examInfoBean.geteId());
			if(timeBean !=null){
				try {
					response.setCharacterEncoding("utf-8");
					PrintWriter printWriter = response.getWriter();
					
					String result = TeacherUtil.getExamState(timeBean.gettState()) + "|" + timeBean.gettAll() + "|" +timeBean.gettCurrent();
					
					printWriter.print(result);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	@RequestMapping("/InvigilatingView.action")
	public String findInvigilatingView(HttpServletRequest request){
		examInfoBean = examInfoService.findExamInfoBeanByeNo("ST-DG-C-001");
		if(null != examInfoBean){
			request.setAttribute("examInfoBean", examInfoBean);
		
			List<ExamineeBean> examineeBeans = examineeService.findAllExamineesByeId(examInfoBean.geteId());
			request.setAttribute("examineeBeans", examineeBeans);
			
			//״
			List<String> jStates = new ArrayList<String>();
			
			List<Integer> examnieeScores = new ArrayList<Integer>();
			
			for (ExamineeBean examineeBean : examineeBeans) {
				//״̬
				int state = joinMapperService.findJoinState(examineeBean.getExId());
				if(state==0){
					jStates.add("未登录");
				}else if(state==1){
					jStates.add("等待考试");
				}else if(state==2){
					jStates.add("考试中");
				}else if(state==3){
					jStates.add("考试违纪");
				}else if(state==4){
					jStates.add("考试作弊");
				}else if(state==5){
					jStates.add("已交卷");
				}else if(state==6){
					jStates.add("强制交卷");
				}
				int score = socreService.findExamineeScoreByexId(examineeBean.getExId());
				examnieeScores.add(score);
			}
			request.setAttribute("jStates", jStates);
			request.setAttribute("examnieeScores", examnieeScores);
			
			int page = 0;
			if(examineeBeans.size()%4 == 0){
				page = examineeBeans.size()/4;
			}else{
				page = examineeBeans.size()/4 + 1;
			}
			request.setAttribute("page", page);
			
			//״̬
			TimeBean timeBean = timeService.findTimeBeanByeId(examInfoBean.geteId());

			request.setAttribute("examState", TeacherUtil.getExamState(timeBean.gettState()));
			
			//考试时间
			int examTime = timeBean.gettAll() - timeBean.gettCurrent();
			
			//时
			int hour = examTime/3600;
			String strHour = "";
			if(hour < 10){
				strHour = "0"+hour;
			}else{
				strHour = ""+hour;
			}
			//分
			int min = examTime%3600/60;
			String strMin = "";
			if(min < 10){
				strMin = "0"+min;
			}else{
				strMin = ""+min;
			}
			//秒
			int second = examTime%3600%60;
			String strSecond = "";
			if(second < 10){
				strSecond = "0"+second;
			}else{
				strSecond = ""+second;
			}
			String time = strHour + ":" + strMin +":"+ strSecond;
			request.setAttribute("time", time);
			
		}
		return "InvigilatingView";
	}
}

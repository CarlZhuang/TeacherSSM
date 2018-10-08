package org.great.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.great.bean.ExamInfoBean;
import org.great.bean.QuestionBean;
import org.great.bean.SubjectBean;
import org.great.service.ExamInfoService;
import org.great.service.QuestionService;
import org.great.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExaminationPreviewCon {
	
	@Autowired
	private ExamInfoService examInfoService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private QuestionService questionService;

	@RequestMapping("/checkPaperView.action")
	public String examPaper(HttpServletRequest request){
		
		ExamInfoBean examInfoBean = examInfoService.findExamInfoBeanByeNo("ST-DG-C-001");
		if(null != examInfoBean){
			request.setAttribute("examInfoBean", examInfoBean);
		}
		
		List<SubjectBean> subjectBeans = subjectService.findAllSubjectBeanByeId(examInfoBean.geteId());
		request.setAttribute("subjectBeans", subjectBeans);
		
		List<Integer> qNos = new ArrayList<Integer>();
		
		Map<Integer, List<QuestionBean>> mapQuestions = new HashMap<Integer, List<QuestionBean>>();
		for (SubjectBean subjectBean : subjectBeans) {
			List<QuestionBean> questionBeans = questionService.findAllQuestionBysId(subjectBean.getsId());
			mapQuestions.put(subjectBean.getsId(), questionBeans);
			
			for (QuestionBean questionBean : questionBeans) {
				qNos.add(questionBean.getqNo());
			}
		}
		request.setAttribute("mapQuestions", mapQuestions);
		request.setAttribute("qNos", qNos);
		
		int page = 0;
		if(qNos.size()%10==0){
			page = qNos.size()/10;
		}else{
			page = qNos.size()/10 + 1;
		}
		request.setAttribute("page", page);
		
		return "ExamPaperPreview";
	}
}

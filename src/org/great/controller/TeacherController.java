package org.great.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.great.bean.ExamInfoBean;
import org.great.bean.ExamineeBean;
import org.great.bean.MenuBean;
import org.great.bean.TeacherBean;
import org.great.service.ExamInfoService;
import org.great.service.ExamineeService;
import org.great.service.MenuService;
import org.great.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TeacherController {

	@Autowired
	private TeacherService teacherService;
	@Autowired
	MenuService menuService;
	@Autowired
	ExamineeService examineeService;
	@Autowired
	ExamInfoService examInfoService;
	
	@RequestMapping("/login.action")
	public String login(HttpServletRequest request){
		
		String teAcount = request.getParameter("teAcount");
		String tePwd = request.getParameter("tePwd");
		System.out.println("teAcount: " +teAcount + " , tePwd: " + tePwd);
		
		TeacherBean teacherBean = teacherService.findTeacherBeanByAcountPwd(teAcount, tePwd);
		System.out.println(teacherBean);
		if(null != teacherBean){
			List<MenuBean> menuBeans = menuService.findAllMenus();
			System.out.println(menuBeans);
			request.getSession().setAttribute("teacherBean", teacherBean);
			request.setAttribute("meus", menuBeans);
			return "ManagerMain";
		}
		return "../index";
	}
	

	@RequestMapping("/teacherInfo.action")
	public String teacherInfoView(){
		return "TeacherInfo";
	}
	

	@RequestMapping("/modifyInfoView.action")
	public String modifyInfoView(){
		return "ModifyInfo";
	}
	
	@RequestMapping("/modifyInfo.action")
	public String modifyPwd(HttpServletRequest request){
		String teName = request.getParameter("teName");
		String teSex = request.getParameter("teSex");
		String tePhone = request.getParameter("tePhone");
		
		TeacherBean teacherBean = (TeacherBean) request.getSession().getAttribute("teacherBean");
		
		int isUpdated = teacherService.updateTeacherBean(teacherBean.getTeId(), teName, teSex, tePhone);
		System.out.println("tePhone: " + tePhone + " ,teName: " + teName + " ,teSex: " + teSex);
		System.out.println("isUpdated: " + isUpdated);
		if(isUpdated!=0){
			teacherBean.setTeName(teName);
			teacherBean.setTeSex(teSex);
			teacherBean.setTePhone(tePhone);
			return "TeacherInfo";
		}else{
			return "ModifyInfo";
		}
	}
	
	@RequestMapping("/modifyPwdView.action")
	public String modifyPwdView(){
		return "ModifyPwd";
	}
	@RequestMapping("/checkExamineeView.action")
	public String  checkExaminee(HttpServletRequest request) {
		ExamInfoBean examInfoBean = examInfoService.findExamInfoBeanByeNo("ST-DG-C-001");
		List<ExamineeBean> examinee = examineeService.findAllExamineesByeId(examInfoBean.geteId());
		request.setAttribute("examinee", examinee);
		request.setAttribute("examInfoBean", examInfoBean);
		
		return "CheckExamineeView";
		
	}

	@RequestMapping("/logoff.action")
	public String logoff(HttpServletRequest request){
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("teacherBean");
		httpSession.invalidate();
		return "../index";
	}
}

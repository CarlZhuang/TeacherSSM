package org.great.service.impl;

import org.great.bean.TeacherBean;
import org.great.mapper.TeacherMapper;
import org.great.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherMapper teacherMapper; 
	
	public TeacherBean findTeacherBeanByAcountPwd(String teAcount, String tePwd) {
		return teacherMapper.findTeacherBeanByAcountPwd(teAcount, tePwd);
	}

	public int updateTeacherBean(int teId, String teName, String teSex,
			String tePhone) {
		return teacherMapper.updateTeacherBean(teId, teName, teSex, tePhone);
	}

	public boolean updatePwdByIdPwd(int teId, String tePwd) {
		// TODO Auto-generated method stub
		return teacherMapper.updatePwdByIdPwd(teId, tePwd);
	}

	public String getNameByteId(int teId) {
		// TODO Auto-generated method stub
		return teacherMapper.getNameByteId(teId);
	}
}

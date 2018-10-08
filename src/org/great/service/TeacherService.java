package org.great.service;

import org.great.bean.TeacherBean;

public interface TeacherService {

	
	public TeacherBean findTeacherBeanByAcountPwd(String teAcount, String tePwd);

	public int updateTeacherBean(int teId, String teName, String teSex, String tePhone);

	public boolean updatePwdByIdPwd(int teId, String tePwd);


	public String getNameByteId(int teId);
}

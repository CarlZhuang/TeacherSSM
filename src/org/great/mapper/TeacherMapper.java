package org.great.mapper;

import org.great.bean.TeacherBean;

public interface TeacherMapper {

	/**
	 * 根据帐号和密码，登录验证
	 * @param teAcount
	 * @param tePwd
	 * @return
	 */
	public TeacherBean findTeacherBeanByAcountPwd(String teAcount, String tePwd);
	/**
	 * 修改信息
	 * @param teId
	 * @param teName
	 * @param teSex
	 * @param tePhone
	 * @return
	 */
	public int updateTeacherBean(int teId, String teName, String teSex, String tePhone);

	/**
	 * 修改密码
	 * @param teId
	 * @param tePwd
	 * @return
	 */
	public boolean updatePwdByIdPwd(int teId, String tePwd);

	/**
	 * 根据给的教师Id来获取该教师的名字
	 * @param teId
	 * @return
	 */
	public String getNameByteId(int teId);
}

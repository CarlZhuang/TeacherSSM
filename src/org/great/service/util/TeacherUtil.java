package org.great.service.util;

public class TeacherUtil {

	/**
	 * ���ؼ࿼״̬
	 * @param tState
	 * @return
	 */
	public static String getExamState(int tState){
		String state = "";
		if(tState==0){
			state = "δ��ʼ����";
		}else if(tState==1){
			state = "������";
		}else if(tState==2){
			state = "��ͣ����";
		}else if(tState==3){
			state = "���Խ���";
		}
		return state;
	}
}

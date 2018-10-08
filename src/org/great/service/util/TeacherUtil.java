package org.great.service.util;

public class TeacherUtil {

	/**
	 * ·µ»Ø¼à¿¼×´Ì¬
	 * @param tState
	 * @return
	 */
	public static String getExamState(int tState){
		String state = "";
		if(tState==0){
			state = "Î´¿ªÊ¼¿¼ÊÔ";
		}else if(tState==1){
			state = "¿¼ÊÔÖĞ";
		}else if(tState==2){
			state = "ÔİÍ£¿¼ÊÔ";
		}else if(tState==3){
			state = "¿¼ÊÔ½áÊø";
		}
		return state;
	}
}

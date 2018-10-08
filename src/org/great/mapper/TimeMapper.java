package org.great.mapper;

import org.great.bean.TimeBean;

public interface TimeMapper {

	public TimeBean findTimeBeanByeId(int eId);
	

	public int updatetStateByeId(int eId, int tState);
	
	public int updatetCurrentByeId(int eId, int tCurrent);
}

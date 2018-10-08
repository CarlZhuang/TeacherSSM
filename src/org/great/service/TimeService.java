package org.great.service;

import org.great.bean.TimeBean;

public interface TimeService {

	public TimeBean findTimeBeanByeId(int eId);
	

	public int updatetStateByeId(int eId, int tState);
	
	public int updatetCurrentByeId(int eId, int tCurrent);
}

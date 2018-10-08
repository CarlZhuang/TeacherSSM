package org.great.service.impl;

import org.great.bean.TimeBean;
import org.great.mapper.TimeMapper;
import org.great.service.TimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TimeServiceImpl implements TimeService {
	
	@Autowired
	private TimeMapper mapper;

	public TimeBean findTimeBeanByeId(int eId) {
		return mapper.findTimeBeanByeId(eId);
	}

	public int updatetStateByeId(int eId, int tState) {
		return mapper.updatetStateByeId(eId, tState);
	}

	public int updatetCurrentByeId(int eId, int tCurrent) {
		return mapper.updatetCurrentByeId(eId, tCurrent);
	}

}

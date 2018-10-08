package org.great.service.impl;

import org.great.mapper.JoinMapper;
import org.great.service.JoinMapperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class JoinMapperServiceImpl implements JoinMapperService{

	@Autowired
	private JoinMapper joinMapper;
	
	public int findJoinState(int exId) {
		return joinMapper.findJoinState(exId);
	}

	public int updatejStateByexIdeId(int jState, int exId, int eId) {
		// TODO Auto-generated method stub
		return joinMapper.updatejStateByexIdeId(jState, exId, eId);
	}
}

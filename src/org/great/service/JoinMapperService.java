package org.great.service;

public interface JoinMapperService {

	public int findJoinState(int exId);
	

	public int updatejStateByexIdeId(int jState, int exId, int eId);
}

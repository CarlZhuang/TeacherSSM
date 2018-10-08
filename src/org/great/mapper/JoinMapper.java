package org.great.mapper;

public interface JoinMapper {

	public int findJoinState(int exId);
	

	public int updatejStateByexIdeId(int jState, int exId, int eId);
}

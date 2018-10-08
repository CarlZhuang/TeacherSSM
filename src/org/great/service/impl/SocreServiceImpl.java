package org.great.service.impl;

import org.great.mapper.SocreMapper;
import org.great.service.SocreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SocreServiceImpl implements SocreService {
	
	@Autowired
	private SocreMapper socreMapper;

	public int findExamineeScoreByexId(int exId) {
		return socreMapper.findExamineeScoreByexId(exId);
	}

}

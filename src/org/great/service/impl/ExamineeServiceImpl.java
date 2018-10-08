package org.great.service.impl;

import java.util.List;

import org.great.bean.ExamineeBean;
import org.great.mapper.ExamineeMapper;
import org.great.service.ExamineeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExamineeServiceImpl implements ExamineeService {

	@Autowired
	private ExamineeMapper examineeMapper;
	
	public List<ExamineeBean> findAllExamineesByeId(int eId) {
		return examineeMapper.findAllExamineesByeId(eId);
	}
}

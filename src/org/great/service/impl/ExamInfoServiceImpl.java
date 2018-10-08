package org.great.service.impl;

import org.great.bean.ExamInfoBean;
import org.great.mapper.ExamInfoMapper;
import org.great.service.ExamInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExamInfoServiceImpl implements ExamInfoService {

	@Autowired
	private ExamInfoMapper examInfoMapper;

	public ExamInfoBean findExamInfoBeanByeNo(String eNo){
		return examInfoMapper.findExamInfoBeanByeNo(eNo);
	}
}

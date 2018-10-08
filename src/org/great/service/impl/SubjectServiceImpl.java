package org.great.service.impl;

import java.util.List;

import org.great.bean.SubjectBean;
import org.great.mapper.SubjectMapper;
import org.great.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Autowired
	private SubjectMapper subjectMapper;


	public List<SubjectBean> findAllSubjectBeanByeId(int eId){
		return subjectMapper.findAllSubjectBeanByeId(eId);
	}
}

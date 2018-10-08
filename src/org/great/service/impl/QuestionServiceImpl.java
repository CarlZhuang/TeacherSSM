package org.great.service.impl;

import java.util.List;

import org.great.bean.QuestionBean;
import org.great.mapper.QuestionMapper;
import org.great.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionMapper questionMapper;


	public List<QuestionBean> findAllQuestionBysId(int sId){
		return questionMapper.findAllQuestionBysId(sId);
	}
}

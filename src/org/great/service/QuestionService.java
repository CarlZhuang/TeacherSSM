package org.great.service;

import java.util.List;

import org.great.bean.QuestionBean;

public interface QuestionService {


	public List<QuestionBean> findAllQuestionBysId(int sId);
}

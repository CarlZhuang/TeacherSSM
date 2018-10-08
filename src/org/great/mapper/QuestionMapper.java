package org.great.mapper;

import java.util.List;

import org.great.bean.QuestionBean;

public interface QuestionMapper {


	public List<QuestionBean> findAllQuestionBysId(int sId);
}

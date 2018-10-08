package org.great.mapper;

import java.util.List;

import org.great.bean.SubjectBean;

public interface SubjectMapper {


	public List<SubjectBean> findAllSubjectBeanByeId(int eId);
}

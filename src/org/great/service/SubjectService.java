package org.great.service;

import java.util.List;

import org.great.bean.SubjectBean;

public interface SubjectService {


	public List<SubjectBean> findAllSubjectBeanByeId(int eId);
}

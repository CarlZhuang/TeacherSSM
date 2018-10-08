package org.great.service;

import java.util.List;

import org.great.bean.ExamineeBean;


public interface ExamineeService {

	public List<ExamineeBean> findAllExamineesByeId(int eId);
}

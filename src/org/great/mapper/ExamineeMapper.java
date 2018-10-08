package org.great.mapper;

import java.util.List;

import org.great.bean.ExamineeBean;


public interface ExamineeMapper {

	public List<ExamineeBean> findAllExamineesByeId(int eId);
}

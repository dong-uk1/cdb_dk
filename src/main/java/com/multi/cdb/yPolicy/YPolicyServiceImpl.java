package com.multi.cdb.yPolicy;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class YPolicyServiceImpl implements YPolicyServiceInterface {

	@Autowired
	YPolicyDAOImpl dao;

	@Override
	public void insert(YPolicyVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(YPolicyVO vo) {

	}

	//@Override
	//public YPolicyVO one(String YP_NAME, String CATEGORY, String YP_REGION) {
	//	return null;
	//}

	@Override
	public List<YPolicyVO> list() {
		return null;
	}

}
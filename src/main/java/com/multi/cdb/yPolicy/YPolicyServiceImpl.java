package com.multi.cdb.yPolicy;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
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

	@Override
	public YPolicyVO search(String YP_NAME, String CATEGORY, String YP_REGION) {
		return null;
	}

	@Override
	public List<YPolicyVO> YpList() {
		return dao.YpList();
	}
	
	@Override
	public List<YPolicyVO> selectOne(){
		return dao.selectOne();
	}

}

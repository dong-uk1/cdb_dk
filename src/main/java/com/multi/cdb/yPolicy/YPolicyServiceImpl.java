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
	public List<YPolicyVO> search(YPolicyVO vo) {
		return dao.search(vo);
	}

	@Override
	public List<YPolicyVO> YpList(PageVO vo) {
		return dao.YpList(vo);
	}


	@Override
	public List<YPolicyVO> selectOne(String YP_CATEGORY) {
		return dao.selectOne(YP_CATEGORY);
	}

	@Override
	public List<YPolicyVO> detailOne(String YP_NAME) {
		return dao.detailOne(YP_NAME);
	}
	
	@Override
	public void viewCount(YPolicyVO vo) {
		dao.viewCount(vo);
	}

}

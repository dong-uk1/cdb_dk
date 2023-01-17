package com.multi.cdb.yPolicy;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class YPolicyDAOImpl implements YPolicyDAOInterface {
	
	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public void insert(YPolicyVO vo) {
		my.insert("yp.insert", vo);
	}

	@Override
	public void update(YPolicyVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public YPolicyVO one(String YP_NAME, String CATEGORY, String YP_REGION) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<YPolicyVO> list() {
		// TODO Auto-generated method stub
		return null;
	}

}

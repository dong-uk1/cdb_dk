package com.multi.cdb.yPolicy;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

@Component
public class YPolicyDAOImpl implements YPolicyDAOInterface {

	@Autowired
	SqlSessionTemplate my;
	
	@Autowired
	MongoTemplate mongo;

	@Override
	public void insert(YPolicyVO vo) {
		my.insert("yp.insert", vo);
	}

	@Override
	public void update(YPolicyVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public YPolicyVO search(String YP_NAME, String CATEGORY, String YP_REGION) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<YPolicyVO> list() {
		return my.selectList("yp.all");
		/*
		 * Query query = new Query(); return mongo.find(query, YPolicyVO.class, "yp");
		 */
	}
	
	@Override
	public List<YPolicyVO> selectOne(){
		return my.selectList("yp.selectOne");
	}

}

package com.multi.cdb.yPolicy;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class YPolicyDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<YPolicyVO> list() {
		return my.selectList("YPolicy.list");
	}
	
	/*
	 * public BbsVO one(BbsVO vo) { return my.selectOne("bbs.one", vo); // bookVO }
	 */
	/*
	 * public List<BbsVO> list1(BbsVO vo) { return my.selectList("bbs.one", vo); }
	 */
}

package com.multi.cdb.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class BbsDAO implements BbsDAOInter {

	@Autowired
	SqlSessionTemplate my;

	@Override
	public List<BbsVO> list() {
		return my.selectList("bbs.list");
	}
	
	public List<BbsVO> list1(BbsVO vo) {
		System.out.println("키워드값 테스트 : " + vo.getFiltertext());
		System.out.println(vo.getBbs_contents());
		return my.selectList("bbs.one", vo);
	}
}

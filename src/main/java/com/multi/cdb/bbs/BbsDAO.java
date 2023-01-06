package com.multi.cdb.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public BbsVO createdId() {
		return my.selectOne("bbs.createdId");
	}
	
	public List<BbsVO> list(BbsVO vo) {
		return my.selectList("bbs.listId", vo);
	}
	
	public List<BbsVO> list2(BbsVO vo) { 
		return my.selectList("bbs.listTitle", vo);
	}
	
	
	
	public List<BbsVO> all() { 
		 return my.selectList("bbs.all"); }
	
	public int count() {
		return my.selectOne("bbs.count");
	}                                                               
	
	public BbsVO one(int bbs_Id) {
		return my.selectOne("bbs.one", bbs_Id);
	}          
	
	public int recommend_count(RecommendVO vo) {
		return my.selectOne("bbs.recommend_count", vo);
	}    
	public int insert(BbsVO vo) {
		return my.insert("bbs.create", vo);
	}
	public int insert2(RecommendVO vo) {
		return my.insert("bbs.recommend_in", vo);
	}
	public int up(BbsVO vo) {
		return my.update("bbs.up", vo);
	}
	public int del(BbsVO vo) {
		return my.delete("bbs.del", vo);
	}
}

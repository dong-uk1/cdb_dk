<<<<<<< HEAD
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
=======
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
>>>>>>> 8d1c19413864fe343b5f33f875caa98114e6c76d

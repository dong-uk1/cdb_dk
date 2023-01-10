package com.multi.cdb.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;

	public int insert(ReplyVO vo) {
		return my.insert("reply.create", vo);
	}
	
	public List<ReplyVO> all(ReplyVO vo) { 
		 return my.selectList("reply.all", vo); }
	
	public int del(ReplyVO vo) {
		return my.delete("reply.del", vo);
	}
	
}

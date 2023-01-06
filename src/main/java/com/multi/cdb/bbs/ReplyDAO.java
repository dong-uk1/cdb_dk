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
	
}

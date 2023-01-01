package com.multi.cdb;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(BuyVO vo) {
		my.insert("buy.insert", vo);
	}
}

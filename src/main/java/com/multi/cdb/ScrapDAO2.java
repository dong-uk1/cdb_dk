package com.multi.cdb;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ScrapDAO2 {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void rent_scrap(ScrapVO vo) {
		my.insert("borrow.scrap", vo );
	}
	
	public void sale_scrap(ScrapVO vo) {
		my.insert("buy.scrap", vo);
	}
	
	public void job_scrp(ScrapVO vo) {
		my.insert("", vo);
	}
	
	public void policy_scrap(ScrapVO vo) {
		my.insert("", vo);
	}
}

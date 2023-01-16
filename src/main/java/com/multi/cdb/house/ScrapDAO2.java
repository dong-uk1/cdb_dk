package com.multi.cdb.house;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ScrapDAO2 implements ScrapDAO2Interface {
	
	@Autowired
	SqlSessionTemplate my;

	// 공공 임대 주택 스크랩
	@Override
	public void rent_scrap(ScrapVO vo) {
		my.insert("borrow.scrap", vo);
	}
	// 스크랩 중복방지를 위해 스크랩 갯수 세기
	@Override
	public int scrap_count(ScrapVO vo) {
		return my.selectOne("borrow.scrapCount", vo);
	}
	//  스크랩 삭제
	@Override
	public void scrap_delete(ScrapVO vo) {
		my.delete("borrow.scrapDelete", vo);
	}
	
	// 공공 분양 주택 스크랩
	@Override
	public void sale_scrap(ScrapVO vo) {
		my.insert("buy.scrap", vo);
	}
	
	// 공공 분양 주택 스크랩 중복방지를 위해 스크랩 갯수 세기
	@Override
	public int sale_scrap_count(ScrapVO vo) {
		return my.selectOne("buy.scrapCount", vo);
	}

	// 공공 분양 주택 스크랩 삭제
	@Override
	public void sale_scrap_delete(ScrapVO vo) {
		my.delete("buy.scrapDelete", vo);
	}
	
	@Override
	public void job_scrp(ScrapVO vo) {
		my.insert("", vo);
	}
	
	@Override
	public void policy_scrap(ScrapVO vo) {
		my.insert("", vo);
	}
}

package com.multi.cdb.house;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ScrapService2 implements ScrapService2Interface {

	@Autowired
	private ScrapDAO2Interface dao2;
	
	@Autowired
	private ScrapVO scrap_vo;
	
	// 공공 주택 임대 스크랩
	@Override
	public void rent_scrap(ScrapVO vo) {
		dao2.rent_scrap(vo);
	}
	
	// 스크랩 수 세기(중복 방지)
	@Override
	public int rent_scrap_count(ScrapVO vo) {
		return dao2.scrap_count(vo);
	}
	
	// 스크랩 취소
	@Override
	public void rent_scrap_delete(ScrapVO vo) {
		dao2.scrap_delete(vo);
	}
	
	// 공공 주택 분양 서비스 
	@Override
	public void sale_scrap(String title, String url, String scrap_member) {
		scrap_vo.setScrap_title(title);
		scrap_vo.setScrap_link(url);
		scrap_vo.setScrap_type("sale");
		scrap_vo.setScrap_member(scrap_member);
		
		dao2.sale_scrap(scrap_vo);
	}
	
	// 정책 서비스
	@Override
	public void policy_scrap(String title, String url) {	
		scrap_vo.setScrap_title(title);
		scrap_vo.setScrap_link(url);
		scrap_vo.setScrap_type("policy");
		scrap_vo.setScrap_member("");
		
		dao2.policy_scrap(scrap_vo);
	}

	// 일자리 서비스
	@Override
	public void job_scrap(String title, String url) {
		scrap_vo.setScrap_title(title);
		scrap_vo.setScrap_link(url);
		scrap_vo.setScrap_type("job");
		scrap_vo.setScrap_member("");
		
		dao2.job_scrp(scrap_vo);
		
	}
}

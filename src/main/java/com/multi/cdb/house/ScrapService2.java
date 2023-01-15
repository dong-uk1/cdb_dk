package com.multi.cdb.house;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ScrapService2 {

	@Autowired
	private ScrapDAO2 dao2;
	
	@Autowired
	private ScrapVO scrap_vo;
	
	// 공공 주택 임대 서비스
	public void rent_scrap(String title, String url) {
		scrap_vo.setScrap_title(title);
		scrap_vo.setScrap_link(url);
		scrap_vo.setScrap_type("rent");
		scrap_vo.setScrap_member("gildong");
		
		dao2.rent_scrap(scrap_vo);
	}	
	
	// 공공 주택 분양 서비스 
	public void sale_scrap(String title, String url) {
		scrap_vo.setScrap_title(title);
		scrap_vo.setScrap_link(url);
		scrap_vo.setScrap_type("sale");
		scrap_vo.setScrap_member("hyeonji");
		
		dao2.sale_scrap(scrap_vo);
	}
	
	// 정책 서비스
	public void policy_scrap(String title, String url) {	
		scrap_vo.setScrap_title(title);
		scrap_vo.setScrap_link(url);
		scrap_vo.setScrap_type("policy");
		scrap_vo.setScrap_member("");
		
		dao2.policy_scrap(scrap_vo);
	}

	// 일자리 서비스
	public void job_scrap(String title, String url) {
		scrap_vo.setScrap_title(title);
		scrap_vo.setScrap_link(url);
		scrap_vo.setScrap_type("job");
		scrap_vo.setScrap_member("");
		
		dao2.job_scrp(scrap_vo);
		
	}
}

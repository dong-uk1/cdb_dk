package com.multi.cdb.house;

public interface ScrapService2Interface {

	// 공공 주택 임대 스크랩
	void rent_scrap(ScrapVO vo);

	// 스크랩 수 세기(중복 방지)
	int rent_scrap_count(ScrapVO vo);

	// 스크랩 취소
	void rent_scrap_delete(ScrapVO vo);

	// 공공 주택 분양 서비스 
	void sale_scrap(String title, String url, String scrap_member);

	// 정책 서비스
	void policy_scrap(String title, String url);

	// 일자리 서비스
	void job_scrap(String title, String url);

}
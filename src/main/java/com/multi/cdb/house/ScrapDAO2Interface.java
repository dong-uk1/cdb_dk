package com.multi.cdb.house;

public interface ScrapDAO2Interface {

	// 공공 임대 주택 스크랩
	void rent_scrap(ScrapVO vo);

	// 공공 임대 주택 스크랩 중복방지를 위해 스크랩 갯수 세기
	int scrap_count(ScrapVO vo);

	// 공공 임대 주택 스크랩 삭제
	void scrap_delete(ScrapVO vo);

	// 공공 분양 주택 스크랩
	void sale_scrap(ScrapVO vo);

	// 공공 분양 주택 스크랩 중복방지를 위해 스크랩 갯수 세기
	int sale_scrap_count(ScrapVO vo);

	// 공공 분양 주택 스크랩 삭제
	void sale_scrap_delete(ScrapVO vo);

	void job_scrp(ScrapVO vo);

	void policy_scrap(ScrapVO vo);

}
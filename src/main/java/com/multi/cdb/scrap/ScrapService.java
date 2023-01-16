package com.multi.cdb.scrap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScrapService {

	@Autowired
	ScrapDAO dao;

	// 일자리 스크랩 리스트 불러오기
	public List<ScrapVO> scrap_joblist() {
		return dao.scrap_job();
	}

}

package com.multi.cdb.scrap;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScrapDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ScrapVO> scrap_job() {
		return mybatis.selectList("scrap.scraplist_Job");
	}
	
}

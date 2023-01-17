package com.multi.cdb.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NewsDAO {
	@Autowired
	SqlSessionTemplate my;

	public List<NewsVO> list() {
		return my.selectList("news.list");
	}
}

<<<<<<< HEAD
package com.multi.cdb.bbs;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NewsDAO {

	@Autowired
	SqlSessionTemplate my;

	public int insert(NewsVO vo) {
		return my.insert("news.r_create", vo);
	}
}
=======
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
>>>>>>> 8d1c19413864fe343b5f33f875caa98114e6c76d

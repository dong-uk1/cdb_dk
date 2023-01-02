package com.multi.cdb;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(BuyVO vo) {
		my.insert("buy.insert", vo);
	}
	
	public List<BuyVO> sel_list(BuyVO vo) {
		return my.selectList("buy.sel_list");
	}
}

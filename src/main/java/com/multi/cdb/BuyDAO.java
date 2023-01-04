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
	
	public List<BuyVO> sel_list(String by_brtc) {
		return my.selectList("buy.sel_list", by_brtc);
	}
	
	public List<BuyVO> all() {
		return my.selectList("buy.all");
	}
	
	public List<BuyVO> list_id(String by_pbid){
		return my.selectList("buy.list_id", by_pbid);
	}
}

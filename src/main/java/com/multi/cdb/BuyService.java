package com.multi.cdb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyService {
	
	@Autowired
	private BuyDAO dao;
	
	public void insert(BuyVO vo) {
		dao.insert(vo);
	}
	
	public List<BuyVO> all(){
		return dao.all();
	}
	
	public List<BuyVO> city(String by_brtc) {
		return dao.city(by_brtc);
	}
	
	public List<BuyVO> detail(Map<String, Object> map) {
		return dao.detail(map);
	}

}

package com.multi.cdb.house;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BorrowService {
	
	@Autowired
	private BorrowDAO dao;

	public void insert(BorrowVO vo) {
		dao.insert(vo);
	}
	
	public List<BorrowVO> all(){
		return dao.all();
	}
	
	public List<BorrowVO> city(String br_brtc) {
		return dao.city(br_brtc);
	}
	
	public List<BorrowVO> detail(Map<String, Object> map) {
		return dao.detail(map);
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<BorrowVO> selectPage(PageVO vo){
		return dao.selectPage(vo);
	}

}

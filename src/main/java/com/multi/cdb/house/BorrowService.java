package com.multi.cdb.house;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BorrowService implements BorrowServiceInterface {
	
	@Autowired
	private BorrowDAOInterface dao;

	@Override
	public void insert(BorrowVO vo) {
		dao.insert(vo);
	}
	
	@Override
	public List<BorrowVO> all(){
		return dao.all();
	}
	
	@Override
	public List<BorrowVO> city(String br_brtc) {
		return dao.city(br_brtc);
	}
	
	@Override
	public List<BorrowVO> detail(Map<String, Object> map) {
		return dao.detail(map);
	}
	
	@Override
	public int count() {
		return dao.count();
	}
	
	@Override
	public List<BorrowVO> selectPage(PageVO vo){
		return dao.selectPage(vo);
	}

}

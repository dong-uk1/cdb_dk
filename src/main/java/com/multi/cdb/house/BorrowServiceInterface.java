package com.multi.cdb.house;

import java.util.List;
import java.util.Map;

public interface BorrowServiceInterface {

	void insert(BorrowVO vo);

	List<BorrowVO> all();

	List<BorrowVO> city(String br_brtc);

	List<BorrowVO> detail(Map<String, Object> map);

	int count();

	List<BorrowVO> selectPage(PageVO vo);

}
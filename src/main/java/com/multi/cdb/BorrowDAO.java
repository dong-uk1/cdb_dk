package com.multi.cdb;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Component
public class BorrowDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	// GetData 자바 파일에서 요청함.
	// 공공 api에서 불러와 db에 레코드로 저장하는 메서드
	public void insert(BorrowVO vo) {
		my.insert("borrow.insert", vo);
	}
	
	// 검색결과에 맞는 값을 반환해줄 메서드
	// 요청 변수로 광역시 변수로 요청
	public List<BorrowVO> sel_list(String br_brtc) {
		return my.selectList("borrow.sel_list", br_brtc);
	}
	
	public List<BorrowVO> list_id(String br_pbid) {
		return my.selectList("borrow.list_id", br_pbid);
	}
	
	public List<BorrowVO> all() {
		return my.selectList("borrow.all");
	}
}

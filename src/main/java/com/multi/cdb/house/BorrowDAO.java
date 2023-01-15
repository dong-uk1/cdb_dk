package com.multi.cdb.house;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BorrowDAO {

	@Autowired
	SqlSessionTemplate my;

	// 자바 클래스파일 GetData에서 요청함.
	// 공공 api에서 데이터를 불러와 db에 삽입
	public void insert(BorrowVO vo) {
		my.insert("borrow.insert", vo);
	}

	// 전체 레코드 조회
	public List<BorrowVO> all() {
		return my.selectList("borrow.all");
	}

	// 파라미터는 광역시
	// 광역시로 레코드 조회
	public List<BorrowVO> city(String br_brtc) {
		return my.selectList("borrow.city", br_brtc);
	}

	// 파라미터는 공고아이디와 광역시
	// 다중 파라미터로 인해 해쉬맵으로 받음.
	// 공고아이디와 광역시로 레코드 조회
	public List<BorrowVO> detail(Map<String, Object> map) {
		return my.selectList("borrow.detail", map);
	}

	// 중복된 공고명 하나만 조회
	public String show_pbname(String br_pbid) {
		return my.selectOne("borrow.show_pbname", br_pbid);
	}
	
	// 페이징 게시물 총 갯수 세기
	public int count() {
		return my.selectOne("borrow.count");
	}

	public List<BorrowVO> selectPage(PageVO vo) {
		return my.selectList("borrow.paging", vo);
	}
}

package com.multi.cdb.house;

import java.util.List;
import java.util.Map;

public interface BorrowDAOInterface {

	// 자바 클래스파일 GetData에서 요청함.
	// 공공 api에서 데이터를 불러와 db에 삽입
	void insert(BorrowVO vo);

	// 전체 레코드 조회
	List<BorrowVO> all();

	// 파라미터는 광역시
	// 광역시로 레코드 조회
	List<BorrowVO> city(String br_brtc);

	// 파라미터는 공고아이디와 광역시
	// 다중 파라미터로 인해 해쉬맵으로 받음.
	// 공고아이디와 광역시로 레코드 조회
	List<BorrowVO> detail(Map<String, Object> map);

	// 중복된 공고명 하나만 조회
	String show_pbname(String br_pbid);

	// 페이징 게시물 총 갯수 세기
	int count();

	List<BorrowVO> selectPage(PageVO vo);

}
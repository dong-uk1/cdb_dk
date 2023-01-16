package com.multi.cdb.house;

import java.util.List;
import java.util.Map;

public interface BuyDAOInterface {

	// 자바 클래스파일 GetData에서 요청함.
	// 공공 api에서 데이터를 불러와 db에 삽입
	void insert(BuyVO vo);

	// 전체 레코드 조회
	List<BuyVO> all();

	// 파라미터는 광역시
	// 광역시로 레코드 조회
	List<BuyVO> city(String by_brtc);

	// 파라미터는 공고아이디와 광역시
	// 다중 파라미터로 인해 해쉬맵으로 받음.
	// 공고아이디와 광역시로 레코드 조회
	List<BuyVO> detail(Map<String, Object> map);

	// 중복된 공고명 하나만 조회
	String show_pbname(String by_pbid);

}
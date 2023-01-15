package com.multi.cdb.house;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuyDAO {

	@Autowired
	SqlSessionTemplate my;

	// 자바 클래스파일 GetData에서 요청함.
	// 공공 api에서 데이터를 불러와 db에 삽입
	public void insert(BuyVO vo) {
		my.insert("buy.insert", vo);
	}

	// 전체 레코드 조회
	public List<BuyVO> all() {
		return my.selectList("buy.all");
	}

	// 파라미터는 광역시
	// 광역시로 레코드 조회
	public List<BuyVO> city(String by_brtc) {
		return my.selectList("buy.city", by_brtc);
	}

	// 파라미터는 공고아이디와 광역시
	// 다중 파라미터로 인해 해쉬맵으로 받음.
	// 공고아이디와 광역시로 레코드 조회
	public List<BuyVO> detail(Map<String, Object> map) {
		return my.selectList("buy.detail", map);
	}

	// 중복된 공고명 하나만 조회
	public String show_pbname(String by_pbid) {
		return my.selectOne("buy.show_pbname", by_pbid);
	}
}

package com.multi.cdb.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	// 회원 가입
	public int insert(MemberVO vo) {
		return mybatis.insert("member.join", vo);
	}

	// 아이디 중복 확인
	public MemberVO idCheck(MemberVO vo) {
		return mybatis.selectOne("member.idCheck", vo);
	}

	// 내 정보 수정
	public int update(MemberVO vo) {
		return mybatis.update("member.update", vo);
	}

	// 비밀번호 수정
	public int pwupdate(MemberVO vo) {
		return mybatis.update("member.pwupdate", vo);
	}

	// 회원 탈퇴
	public int delete(MemberVO vo) {
		return mybatis.delete("member.delete", vo);
	}

	// 아이디 찾기
	public MemberVO idfind(MemberVO vo) {
		return mybatis.selectOne("member.idfind", vo);
	}

	// 비밀번호 찾기
	public MemberVO pwfind(MemberVO vo) {
		return mybatis.selectOne("member.pwfind", vo);
	}

	public MemberVO login(MemberVO vo) {
		return mybatis.selectOne("member.login", vo);
	}

}

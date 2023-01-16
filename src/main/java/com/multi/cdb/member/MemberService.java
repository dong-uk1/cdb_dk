package com.multi.cdb.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;

	// 회원 가입
	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}

	// 아이디 중복 확인
	public MemberVO idCheck(MemberVO vo) {
		return dao.idCheck(vo);
	}

	// 내 정보 수정
	public int update(MemberVO vo) {
		return dao.update(vo);
	}

	// 비밀번호 수정
	public int pwupdate(MemberVO vo) {
		return dao.pwupdate(vo);
	}

	// 회원 탈퇴
	public int delete(MemberVO vo) {
		return dao.delete(vo);
	}

	// 아이디 찾기
	public MemberVO idfind(MemberVO vo) {
		return dao.idfind(vo);
	}

	// 비밀번호 찾기
	public MemberVO pwfind(MemberVO vo) {
		return dao.pwfind(vo);
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

}

package com.multi.cdb.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	// 회원 가입
	@RequestMapping("member/memjoin")
	public void insert(MemberVO vo, Model model) {
		service.insert(vo);
		model.addAttribute("vo", vo);
	}

	// 아이디 중복 확인
	@RequestMapping("member/idCheck")
	public void idCheck(MemberVO vo, Model model) {
		MemberVO vo2 = service.idCheck(vo);
		String result = "아이디 사용 불가";
		if (vo2 == null) {
			result = "아이디 사용 가능";
		}
		model.addAttribute("idCheck", result);
	}

	// 회원 정보 수정
	@RequestMapping("member/Myupdate")
	public void update(MemberVO vo, Model model) {
		service.update(vo);
		model.addAttribute("vo", vo);
	}

	// 비밀번호 변경
	@RequestMapping("member/PwEdit")
	public void pwupdate(MemberVO vo, Model model, HttpSession session) {
		service.pwupdate(vo);
		session.setAttribute("member_pw", vo.member_pw);
		model.addAttribute("vo", vo);
	}

	// 회원 정보 삭제
	@RequestMapping("member/Mydelete")
	public void delete(MemberVO vo, Model model) {
		service.delete(vo);
		model.addAttribute("vo", vo);
	}

	// 아이디 찾기
	@RequestMapping("member/Idfind")
	public void idfind(MemberVO vo, Model model) {
		MemberVO vo2 = service.idfind(vo);
		model.addAttribute("vo2", vo2);
	}

	// 비밀번호 찾기
	@RequestMapping("member/Pwfind")
	public void pwfind(MemberVO vo, Model model) {
		MemberVO vo2 = service.pwfind(vo);
		model.addAttribute("vo2", vo2);
	}

//	// 로그인
//	@RequestMapping("member/login")
//	public String login(MemberVO vo, HttpSession session ) {
//		MemberVO vo2 = service.login(vo);
//		System.out.println(vo2);
//		if(vo2 != null) {
//			session.setAttribute("member_id", vo2.member_id);
//			session.setAttribute("member_pw", vo2.member_pw);
//			return "member/login"; //views/member/login.jsp
//		}else {
//			return "아이디 또는 비밀번호가 일치하지 않습니다";
//			return "redirect:CdbLogin.jsp"; //webapp/member/CdbLogin.jsp
//		}
//	}

	// 로그인
	@RequestMapping("member/loginCheck")
	public void login(MemberVO vo, HttpSession session, Model model) {
		MemberVO vo2 = service.login(vo);
		System.out.println(vo2);
		String result = "로그인";
		if (vo2 != null) {
			session.setAttribute("member_id", vo2.member_id);
			session.setAttribute("member_pw", vo2.member_pw);
			result = "로그인 성공";
		} else {
			result = "아이디 또는 비밀번호가 일치하지 않습니다";
		}
		model.addAttribute("loginCheck", result);
	}

	// view로 보내는 메서드
	@RequestMapping("member/login2")
	public String views() {
		return "member/login";
	}

	// 로그아웃
	@RequestMapping("member/logout")
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
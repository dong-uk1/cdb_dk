package com.multi.cdb.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReplyController {

	
	@Autowired
	ReplyDAO dao;
	
	@RequestMapping("bbs/reply_insert")
	public void insert(ReplyVO vo, Model model) {
		// 리뷰<--- movie(oriId, img)
		// insert into review values (null, #{oriId}, #{content}, #{writer})
		// 화면만들때는
		// review + movie(oriId, img)

		int result = dao.insert(vo);
		// BbsVO vo2 = dao.createdId();
		String text = "게시물 작성 성공";
		if (result != 1) {
			text = "게시물 작성 실패";
		}
		model.addAttribute("result", text);
		// model.addAttribute("id", vo2.getBbs_Id());
	}
	
	@RequestMapping("bbs/reply_list")
	public void list(ReplyVO vo ,Model model) {
		List<ReplyVO> list = dao.all(vo);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("bbs/reply_del")
	public void del(ReplyVO vo ,Model model) {
		int result = dao.del(vo);
		
		String text = "댓글 삭제 완료";
		if (result != 1) {
			text = "댓글 삭제 실패";
		}
		model.addAttribute("result", text); 
	}
}

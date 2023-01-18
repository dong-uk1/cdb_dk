package com.multi.cdb.bbs;

import java.io.Console;
import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.xdevapi.Result;

@Controller
public class BbsController implements stockDAOinter {

	@Autowired
	BbsDAO dao;
	
	@Autowired
	ReplyDAO dao2;

	@Override
	@RequestMapping("bbs/bbs_all")
	public void all(Model model) {
		List<BbsVO> list = dao.all();
		model.addAttribute("list", list);
	}

	@Override
	@RequestMapping("bbs/bbs_search_name")
	public void name(BbsVO vo, Model model) {
		List<BbsVO> list = dao.list(vo);
		model.addAttribute("list", list);
	}

	@Override
	@RequestMapping("bbs/bbs_search_title")
	public void title(BbsVO vo, Model model) {
		List<BbsVO> list = dao.list2(vo);
		model.addAttribute("list", list);

//		return "redirect:bbs_main.jsp";
	}

	@Override
	@RequestMapping("bbs/bbs_insert")
	public String insert(BbsVO vo, Model model) {

		int result = dao.insert(vo);
		// BbsVO vo2 = dao.createdId();
		String text = "게시물 작성 성공";

		if (result != 1) {
			text = "게시물 작성 실패";
			return "redirect:bbs_insert.jsp";
		}
		model.addAttribute("result", text);
		// model.addAttribute("id", vo2.getBbs_Id());
		return "redirect:bbs/bbs_main.jsp";
	}

	@RequestMapping("bbs/bbs_contents")
	private void one(int bbs_Id, ReplyVO vo2, Model model) {
		BbsVO vo = dao.one(bbs_Id);
		List<ReplyVO> list = dao2.all(vo2);

		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		
		
		

	}

	@Override
	@RequestMapping("bbs/bbs_recommend")
	public void insert2(RecommendVO vo, Model model) {

		int list = dao.insert2(vo);
		model.addAttribute("list", list);
		// model.addAttribute("id", vo2.getBbs_Id());
	}

	@Override
	@RequestMapping("bbs/bbs_recommend_count")
	public void recommend_count(RecommendVO vo, Model model) {

		int count = dao.recommend_count(vo);
		model.addAttribute("count", count);

		// model.addAttribute("id", vo2.getBbs_Id());
	}

	@Override
	@RequestMapping("bbsDel")
	public void delete(BbsVO vo, Model model) {
		int result = dao.del(vo);
		model.addAttribute("result", result);
	}
}

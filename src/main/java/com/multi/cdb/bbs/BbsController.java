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
public class BbsController {

	@Autowired
	BbsDAO dao;

	/*
	 * @Autowired ReplyDAO dao2;
	 * 
	 * @RequestMapping("bbsList") public void list(BbsVO vo, Model model) {
	 * List<BbsVO> list = dao.list(); model.addAttribute("list", list); }
	 * 
	 * @RequestMapping("bbsList2") public void list2(PageVO vo, Model model) {
	 * vo.setStartEnd(vo.getPage()); List<BbsVO> list = dao.list2(vo);
	 * model.addAttribute("list", list); }
	 * 
	 * @RequestMapping("bbsAll") public void all(PageVO vo, Model model) {
	 * vo.setStartEnd(vo.getPage()); List<BbsVO> list = dao.all(vo); int count =
	 * dao.count(); System.out.println("all count>> " + count); int pages = count /
	 * 10 + 1; model.addAttribute("list", list); model.addAttribute("count", count);
	 * model.addAttribute("pages", pages); }
	 */
	/*
	 * @RequestMapping("bbsOne") public void one(BbsVO vo, Model model) { //게시물 1개짜리
	 * vo2 //replyList BbsVO vo2 = dao.one(vo); model.addAttribute("one", vo2);
	 * 
	 * List<ReplyVO> list = dao2.list(vo); model.addAttribute("list", list); }
	 */

	/*
	 * @RequestMapping("bbs/bbs_insert") public void insert(BbsVO bbsVO,
	 * HttpServletRequest request, MultipartFile file, Model model) throws Exception
	 * { String savedName = file.getOriginalFilename(); String uploadPath =
	 * request.getSession().getServletContext().getRealPath("resources/upload");
	 * File target = new File(uploadPath + "/" + savedName);
	 * file.transferTo(target);
	 * 
	 * model.addAttribute("savedName", savedName); System.out.println("img넣기 전>> " +
	 * bbsVO); bbsVO.setBbs_img(savedName); System.out.println("img넣은 후>> " +
	 * bbsVO);
	 * 
	 * dao.insert(bbsVO); }
	 */

	@RequestMapping("bbs/bbs_all")
	public void all(Model model) {
		List<BbsVO> list = dao.all();
		model.addAttribute("list", list);
	}

	@RequestMapping("bbs/bbs_search_name")
	public void name(BbsVO vo, Model model) {
		List<BbsVO> list = dao.list(vo);
		model.addAttribute("list", list);
	}

	@RequestMapping("bbs/bbs_search_title")
	public void title(BbsVO vo, Model model) {
		List<BbsVO> list = dao.list2(vo);
		model.addAttribute("list", list);
		
//		return "redirect:bbs_main.jsp";
	}


	@RequestMapping("bbs/bbs_insert")
	public String insert(BbsVO vo, Model model) {
		// 리뷰<--- movie(oriId, img)
		// insert into review values (null, #{oriId}, #{content}, #{writer})
		// 화면만들때는
		// review + movie(oriId, img)
	
		int result = dao.insert(vo);
		// BbsVO vo2 = dao.createdId();
		String text = "게시물 작성 성공";
			
		if (result != 1) {
			text = "게시물 작성 실패";
			return "redirect:bbs_insert.jsp";
		}
		model.addAttribute("result", text);
		// model.addAttribute("id", vo2.getBbs_Id());
		return "redirect:bbs_main.jsp";
	}
	
	@RequestMapping("bbs/bbs_contents")
	private void one(int bbs_Id, Model model) {
		BbsVO vo = dao.one(bbs_Id);
		model.addAttribute("vo",vo);
	}

	@RequestMapping("bbs/bbs_recommend")
	public void insert2(RecommendVO vo, Model model) {
		// 리뷰<--- movie(oriId, img)
		// insert into review values (null, #{oriId}, #{content}, #{writer})
		// 화면만들때는
		// review + movie(oriId, img)

		int list = dao.insert2(vo);
		model.addAttribute("list", list);
		// model.addAttribute("id", vo2.getBbs_Id());
	}
	
	@RequestMapping("bbs/bbs_recommend_count")
	public void recommend_count(RecommendVO vo , Model model) {
		// 리뷰<--- movie(oriId, img)
		// insert into review values (null, #{oriId}, #{content}, #{writer})
		// 화면만들때는
		// review + movie(oriId, img)

		int count = dao.recommend_count(vo);
		model.addAttribute("count", count);
		
		
		// model.addAttribute("id", vo2.getBbs_Id());
	}
	
	@RequestMapping("bbsDel")
	public void delete(BbsVO vo, Model model) {
		int result = dao.del(vo);
		model.addAttribute("result", result);
	}

	/*
	 * @RequestMapping("bbsUp") public void update(BbsVO vo, Model model) { //
	 * 수정하기버튼을 누르면, 기존의 db에 저장된 데이터를 // 가지고 와서, 수정할 수 있는 화면에 넣어주어야 한다. BbsVO vo2 =
	 * dao.one(vo); model.addAttribute("one", vo2); }
	 */

	@RequestMapping("bbsUp2")
	public String update2(BbsVO vo, Model model) {
		// 수정하고 싶은 것이 있으면 수정처리 요청.
		int result = dao.up(vo);
		if (result == 1) {
			return "bbsUp2";
		} else {
			return "no";
		}
	}
}

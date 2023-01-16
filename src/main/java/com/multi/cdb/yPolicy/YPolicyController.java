package com.multi.cdb.yPolicy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YPolicyController {

	@Autowired
	YPolicyServiceImpl yPolicyService;
	
	@Autowired
	PageService page;
		
	@Autowired
	GetYpDataMain getYpDataMain; // api 요청 클래스

	// api 요청 클래스
	@RequestMapping("yPolicy/getYpData")
	public void getData() {
		getYpDataMain.main(); 
	}
	
	@RequestMapping("yPolicy/yp_all")
	public void yp_all(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<YPolicyVO> list = yPolicyService.YpList(vo);
		int count = yPolicyService.count();
		int pages = page.pages(count);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}
	
	/*
	 * @RequestMapping("yPolicy/YpList") public void YpList(PageVO vo, Model model)
	 * { vo.setStartEnd(vo.getPage()); List<YPolicyVO> list =
	 * yPolicyService.YpList(vo); int count = yPolicyService.count(); int pages =
	 * page.pages(count); System.out.println(list); model.addAttribute("list",
	 * list); model.addAttribute("pages", pages); model.addAttribute("count",
	 * count); }
	 */
	
	@RequestMapping("yPolicy/YpList")
	public void list22(PageVO vo, Model model) {
		System.out.println("page값>> " + vo);
		vo.setStartEnd(vo.getPage());
		System.out.println("start/end값>> " + vo);
		List<YPolicyVO> list = yPolicyService.YpList(vo);
		System.out.println("list값>> " + list);
		model.addAttribute("list", list);
	}
	
	
	@RequestMapping("yPolicy/selectOne")
	public void selectOne(String YP_CATEGORY, Model model) {
		// System.out.println(YP_CATEGORY);
		List<YPolicyVO> list = yPolicyService.selectOne(YP_CATEGORY);
		System.out.println(list);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("yPolicy/search")
	public void search(YPolicyVO vo, Model model) {
		System.out.println(vo);
		List<YPolicyVO> list = yPolicyService.search(vo);
		System.out.println(list);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("yPolicy/detailOne")
	public void detailOne(YPolicyVO vo, Model model) {
		//System.out.println(YP_NAME);
		// 상세 페이지 클릭시 조회수 증가
		yPolicyService.viewCount(vo);
		List<YPolicyVO> list = yPolicyService.detailOne(vo.getYP_NAME());
		System.out.println(list);
		model.addAttribute("list", list);
	}

}

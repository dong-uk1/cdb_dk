package com.multi.cdb.house;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/house")
public class BorrowController {
	
	@Autowired
	BorrowService bo_service;
	
	
	// 쿼리 파라미터를 광역시로 요청함.
	@RequestMapping(value = "/rent_city", method = { RequestMethod.GET })
	@ResponseBody
	public Object sel_list(@RequestParam("br_brtc") String br_brtc) {
		List<BorrowVO> list = bo_service.city(br_brtc);
		return list;
	}

	// 쿼리 파라미터를 공고아이디와 광역시로 요청함.
	// 다중 파라미터라서 Map(HashMap)으로 받음. 
	@RequestMapping(value = "/rent_view", method= { RequestMethod.GET })
	public Object sel_list2(@RequestParam("br_pbid") String br_pbid, @RequestParam("br_brtc") String br_brtc, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("br_pbid", br_pbid);
		map.put("br_brtc", br_brtc);
		List<BorrowVO> list = bo_service.detail(map);
		model.addAttribute("list", list);
//		model.addAttribute("br_pbid",br_pbid);
//		model.addAttribute("br_brtc",br_brtc);
		return list;
	}
		
	// 전국 전체 데이터 조회
	@RequestMapping(value = "/rent_all", method = { RequestMethod.GET })
	@ResponseBody
	public Object all() {
		List<BorrowVO> list = bo_service.all();
		return list;
	}
	
	@RequestMapping(value= "/pageList", method= { RequestMethod.GET} )
	//@ResponseBody
	public Object pageList(PageVO vo, Model model, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) {
		int total = bo_service.count();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", bo_service.selectPage(vo));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", vo);
		map.put("viewAll", bo_service.selectPage(vo));
		//model.addAllAttributes(map);
		
		return "rent2";
	}
	
}

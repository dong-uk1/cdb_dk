package com.multi.cdb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
//@RequestMapping("/rent")
public class BorrowController {
	
	@Autowired
	BorrowDAO dao;
	
	// 요청 파라미터로 광역시와 시군구 파라미터로 요청
	@RequestMapping(value = "/h_rent", method = { RequestMethod.GET })
	@ResponseBody
	public Object sel_list(@RequestParam("br_brtc") String br_brtc) {
		List<BorrowVO> list = dao.sel_list(br_brtc);
		return list;
	}

	@RequestMapping(value = "/rent_list_id", method= { RequestMethod.GET })
	public Object sel_list2(@RequestParam("br_pbid") String br_pbid, Model model) {
		List<BorrowVO> list = dao.list_id(br_pbid);
		model.addAttribute("list", list);
		return list;
	}
		
	// 전체 데이터 조회
	@RequestMapping(value = "/rent_all", method = { RequestMethod.GET })
	@ResponseBody
	public Object all() {
		List<BorrowVO> list = dao.all();
		return list;
	}
	
	
	
}

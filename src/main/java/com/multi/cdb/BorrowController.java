package com.multi.cdb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rent")
public class BorrowController {
	
	@Autowired
	BorrowDAO dao;
	
	// 요청 파라미터로 광역시와 시군구 파라미터로 요청
	@RequestMapping("/search")
	public String sel_list(@RequestParam("br_brtc") String br_brtc, Model model) {
		List<BorrowVO> list = dao.sel_list(br_brtc);
		model.addAttribute("list", list);
		return "h_listView";
	}
	
	// 전체 데이터 조회
	@RequestMapping("/all")
	public String all(Model model) {
		List<BorrowVO> list = dao.all();
		model.addAttribute("list",list);
		return "h_listView";
	}
}

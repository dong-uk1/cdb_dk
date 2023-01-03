package com.multi.cdb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/sale")
public class BuyController {
	
	@Autowired
	BuyDAO dao;
	
	// 광역시도 코드로 파라미터 요청 후 검색
	@GetMapping("/search")
	public String sel_list(@RequestParam("by_brtc") String by_brtc, Model model) {
		List<BuyVO> list = dao.sel_list(by_brtc);
		model.addAttribute("list", list);
		return "h_sale";
	}
	
	@GetMapping("/all")
	public String all(Model model) {
		List<BuyVO> list = dao.all();
		model.addAttribute("list", list);
		return "h_sale";
	}
	
	
}

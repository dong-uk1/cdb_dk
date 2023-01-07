package com.multi.cdb.yPolicy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YPolicyController {

	@Autowired
	YPolicyServiceImpl yPolicyService;
	
	@Autowired
	GetYpDataMain getYpDataMain;

	@RequestMapping("getYpData")
	public void getData() {
		getYpDataMain.main();
	}
	
	@RequestMapping("YpList")
	public void YpList(Model model) {
		List<YPolicyVO> list = yPolicyService.list();
		System.out.println(list);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("selectOne")
	public void selectOne(Model model) {
	}
}

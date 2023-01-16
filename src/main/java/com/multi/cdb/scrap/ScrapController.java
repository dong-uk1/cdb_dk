package com.multi.cdb.scrap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScrapController {
	
	@Autowired
	ScrapService service;
	
	@RequestMapping("scrap/Scrap_Job")
	public void scraplist_Job(Model model) {
		List<ScrapVO> list = service.scrap_joblist();
		model.addAttribute("list", list);
	}
}

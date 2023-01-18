package com.multi.cdb.mainfunction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.cdb.bbs.NewsDAO;
import com.multi.cdb.bbs.NewsVO;

@Controller
public class NewsController {

	@Autowired
	NewsDAO newsService;

	@RequestMapping("newsList")
	public void list(Model model) {
		System.out.println();
		List<NewsVO> list = newsService.list();
		model.addAttribute("list", list);
	}


}

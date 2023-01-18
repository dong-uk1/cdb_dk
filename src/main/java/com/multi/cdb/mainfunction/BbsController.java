package com.multi.cdb.mainfunction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.cdb.bbs.BbsDAO;
import com.multi.cdb.bbs.BbsServiceInter;
import com.multi.cdb.bbs.BbsVO;


@Controller
public class BbsController {

	@Autowired
	BbsServiceInter bbsService;
	
	@Autowired
	BbsDAO dao;

	@RequestMapping("bbsList")
	public void list(Model model) {
		System.out.println();
		List<BbsVO> list = bbsService.list();
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("bbsfilter")
	public void filter(BbsVO vo, Model model) {
		List<BbsVO> list1 = dao.list1(vo);
		model.addAttribute("list1", list1);
		System.out.println(vo.getBbs_contents());
		
	}

}

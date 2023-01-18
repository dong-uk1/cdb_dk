package com.multi.cdb.mainfunction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.cdb.bbs.BbsService;
import com.multi.cdb.bbs.BbsVO;
import com.multi.cdb.yPolicy.YPolicyDAO;
import com.multi.cdb.yPolicy.YPolicyVO;


@Controller
public class YPolicyController {

	@Autowired
	YPolicyDAO dao;
	

	@RequestMapping("ypList")
	public void list(Model model) {
		System.out.println();
		List<YPolicyVO> list = dao.list();
		model.addAttribute("list", list);
	}
	

}

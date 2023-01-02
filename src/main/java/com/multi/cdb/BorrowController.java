package com.multi.cdb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BorrowController {
	
	// 요청 파라미터로 광역시와 시군구 파라미터로 요청
	@RequestMapping
	public void sel_list(@RequestParam String br_brtc, String br_signgu) {
		
	}
}

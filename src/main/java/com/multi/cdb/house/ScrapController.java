package com.multi.cdb.house;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/house")
public class ScrapController {
	
	@Autowired
	ScrapService2Interface service;
	
	@RequestMapping(value="/policy_scrap", method = RequestMethod.POST)
	public void policy(@RequestParam("title") String title, @RequestParam("url") String url) {
		service.policy_scrap(title, url);
	}
	
	@RequestMapping(value="/job_scrap", method = RequestMethod.POST)
	public void job(@RequestParam("title") String title, @RequestParam("url") String url) {
		service.job_scrap(title, url);
	}
	
	// 데이터를 넘겨주는 방식이 ajax일 경우 @ResponseBody 사용
	@RequestMapping(value="/rent_scrap", method = RequestMethod.POST)
	public @ResponseBody int rent(@RequestBody ScrapVO vo) {
		int scrap = service.rent_scrap_count(vo);
		System.out.println(vo);
		if(scrap == 0) {
			service.rent_scrap(vo);
		} else if(scrap == 1 ){
			service.rent_scrap_delete(vo);
		}
		return scrap;
	}
	
	// title, url을 넘겨주는 방식이 ajax일 경우 @ResponseBody 사용
//	@RequestMapping(value="/sale_scrap", method = RequestMethod.POST)
//	public @ResponseBody int sale(@RequestParam("title") String title, @RequestParam("url") String url, @RequestParam("scrap_member") String scrap_member) {
//		int scrap = service.rent_scrap_count(url, scrap_member);
//		
//		if(scrap == 0) {
//			service.sale_scrap(title, url, scrap_member);
//		} else if(scrap == 1) {
//			service.rent_scrap_delete(url, scrap_member);
//		}
//		return scrap;
//	}
	
	@RequestMapping(value="/sale_scrap", method = RequestMethod.POST)
	public void sale(@RequestBody ScrapVO vo) {
		System.out.println(vo.getScrap_title());
	}

}

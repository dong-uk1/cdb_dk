package com.multi.cdb.house;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/house")
public class ScrapController {
	
	@Autowired
	ScrapService2 service;
	
	@RequestMapping(value="/policy_scrap", method = RequestMethod.POST)
	public void policy(@RequestParam("title") String title, @RequestParam("url") String url) {
		service.policy_scrap(title, url);
	}
	
	@RequestMapping(value="/job_scrap", method = RequestMethod.POST)
	public void job(@RequestParam("title") String title, @RequestParam("url") String url) {
		service.job_scrap(title, url);
	}
	
	// title, url을 넘겨주는 방식이 ajax일 경우 @ResponseBody 사용
	@RequestMapping(value="/rent_scrap", method = RequestMethod.POST)
	public @ResponseBody void rent(@RequestParam("title") String title, @RequestParam("url") String url) {
		service.rent_scrap(title, url);
	}
	
	// title, url을 넘겨주는 방식이 ajax일 경우 @ResponseBody 사용
	@RequestMapping(value="/sale_scrap", method = RequestMethod.POST)
	public @ResponseBody void sale(@RequestParam("title") String title, @RequestParam("url") String url) {
		service.sale_scrap(title, url);
	}

}

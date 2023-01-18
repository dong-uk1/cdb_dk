package com.multi.cdb.job;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class JobController{
	@Autowired
	JobService service;
	@Autowired
	GetApiData getApiData; 
	@Autowired
	PageService page;
	
	@RequestMapping("insertApi")
	public void name() {
		getApiData.main();

	}
	
	@RequestMapping("one")
	public void one(String job_wantedAuthNo, Model model) {
		List<JobVO> list = service.one(job_wantedAuthNo);
		System.out.println(list);
		model.addAttribute("list", list);
	}
	

	@GetMapping("recruitList") //첫페이지용 + 페이지 리스트
	public String recruitList(Criteria cri, Model model) {

		 System.out.println("list : " + cri.getPageNum()); 
		
		 //특정한 페이지를 DB에서 목록을 가지고 온다.
		 List<JobVO> list =service.getJobByCri(cri); 
		 
		 //페이지 시작, 끝, 중간페이지 목록 
		 List<JobVO> allList = service.getAllList(); 
		 int totalCount = allList.size(); 
		 //System.out.println("totalCount : " +  totalCount); 
		 PageVO pageVO = new PageVO(cri, totalCount);
		  
		 model.addAttribute("list", list); 
		 model.addAttribute("pageMaker", pageVO);
		 
		 return "recruitList";
	}
	
	
	 
	/*
	 * @GetMapping("recruitList") //첫페이지용 + 페이지 리스트 public void recruitList(Criteria
	 * cri, Model model) {
	 * 
	 * System.out.println("list : " + cri.getPageNum());
	 * 
	 * //특정한 페이지를 DB에서 목록을 가지고 온다. List<JobVO> list =service.getJobByCri(cri);
	 * 
	 * //페이지 시작, 끝, 중간페이지 목록 List<JobVO> allList = service.getAllList(); int
	 * totalCount = allList.size(); //System.out.println("totalCount : " +
	 * totalCount); PageVO pageVO = new PageVO(cri, totalCount);
	 * 
	 * model.addAttribute("list", list); model.addAttribute("pageMaker", pageVO); }
	 */
	
	@GetMapping("jobList") //각 페이지리스트(ajax)
	public void rList(Criteria cri, Model model) {
		
		System.out.println("list : " + cri.getPageNum()); 
		
		List<JobVO> list =service.getJobByCri(cri); 
		//List<JobVO> allList = service.getAllList(); 
		model.addAttribute("list", list); 
	}
	
}

package com.multi.cdb.job;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class JobService implements JobServiceInterface {

	@Autowired
	JobDAO dao;

	@Override
	public void insert(JobVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(JobVO vo) {

	}

	@Override
	public List<JobVO> one(String job_wantedAuthNo) {
		return dao.one(job_wantedAuthNo);
	}

	@Override
	public List<JobVO> getAllList() {
		return dao.all();
	}
	
	
	@Override
	public List<JobVO> getJobByCri(Criteria cri){
		int startRow = (cri.getPageNum() - 1) * cri.getAmount();
		cri.setStartRow(startRow);
		
		return dao.getJobByCri(cri);
	}

	@Override
	public List<JobVO> all() {
		// TODO Auto-generated method stub
		return null;
	}


}

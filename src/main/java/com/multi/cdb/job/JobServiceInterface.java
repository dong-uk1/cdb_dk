package com.multi.cdb.job;

import java.util.List;

import org.springframework.ui.Model;

public interface JobServiceInterface {

	public void insert(JobVO vo);

	public void update(JobVO vo);
	
	public List<JobVO> one(String job_wantedAuthNo);
	
	//������ ���� ��ü����Ʈ
	public List<JobVO> all();
	
	
	public List<JobVO> getAllList();

	public List<JobVO> getJobByCri(Criteria cri);

	
}

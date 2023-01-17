package com.multi.cdb.job;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class JobDAO implements JobDAOInterface{

	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public void insert(JobVO vo) {
		my.insert("job.insert", vo);
	}
	

	@Override
	public void update(JobVO vo) {

	}
	
	@Override
	public List<JobVO> one(String job_wantedAuthNo) {
		return my.selectList("job.one", job_wantedAuthNo); 
	}

	
	@Override	
	public List<JobVO> all() {
		return my.selectList("job.all");
	}


	@Override	//페이징
	public List<JobVO> getJobByCri(Criteria cri) {
		return my.selectList("job.getJobByCri", cri);
	}


	@Override
	public List<JobVO> all2(PageVO vo) {
		// TODO Auto-generated method stub
		return null;
	}


}

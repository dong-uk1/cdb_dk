package com.multi.cdb.job;

import java.util.List;

public interface Interface {

	// ����
	void insert(JobVO vo);

	// ����
	void update(JobVO vo);

	// �󼼰˻�
	List<JobVO> one(String job_wantedAuthNo);

	//������ ���� ��ü ����Ʈ
	List<JobVO> all();

	List<JobVO> all2(PageVO vo);

	List<JobVO> getJobByCri(Criteria cri);

}
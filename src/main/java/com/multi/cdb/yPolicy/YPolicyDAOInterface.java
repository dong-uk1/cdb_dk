package com.multi.cdb.yPolicy;

import java.util.List;

public interface YPolicyDAOInterface {
	// 삽입
	public void insert(YPolicyVO vo);
	
	// 수정
	public void update(YPolicyVO vo);
	
	// 상세검색
	public YPolicyVO one(String YP_NAME, String CATEGORY, String YP_REGION);
	
	// 전체 리스트
	public List<YPolicyVO> list();

}

package com.multi.cdb.yPolicy;

import java.util.List;

public interface YPolicyServiceInterface {
	// 삽입
	public void insert(YPolicyVO vo);

	// 전체 정책 목록
	public List<YPolicyVO> list();

	// 수정 
	public void update(YPolicyVO vo);

	// 상세검색
	public YPolicyVO search(String YP_NAME, String CATEGORY, String YP_REGION);

	
	// 유형별 리스트
	public List<YPolicyVO> selectOne();
}

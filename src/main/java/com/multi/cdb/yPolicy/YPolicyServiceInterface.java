package com.multi.cdb.yPolicy;

import java.util.List;

public interface YPolicyServiceInterface {
	// 삽입
	public void insert(YPolicyVO vo);

	// 전체 정책 목록
	public List<YPolicyVO> YpList();

	// 상세검색
	public List<YPolicyVO> search(YPolicyVO vo);

	// 유형별 리스트
	public List<YPolicyVO> selectOne(String YP_CATEGORY);

	// 정책상세페이지
	public List<YPolicyVO> detailOne(String YP_NAME);

	// 조회수 증가
	public void viewCount(YPolicyVO vo);
}

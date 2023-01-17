package com.multi.cdb.job;

import java.sql.Date;

public class JobVO {

	private String job_wantedAuthNo; // 구인인증번호
	private String job_company; // 회사명
	private String job_title; // 채용제목
	private String job_salTpNm; // 임금형태
	private String job_sal; // 급여
	private int job_minSal; // 최소임금액
	private int job_maxSal; // 최대임금액
	private String job_region; // 근무지역
	private String job_holidayTpNm; // 근무형태
	private String job_minEdubg; // 최소학력

	private String job_career; // 경력
	private String job_regDt; // 등록일자
	private String job_closeDt; // 마감일자
//	private Date job_regDt; // 등록일자
//	private Date job_closeDt; // 마감일자
	private String job_wantedInfoUrl; // 워크넷 채용정보 URL

	private String job_wantedMobileInfoUrl; // 워크넷 모바일 채용정보 URL
	private int job_zipCd; // 근무지 우편번호
	private int job_strtnmCd; // 근무지 도로명주소
	private String job_basicAddr; // 근무지 기본주소

//	private String job_detailAddr; // 근무지 상세주소
	private int job_empTpCd; // 고용형태코드
	private int job_jobsCd; // 직종코드
	private String job_prefCd; // 우대조건
	
	public JobVO() {}
	public JobVO(String job_wantedAuthNo2, String job_company2, String job_title2, String job_salTpNm2, String job_sal2,
			int job_minSal2, int job_maxSal2, String job_region2, String job_holidayTpNm2, String job_minEdubg2,
			String job_career2, String job_regDt2, String job_closeDt2, String job_wantedInfoUrl2,
			String job_wantedMobileInfoUrl2, int job_zipCd2, int job_strtnmCd2, String job_basicAddr2,
			int job_empTpCd2, int job_jobsCd2, String job_prefCd2) {
		job_wantedAuthNo = job_wantedAuthNo2;
		job_company = job_company2;
		job_title = job_title2;
		job_salTpNm = job_salTpNm2;
		job_sal = job_sal2;
		job_minSal = job_minSal2;
		job_maxSal = job_maxSal2;
		job_region = job_region2;
		job_holidayTpNm = job_holidayTpNm2;
		job_minEdubg = job_minEdubg2;
		job_career = job_career2;
		job_regDt = job_regDt2;
		job_closeDt = job_closeDt2;
		job_wantedInfoUrl = job_wantedInfoUrl2;
		job_wantedMobileInfoUrl = job_wantedMobileInfoUrl2;
		job_zipCd = job_zipCd2;
		job_strtnmCd = job_strtnmCd2;
		job_basicAddr = job_basicAddr2;
//		job_detailAddr = job_detailAddr2;
		job_empTpCd = job_empTpCd2;
		job_jobsCd = job_jobsCd2;
		job_prefCd = job_prefCd2;
		
	}

	public String getJob_wantedAuthNo() {
		return job_wantedAuthNo;
	}

	public void setJob_wantedAuthNo(String job_wantedAuthNo) {
		this.job_wantedAuthNo = job_wantedAuthNo;
	}

	public String getJob_company() {
		return job_company;
	}

	public void setJob_company(String job_company) {
		this.job_company = job_company;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getJob_salTpNm() {
		return job_salTpNm;
	}

	public void setJob_salTpNm(String job_salTpNm) {
		this.job_salTpNm = job_salTpNm;
	}

	public String getJob_sal() {
		return job_sal;
	}

	public void setJob_sal(String job_sal) {
		this.job_sal = job_sal;
	}

	public int getJob_minSal() {
		return job_minSal;
	}

	public void setJob_minSal(int job_minSal) {
		this.job_minSal = job_minSal;
	}

	public int getJob_maxSal() {
		return job_maxSal;
	}

	public void setJob_maxSal(int job_maxSal) {
		this.job_maxSal = job_maxSal;
	}

	public String getJob_region() {
		return job_region;
	}

	public void setJob_region(String job_region) {
		this.job_region = job_region;
	}

	public String getJob_holidayTpNm() {
		return job_holidayTpNm;
	}

	public void setJob_holidayTpNm(String job_holidayTpNm) {
		this.job_holidayTpNm = job_holidayTpNm;
	}

	public String getJob_minEdubg() {
		return job_minEdubg;
	}

	public void setJob_minEdubg(String job_minEdubg) {
		this.job_minEdubg = job_minEdubg;
	}

	public String getJob_career() {
		return job_career;
	}

	public void setJob_career(String job_career) {
		this.job_career = job_career;
	}

	public String getJob_regDt() {
		return job_regDt;
	}

	public void setJob_regDt(String job_regDt) {
		this.job_regDt = job_regDt;
	}

	public String getJob_closeDt() {
		return job_closeDt;
	}

	public void setJob_closeDt(String job_closeDt) {
		this.job_closeDt = job_closeDt;
	}

	public String getJob_wantedInfoUrl() {
		return job_wantedInfoUrl;
	}

	public void setJob_wantedInfoUrl(String job_wantedInfoUrl) {
		this.job_wantedInfoUrl = job_wantedInfoUrl;
	}

	public String getJob_wantedMobileInfoUrl() {
		return job_wantedMobileInfoUrl;
	}

	public void setJob_wantedMobileInfoUrl(String job_wantedMobileInfoUrl) {
		this.job_wantedMobileInfoUrl = job_wantedMobileInfoUrl;
	}

	public int getJob_zipCd() {
		return job_zipCd;
	}

	public void setJob_zipCd(int job_zipCd) {
		this.job_zipCd = job_zipCd;
	}

	public int getJob_strtnmCd() {
		return job_strtnmCd;
	}

	public void setJob_strtnmCd(int job_strtnmCd) {
		this.job_strtnmCd = job_strtnmCd;
	}

	public String getJob_basicAddr() {
		return job_basicAddr;
	}

	public void setJob_basicAddr(String job_basicAddr) {
		this.job_basicAddr = job_basicAddr;
	}

	/*
	 * public String getJob_detailAddr() { return job_detailAddr; }
	 * 
	 * public void setJob_detailAddr(String job_detailAddr) { this.job_detailAddr =
	 * job_detailAddr; }
	 */

	public int getJob_empTpCd() {
		return job_empTpCd;
	}

	public void setJob_empTpCd(int job_empTpCd) {
		this.job_empTpCd = job_empTpCd;
	}

	public int getJob_jobsCd() {
		return job_jobsCd;
	}

	public void setJob_jobsCd(int job_jobsCd) {
		this.job_jobsCd = job_jobsCd;
	}

	public String getJob_prefCd() {
		return job_prefCd;
	}

	public void setJob_prefCd(String job_prefCd) {
		this.job_prefCd = job_prefCd;
	}

	@Override
	public String toString() {
		return "JobVO [job_wantedAuthNo=" + job_wantedAuthNo + ", job_company=" + job_company + ", job_title="
				+ job_title + ", job_salTpNm=" + job_salTpNm + ", job_sal=" + job_sal + ", job_minSal=" + job_minSal
				+ ", job_maxSal=" + job_maxSal + ", job_region=" + job_region + ", job_holidayTpNm=" + job_holidayTpNm
				+ ", job_minEdubg=" + job_minEdubg + ", job_career=" + job_career + ", job_regDt=" + job_regDt
				+ ", job_closeDt=" + job_closeDt + ", job_wantedInfoUrl=" + job_wantedInfoUrl
				+ ", job_wantedMobileInfoUrl=" + job_wantedMobileInfoUrl + ", job_zipCd=" + job_zipCd
				+ ", job_strtnmCd=" + job_strtnmCd + ", job_basicAddr=" + job_basicAddr + ", job_detailAddr="
				+ ", job_empTpCd=" + job_empTpCd + ", job_jobsCd=" + job_jobsCd + ", job_prefCd="
				+ job_prefCd + "]";
	}
	/*
	 * @Override public String toString() { return "JobVO [job_wantedAuthNo=" +
	 * job_wantedAuthNo + ", job_company=" + job_company + ", job_title=" +
	 * job_title + ", job_salTpNm=" + job_salTpNm + ", job_sal=" + job_sal +
	 * ", job_minSal=" + job_minSal + ", job_maxSal=" + job_maxSal + ", job_region="
	 * + job_region + ", job_holidayTpNm=" + job_holidayTpNm + ", job_minEdubg=" +
	 * job_minEdubg + ", job_career=" + job_career + ", job_regDt=" + job_regDt +
	 * ", job_closeDt=" + job_closeDt + ", job_wantedInfoUrl=" + job_wantedInfoUrl +
	 * ", job_wantedMobileInfoUrl=" + job_wantedMobileInfoUrl + ", job_zipCd=" +
	 * job_zipCd + ", job_strtnmCd=" + job_strtnmCd + ", job_basicAddr=" +
	 * job_basicAddr + ", job_detailAddr=" + job_detailAddr + ", job_empTpCd=" +
	 * job_empTpCd + ", job_jobsCd=" + job_jobsCd + ", job_prefCd=" + job_prefCd +
	 * "]"; }
	 */
	
}

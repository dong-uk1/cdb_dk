package com.multi.cdb.yPolicy;

public class YPolicyVO {
	private String YP_ID; // 정책아이디
	private String YP_NAME; // 정책명
	private String YP_PI; // 기관 및 지자체 구분
	private String YP_INFO; // 정책소개
	private String YP_CATEGORY; // 정책유형
	private String YP_SSIZE; // 지원규모
	private String YP_CONTENT; // 지원내용
	private String YP_RQMAGE; // 참여요건 - 연령
	private String YP_RQMJOB; // 참여요건 - 취업상태
	private String YP_RQMEDU; // 참여요건 - 학력
	private String YP_RQMMAJR; // 참여요건 - 전공
	private String YP_RQMFIELD; // 참여요건 - 특화분야
	private String YP_AI; // 신청기관
	private String YP_PERIOD; // 신청기간
	private String YP_PROCEDURE; // 신청절차
	private String YP_ANM; // 심사발표
	private String YP_URL; // 사이트 링크 주소
	private String YP_REGION; // 지역명
	private int YP_VIEW; // 정책 상세 페이지 조회수
	
	
	public String getYP_ID() {
		return YP_ID;
	}
	public void setYP_ID(String yP_ID) {
		YP_ID = yP_ID;
	}
	public String getYP_NAME() {
		return YP_NAME;
	}
	public void setYP_NAME(String yP_NAME) {
		YP_NAME = yP_NAME;
	}
	public String getYP_PI() {
		return YP_PI;
	}
	public void setYP_PI(String yP_PI) {
		YP_PI = yP_PI;
	}
	public String getYP_INFO() {
		return YP_INFO;
	}
	public void setYP_INFO(String yP_INFO) {
		YP_INFO = yP_INFO;
	}
	public String getYP_CATEGORY() {
		return YP_CATEGORY;
	}
	public void setYP_CATEGORY(String yP_CATEGORY) {
		YP_CATEGORY = yP_CATEGORY;
	}
	public String getYP_SSIZE() {
		return YP_SSIZE;
	}
	public void setYP_SSIZE(String yP_SSIZE) {
		YP_SSIZE = yP_SSIZE;
	}
	public String getYP_CONTENT() {
		return YP_CONTENT;
	}
	public void setYP_CONTENT(String yP_CONTENT) {
		YP_CONTENT = yP_CONTENT;
	}
	public String getYP_RQMAGE() {
		return YP_RQMAGE;
	}
	public void setYP_RQMAGE(String yP_RQMAGE) {
		YP_RQMAGE = yP_RQMAGE;
	}
	public String getYP_RQMJOB() {
		return YP_RQMJOB;
	}
	public void setYP_RQMJOB(String yP_RQMJOB) {
		YP_RQMJOB = yP_RQMJOB;
	}
	public String getYP_RQMEDU() {
		return YP_RQMEDU;
	}
	public void setYP_RQMEDU(String yP_RQMEDU) {
		YP_RQMEDU = yP_RQMEDU;
	}
	public String getYP_RQMMAJR() {
		return YP_RQMMAJR;
	}
	public void setYP_RQMMAJR(String yP_RQMMAJR) {
		YP_RQMMAJR = yP_RQMMAJR;
	}
	public String getYP_RQMFIELD() {
		return YP_RQMFIELD;
	}
	public void setYP_RQMFIELD(String yP_RQMFIELD) {
		YP_RQMFIELD = yP_RQMFIELD;
	}
	public String getYP_AI() {
		return YP_AI;
	}
	public void setYP_AI(String yP_AI) {
		YP_AI = yP_AI;
	}
	public String getYP_PERIOD() {
		return YP_PERIOD;
	}
	public void setYP_PERIOD(String yP_PERIOD) {
		YP_PERIOD = yP_PERIOD;
	}
	public String getYP_PROCEDURE() {
		return YP_PROCEDURE;
	}
	public void setYP_PROCEDURE(String yP_PROCEDURE) {
		YP_PROCEDURE = yP_PROCEDURE;
	}
	public String getYP_ANM() {
		return YP_ANM;
	}
	public void setYP_ANM(String yP_ANM) {
		YP_ANM = yP_ANM;
	}
	public String getYP_URL() {
		return YP_URL;
	}
	public void setYP_URL(String yP_URL) {
		YP_URL = yP_URL;
	}
	public String getYP_REGION() {
		return YP_REGION;
	}
	
	public void setYP_REGION(String yP_REGION) {
		YP_REGION = yP_REGION;
	}
	
	public int getYP_VIEW() {
		return YP_VIEW;
	}
	public void setYP_VIEW(int yP_VIEW) {
		YP_VIEW = yP_VIEW;
	}
	
	@Override
	public String toString() {
		return "YPolicyVO [YP_ID=" + YP_ID + ", YP_NAME=" + YP_NAME + ", YP_PI=" + YP_PI + ", YP_INFO=" + YP_INFO
				+ ", YP_CATEGORY=" + YP_CATEGORY + ", YP_SSIZE=" + YP_SSIZE + ", YP_CONTENT=" + YP_CONTENT
				+ ", YP_RQMAGE=" + YP_RQMAGE + ", YP_RQMJOB=" + YP_RQMJOB + ", YP_RQMEDU=" + YP_RQMEDU + ", YP_RQMMAJR="
				+ YP_RQMMAJR + ", YP_RQMFIELD=" + YP_RQMFIELD + ", YP_AI=" + YP_AI + ", YP_PERIOD=" + YP_PERIOD
				+ ", YP_PROCEDURE=" + YP_PROCEDURE + ", YP_ANM=" + YP_ANM + ", YP_URL=" + YP_URL + ", YP_REGION="
				+ YP_REGION + ", YP_VIEW=" + YP_VIEW + "]";
	}
}
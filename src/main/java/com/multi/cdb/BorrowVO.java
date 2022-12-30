package com.multi.cdb;
import java.util.Date;

import lombok.Data;


@Data
public class BorrowVO {
	private String br_pbid; // 공고 ID
	private String br_state; // 공고 상태명
	private String br_pbname; // 공고명
	private String br_suplyint; // 공급 기관명
	private String br_housetype; // 주택유형명
	private String br_suplytype; // 공급 유형명
	private Date br_recrude;  // 모집공고일자
	private Date br_winannde; // 당첨자발표일자
	private String br_url; // 모집공고 URL
	private String br_brtc; // 광역시도명
	private String br_signgu; // 시군구명
	private String br_fulladdr; // 전체주소
	private String br_hsmp; // 단지명
	private int br_totalhshold; // 총세대수
	private int br_sumsuplyco; // 공급호수 (모집호수)
	private int br_rentgtn; // 최소임대보증금
	private int br_entity; // 최소 계약금
	private int br_prtpay; // 최소 중도금
	private int br_surlus; // 최소 잔금
	private int br_mothrent; // 최소월임대료
	private Date br_beginde; // 모집 시작 일자
	private Date br_end; // 모집 종료 일자
	private String br_refrnc; // 문의처
}
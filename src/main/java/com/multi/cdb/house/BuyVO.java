package com.multi.cdb.house;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BuyVO {
	private int by_sequence; // 일련번호 pk
	private String by_pbid; // 공고 id
	private int by_housesn; // 단지 시리얼번호(단지 정보가 여러개일경우 구분을 위함)
	private String by_state; // 공고 상태명
	private String by_pbname; // 공고명
	private String by_suplyint; // 공급 기관명
	private String by_housetype; // 주택 유형명
	private Date by_recrude; // 모집공고일자
	private Date by_winannde; // 당첨자발표일자
	private String by_url; // 모집공고 URL
	private String by_brtc; // 광역시도명
	private String by_signgu; // 시군구명
	private String by_fulladdr; // 전체 주소
	private String by_hsmp; // 단지명
	private int by_sumsuplyco; // 공급 호수
	private int by_entity; // 최소 계약금
	private int by_prtpay; // 최소 중도금
	private int by_surlus; // 최소 잔금
	private Date by_beginde; // 모집 시작 일자
	private Date by_end; // 모집 종료 일자
	private String by_refer; // 문의

}
package com.multi.cdb.job;

import java.util.Set;

public class Criteria {
	private int pageNum; // 페이지번호
	private int amount; // 한 페이지당 글 개수

	private int startRow; // 가져올 글의 행 번호

	private String type = ""; // 검색 유형
	private String keyword = ""; // 검색어

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
}

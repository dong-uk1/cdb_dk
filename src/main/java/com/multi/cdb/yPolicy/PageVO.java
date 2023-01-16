package com.multi.cdb.yPolicy;

public class PageVO {
	public static final int BLOCK_SCALE = 10; // 화면당 페이지 수
	private int start;
	private int end;
	private int page; // 페이지
	
	public void setStartEnd(int page) {
		start = 1 + (page - 1) * 30;
		end = page * 30;
	}
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getStart() {
		return start;
	}
	
	public void setStart(int start) {
		this.start = start;
	}
	
	public int getEnd() {
		return end;
	}
	
	public void setEnd(int end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "PageVO [start=" + start + ", end=" + end + ", page=" + page + "]";
	}
}
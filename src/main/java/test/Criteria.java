package test;


public class Criteria {
	private int pageNum;	//페이지번호
	private int amount;	//한 페이지당 글 개수

	private int startNow;	//가져올 글의 행 번호
	
	private String type = "";	//검색 유형
	private String keyword ="";	//검색어
	
	public int getPageNum() {
		return pageNum;
	}
	public int getAmount() {
		return amount;
	}
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
}

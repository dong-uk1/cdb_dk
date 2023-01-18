package test;

public class PageDTO {
	private int startPage; //페이징 블럭 안에서의 시작페이지
	private int endPage;	//페이징 블럭 안에서의 끝페이지
	private boolean pre; //이전페이지 유무
	private boolean next; //다음페이지 유무

	private final int PAGE_BLOCK = 5; //페이지블록 구성하는 최대 개수
	
	private int totalCount;	//전체 글 개수
	private Criteria cri; //요청 페이지 번호, 한 페이지 당 글 개수
	
	public PageDTO(Criteria cri, int totalCount) {
		this.cri = cri;
		this.totalCount = totalCount;
		
		//ceil = 올림
		// 나눗셈을 한 후 올림을 하는 이유는 1 ~ 5 페이지 중에 어느 번호를 요청해도 항상 끝 페이지를 5로 맞춰주기 위함이다.
		// 2/5 = 0.4 -> 0.4(double)를 올리면 (ceil) 1 -> 1*5 = 5 => 끝 페이지는 5
		// 4/5 = 0.8 -> 0.8(double)를 올리면 (ceil) 1 -> 1*5 = 5 => 끝 페이지는 5
		//6~10 페이지 요청시 끝페이지는 10으로 바뀜
		endPage = (int)Math.ceil((double)cri.getPageNum() / PAGE_BLOCK);
		
		//endPage가 5일 경우
		//startPage =  5    - (    5      - 1) = 1
		//startPage =  10    - (   5      - 1) = 6
		startPage = endPage - (PAGE_BLOCK - 1);
		
		//멘 마지막 페이지가 PAGE_BLOCK 보다 작을 경우
		//총 페이지가 32일 경우
		//totalCont(32) / cri.getAmount(10) 3.2 -> 올림하면 4 => realEnd=4    		 
		int realEnd = (int)Math.ceil((double) totalCount / cri.getAmount());
		//		4 < 5  		=> endPage = 4
		if(realEnd < endPage) {
			endPage = realEnd;
		}
		
		//이전
		pre = startPage > 1;
		//다음
		next = endPage < realEnd; 
	}
	



}

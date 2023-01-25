package kr.board.entity;

import lombok.Data;

//페이징 처리를 만드는 클래스 vo
@Data
public class PageMaker {
	
	private  Criteria cri;
	private int totalCount; // 총게시글의수
	
	private int startPage; // 시작페이지번호
	private int endPage;  //끝페이지번호는 딱떨어지지않을수있기때문에 조정이필요하다.
	
	private boolean prev; //이전버튼을 (true,false) 만들것인지의 여부
	private boolean next; // 다음버튼(true,false)
	private int displayPageNum = 10; //화면에 페이지를 몇개씩보여줄것인가.
	
	
	//1번 총게시글의 수를 구하는 메서드
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		makePaging();
	}


	private void makePaging() {
		// 1. 화면에 보여질 마지막 페이지번호
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum); // 
		
		// 2. 화면에 보여질 시작페이지번호
		startPage = endPage - displayPageNum + 1;
		
		if(startPage <= 0) startPage=1;
		
		// 3.전체 마지막 페이지 실제계산
		int tempEndPage = (int)Math.ceil(totalCount / (double)cri.getPerPageNum()); ///페이지를 일자로쫙나열했을때페이지
		
		// 4 화면에 보여질 마지막 페이지 유효성체크
		if(tempEndPage < endPage) {
			endPage = tempEndPage;
		}
		// 이전페이지 버튼 존재여부
		prev = (startPage==1) ? false : true;
		
		// 다음페이지 버튼 존재여부
		next = (endPage < tempEndPage) ? true : false;
	}
}

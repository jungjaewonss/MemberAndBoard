package kr.board.entity;

import lombok.Data;

@Data
public class Criteria {
	
	private int page; //현재내가있는페이지
	private int perPageNum; // 한페이지에 보여줄 게시글의수 
	
	public Criteria() {
		//생성자를통해 생성시 바로 첫페이지 
		this.page = 1;
		this.perPageNum = 10; // 한페이지에 10개씩보여줄것
	}
	
	// 현재 페이지의 글의 게시글의 시작번호를구해보자
	public int getPageStart() {  //: limit 0,9 (0 1 2 3 4 5 6 7 8 9 10) 10개를가져와라  
		return (page-1) * perPageNum+1;
	}
}

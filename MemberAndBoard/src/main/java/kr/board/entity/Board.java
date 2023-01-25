package kr.board.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@data - lombok api 가있어야사용가능
@Getter
@Setter
@ToString
public class Board {

	private int idx;
	private String memId;
	private String title; //제목
	private String content; // 내용
	private String writer; // 작성자
	private String indate; //작성일
	private int count; //조회수
	
	
	
	

}

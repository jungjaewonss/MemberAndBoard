package kr.board.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.board.entity.Board;
import kr.board.entity.Criteria;

//@mapper - mybatis api
@Mapper
public interface BoardMapper {
	
	public List<Board> getList(); //전체리스트를가지고오는메소드
	public int insertBoard(Board board);
	
	public Board getDetailBoard(int idx);
	public void BoardModify(Board board);
	public void BoardDelete(int idx);
	public void addCount(Board board);
	public int totalCount();
}

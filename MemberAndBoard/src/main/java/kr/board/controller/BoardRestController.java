package kr.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@RequestMapping("/board")
@RestController //@(ResponseBody) JSON 응답
public class BoardRestController {
	@Autowired
	BoardMapper boardMapper;
	
	// jackson-databind (객체를 -> json 데이터포멧으로 변환)

	@GetMapping("/all")
	public List<Board> boardList(){
		List<Board> list = boardMapper.getList();
				
		return list ; //json 데이터 형식으로 변환(api)해서 리턴하겠다.
	}
	
	@PostMapping("/new")
	public void boardInsert(Board board) {
		boardMapper.insertBoard(board);		
	}
	
	@GetMapping("/{idx}")
	public Board detailBoard(@PathVariable("idx") int idx) {
		Board board = boardMapper.getDetailBoard(idx);
		System.out.println("123123" + idx);
		return board;
	}
	
	@DeleteMapping("/{idx}")
	public void deleteBoard(@PathVariable("idx") int idx) {
		System.out.println("=============" + idx);
		boardMapper.BoardDelete(idx);
	}
	
	@PutMapping("/update")
	public void updateBoard(@RequestBody Board board) {
		System.out.println(board.getIdx());
		System.out.println(board.getTitle());
		System.out.println(board.getContent());
		
		boardMapper.BoardModify(board);
	}
	@PutMapping("/count/{idx}")
	public void addCount(@PathVariable("idx") int idx) {
		Board board = boardMapper.getDetailBoard(idx);
		boardMapper.addCount(board);
	}
	
	@GetMapping
	public Board checkMyBoard(int idx) {
		Board board = boardMapper.getDetailBoard(idx);
		
		return board;
	}
}

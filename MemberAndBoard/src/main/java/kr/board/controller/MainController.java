package kr.board.controller;

import java.lang.reflect.Member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	

}

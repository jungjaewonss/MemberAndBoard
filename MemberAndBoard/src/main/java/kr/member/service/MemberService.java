package kr.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.board.entity.Member;
import kr.board.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired
	private MemberMapper membermapper;
	
	//로그인처리 로직
	public Member MemLogin(Member member , HttpSession session) {				
			Member LoginMember = membermapper.goLogin(member);
			
			return LoginMember;				
	}
	
}

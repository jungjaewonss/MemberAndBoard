package kr.board.controller;



import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.board.entity.Member;
import kr.board.mapper.MemberMapper;
import kr.member.service.MemberService;
@Controller
public class MemberController {
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberService memService;
	
	@GetMapping("/memJoin")
	public String memJoin() {
		return "Member/join";
	}
	
	@ResponseBody
	@GetMapping("/overlapCheck")
	public int overlapCheck(String id) {
		Member member = memberMapper.overlapCheck(id);
		
		
		
		
		if(member == null) {
			return 0;
		}
					
		return 1;
	}
	
	//회원가입 처리
	@PostMapping("/memberJoin")
	public String memberJoin(Member member , RedirectAttributes rttr , HttpSession session) {
		
		System.out.println(member);
		
		member.setMemProfile("");
		int result = memberMapper.joinMember(member);
		
		if(result > 0) {
		 rttr.addFlashAttribute("msg", "회원가입성공");
		
		 session.setAttribute("mvo", member);
		 	return "redirect:/";
		}
	
		return"Member/join";
	}
	
	//로그아웃처리
	@GetMapping("/memLogout")
	public String memLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	//로그인 화면으로 이동
	@GetMapping("/memLoginForm")
	public String MemLoginForm() {
		return "Member/memLoginForm";
	}
	
	//로그인처리
	@PostMapping("/memLogin")
	public String memLogin(Member member , HttpSession session , RedirectAttributes rttr) {
		Member loginMember =  memService.MemLogin(member, session);	
		
		if(loginMember != null) {
			session.setAttribute("mvo", loginMember);
			rttr.addFlashAttribute("msg", "로그인성공");
			return "redirect:/";
		}
		else {
			rttr.addFlashAttribute("msg", "로그인실패");
			return "redirect:/memLoginForm";
		}
	}
	
	
	//회원정보수정화면이동
	@GetMapping("/memUpdateForm")
	public String memUpdateForm() {
		return "Member/memUpdateForm";
	}
	
	//회원정보수정
	@PostMapping("/memberUpdate")
	public String memberUpdate(Member member , String memPassword0, String memPassword1, String memPassword2, RedirectAttributes rttr, HttpSession session) {
		System.out.println(member.getMemPassword());
		System.out.println(memPassword0);
		System.out.println(memPassword1);
		System.out.println(memPassword2);
		
		
		if(member.getMemPassword().equals(memPassword0)) {
			member.setMemPassword(memPassword2);
			int result = memberMapper.updateMember(member);
			
			System.out.println("result :" + result);
			
			if(result > 0) {
				rttr.addFlashAttribute("msg", "회원수정이완료되었습니다.");
				session.setAttribute("mvo", member);
				return "redirect:/";
				
			}
			else {
				rttr.addFlashAttribute("msg", "회원수정이실패하였습니다.");
				return "redirect:/memUpdateForm";
			}
		}
		else {
			rttr.addFlashAttribute("msg", "현재비밀번호가일치하지않습니다.");
			return "redirect:/memUpdateForm";
		}
		
		
	}
	// 이미지폼으로 이동
	@GetMapping("/memImgForm")
	public String memImgForm() {
		return "Member/memImgForm";
	}
	
	//회원사진 이미지 업로드 (upload , db 파일이름저장)
	@PostMapping("/memImgUpdate")
	public String memImgUpdate(HttpServletRequest request , RedirectAttributes rttr, HttpSession session)  {
		//파일 업로드 API(cos.jar, 3가지정도)
		MultipartRequest  multi = null;
		
		int fileMaxSize = 10  * 1024 * 1024; //10MB
		String savePath = request.getRealPath("resources/upload");
		System.out.println(savePath + "savepath");
		
			// 1.png 1_1.png 이런식으로 중복되는값이들어오면 이름변경해서들어가게해주는클래스 DefaultFileRenamePlicy()
		try {	
		multi = new MultipartRequest(request, savePath , fileMaxSize ,"UTF-8", new DefaultFileRenamePolicy());
		}
		catch (Exception e) {
			rttr.addFlashAttribute("msg", "파일 크기는 10MB 를 초과할수 없습니다.");
			return "redirect:/memImgForm";
		}

		//데이터베이스 테이블에 회원이미지를 업데이트
		String memId = multi.getParameter("memId");
		String newProfile ="";
		
		File file = multi.getFile("memProfile"); // multi 에 저장되어있는 실제 이미지와 file 객체생성
		
		if(file != null) { // 업로드가 된상태 (.png , jpg, gif)
			//이미지 파일 여부를 체크  -> 이미지 파일이아니면 삭제
			//dog.jpg
			String ext = file.getName().substring(file.getName().lastIndexOf(".")+1); //.을기준으로		
			ext = ext.toUpperCase();
			
			if(ext.equals("PNG") || ext.equals("GIF") || ext.equals("JPG")) {
				// 새로업로드된이미지 , 현재 DB에 있는 이미지
				String oldProfile = memberMapper.getMember(memId).getMemProfile();
				
				File oldFile = new File(savePath+"/"+oldProfile);
				
				if(oldFile.exists()) {
					oldFile.delete();					
				}
				newProfile = file.getName();
			}else { // 이미지 파일이아니면 이미지삭제
				if(file.exists()) { //file.exists 파일이실제로존재한다면
					file.delete();
					rttr.addFlashAttribute("msg", "img파일만 업로드 가능합니다.");
					return "redirect:/memImgForm";
				}
			}
			
		}
		
		// 새로운이미지를 데이터베이스에저장
		Member mvo = new Member();
		mvo.setMemId(memId);
		mvo.setMemProfile(newProfile);
		
		memberMapper.memProfileUpdate(mvo); //db에 업데이트저장
		
		Member member = memberMapper.getMember(memId);
		
		
		//세션새롭게 생성
		session.setAttribute("mvo", member);
		
		
		rttr.addFlashAttribute("msg", "이미지가 변경되었습니다.");
		
		return "redirect:/";
	}
	
	
}

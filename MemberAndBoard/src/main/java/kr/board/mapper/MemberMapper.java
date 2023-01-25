package kr.board.mapper;

import kr.board.entity.Member;

public interface MemberMapper {
	public Member overlapCheck(String id);
	public int joinMember(Member member);
	public Member goLogin(Member member);
	public int updateMember(Member member);
	
	public Member getMember(String memId);
	public void memProfileUpdate(Member member);
	
}

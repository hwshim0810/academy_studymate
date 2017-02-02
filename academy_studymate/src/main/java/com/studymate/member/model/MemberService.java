package com.studymate.member.model;

import javax.servlet.http.HttpSession;

public interface MemberService {
	public static final String GUESTLEVEL = "notMem";
	public static final String WRONGPASS = "wrongPass";
	
	String login(HttpSession session, LoginDto loginDto);

	void logout(HttpSession session);

	void memberJoin(MemberDto memDto);

	String isAbleId(String memId);

}

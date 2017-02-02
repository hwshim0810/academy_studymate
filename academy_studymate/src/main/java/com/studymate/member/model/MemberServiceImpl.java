package com.studymate.member.model;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studymate.common.CommonServiceUtil;

@Service
public class MemberServiceImpl extends CommonServiceUtil implements MemberService {
	@Autowired
	MemberDao memDao;
	
	@Override
	public String login(HttpSession session, LoginDto loginDto) {
		String memId = loginDto.getMemId();
		String memPass = loginDto.getMemPass();
		
		MemberDto memDto = memDao.login(memId);
		
		if (memDto == null) return GUESTLEVEL;
		
		String id = memDto.getMemId();
		String pass = memDto.getMemPass();
		
		if (id.equals("admin") && pass.equals(memPass)) {
			session.setAttribute("memId", id);
			session.setAttribute("memName", memDto.getMemName());
			return (String) session.getAttribute("page");
			
		} else if (pass.equals(memPass)) {
			session.setAttribute("memId", id);
			session.setAttribute("memName", memDto.getMemName());			
			return (String) session.getAttribute("page");
			
		} else return WRONGPASS;
		
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void memberJoin(MemberDto memDto) {
		memDao.memberJoin(memDto);
	}

	@Override
	public String isAbleId(String memId) {
		MemberDto memDto = memDao.isAbleId(memId);

		if (memDto == null) return "yes";
		return "no";
	}

}

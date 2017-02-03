package com.studymate.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.studymate.common.CommonServiceUtil;
import com.studymate.common.Dto;
import com.studymate.find.model.FindDao;
import com.studymate.notice.model.NoticeDao;
import com.studymate.reserve.model.ReserveDao;
import com.studymate.review.model.ReviewDao;

@Service
public class MemberServiceImpl extends CommonServiceUtil implements MemberService {
	@Autowired
	MemberDao memDao;
	@Autowired
	NoticeDao noticeDao;
	@Autowired
	ReserveDao resDao;
	@Autowired
	ReviewDao reviewDao;
	@Autowired
	FindDao findDao;
	
	@Override
	public String login(HttpSession session, LoginDto loginDto) {
		String memId = loginDto.getMemId();
		String memPass = loginDto.getMemPass();
		
		MemberDto memDto = memDao.login(memId);
		
		if (memDto == null) return GUESTLEVEL;
		
		String id = memDto.getMemId();
		String pass = memDto.getMemPass();
		String siteOut = memDto.getMemSiteout();
		
		if (id.equals("admin") && pass.equals(memPass)) {
			session.setAttribute("memId", id);
			session.setAttribute("memName", memDto.getMemName());
			return (String) session.getAttribute("page");
			
		} else if (pass.equals(memPass) && siteOut.equals("N")) {
			session.setAttribute("memId", id);
			session.setAttribute("memName", memDto.getMemName());			
			return (String) session.getAttribute("page");
			
		} else if  (siteOut.equals("Y")) {
			return GUESTLEVEL;
		} else {
			return WRONGPASS;
		}
		
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

		if (memDto == null) return "y";
		return "n";
	}

	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 5; 
		int blockPage = 5;
		int totalCount = getTotalCount(memDao, map);
		
		MemberPaging memPaging = new MemberPaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", memPaging.getStartCount());
		map.put("endRow", memPaging.getEndCount());
		
		List<Dto> list = getList(memDao, map); 
		
		model.addAttribute("memList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", memPaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "memberList/1");
		return model;
	}

	@Override
	public Model read(Model model, String memId, int currentPage, String keyField, String keyWord) {
		model.addAttribute("memDto", memDao.read(memId));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		return model;		
	}

	@Override
	public Model update(Model model, MemberDto memDto) {
		memDao.update(memDto);
		return model;
	}

	@Override
	public void updateDelMem(String memId) {
		memDao.updateDelMem(memId);
	}

	public void deleteMem(String memId) {
		noticeDao.deleteMem(memId);
		resDao.deleteMem(memId);
		reviewDao.deleteReplyMem(memId);
		reviewDao.deleteMem(memId);
		findDao.deleteMem(memId);
		
		memDao.deleteMem(memId);
	}

	@Override
	public Model setCurrentPage(Model model, int currentPage) {
		model.addAttribute("currentPage", currentPage);
		return model;
	}

}

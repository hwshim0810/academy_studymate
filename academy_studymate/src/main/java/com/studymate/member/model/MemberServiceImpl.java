package com.studymate.member.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.studymate.common.CommonServiceUtil;
import com.studymate.common.Dto;
import com.studymate.find.model.FindStudyDao;
import com.studymate.qna.model.QnaDao;
import com.studymate.reserve.model.ReserveDao;
import com.studymate.reserve.model.ReserveDto;
import com.studymate.review.model.ReviewDao;

@Service
public class MemberServiceImpl extends CommonServiceUtil implements MemberService {
	@Autowired
	MemberDao memDao;
	@Autowired
	ReviewDao reviewDao;
	@Autowired
	QnaDao qnaDao;
	@Autowired
	FindStudyDao findDao;
	@Autowired
	ReserveDao resDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public String login(HttpSession session, LoginDto loginDto) {
		String inputMemId = loginDto.getMemId();
		String inputMemPass = loginDto.getMemPass();
		
		MemberDto memDto = memDao.read(inputMemId);
		
		if (memDto == null) return GUESTLEVEL;
		
		String id = memDto.getMemId();
		String encodedPassword = memDto.getMemPass();
		String siteOut = memDto.getMemSiteout();
		String email = memDto.getMemEmail();
		
		if (id.equals("admin") && passwordEncoder.matches(inputMemPass, encodedPassword)) {
			session.setAttribute("memId", id);
			session.setAttribute("memName", memDto.getMemName());
			session.setAttribute("memEmail", email);
			return (String) session.getAttribute("page");
			
		} else if (passwordEncoder.matches(inputMemPass, encodedPassword) && siteOut.equals("가입")) {
			session.setAttribute("memId", id);
			session.setAttribute("memName", memDto.getMemName());	
			session.setAttribute("memEmail", email);
			return (String) session.getAttribute("page");
			
		} else if  (siteOut.equals("탈퇴")) {
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
	public String memberJoin(HttpSession session, MemberDto memDto, HttpServletRequest request) {
		String passConfirm = request.getParameter("memPassConfirm");

		if (passConfirm.equals(memDto.getMemPass())) {
			String encryptPassword = passwordEncoder.encode(memDto.getMemPass());
			memDto.setMemPass(encryptPassword);
			memDao.write(memDto);
		} else
			return "/member/wrongJoin";
		
		if (session.getAttribute("memId") == null) {
			
			HashMap<String, String> email = getWelcomeContents(
					((MemberDto) memDto).getMemId(), ((MemberDto) memDto).getMemEmail());

			sendEmailHelper(email.get("subject"), email.get("content"), email.get("receiver"));
			return "/member/joinSuccess";
		} else
			return "/member/wrongJoin";
	}

	@Override
	public HashMap<String, Object> isAbleId(String memId) {
		MemberDto memDto = memDao.read(memId);
		HashMap<String, Object> resultMap = new HashMap<>();
		
		if (memDto == null) {
			resultMap.put("searchResult", "OK");
			return resultMap;
		} else {
			resultMap.put("searchResult", "NO");
			return resultMap;
		}
	}

	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 10; 
		int blockPage = 10;
		int totalCount = getTotalCount(memDao, map);
		
		MemberPaging memPaging = new MemberPaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", memPaging.getStartCount());
		map.put("endRow", memPaging.getEndCount());
		
		List<Dto> list = getList(memDao, map); 
		
		model.addAttribute("totalCount", totalCount);
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
		model.addAttribute("listBtn", "/memberList/1");
		model.addAttribute("updateBtn", "/memberUpdate");
		model.addAttribute("deleteBtn", "/memberDelete");
		model.addAttribute("primaryKey", memId);
		return model;		
	}

	@Override
	public Model update(Model model, MemberDto memDto) {
		String encryptPassword = passwordEncoder.encode(memDto.getMemPass());
		memDto.setMemPass(encryptPassword);
		memDao.update(memDto);
		return model;
	}

	@Override
	public void updateDelMem(String memId) {
		String randomString = String.valueOf(new Date().getTime()).substring(8);
		MemberDto memDto = new MemberDto(memId, randomString, randomString, 
				randomString, randomString, randomString, randomString, randomString); 
		
		memDao.updateDelMem(memDto);
	}

	public void deleteMem(String memId) {
		reviewDao.deleteMem(memId);
		qnaDao.deleteMem(memId);
//		findDao.deleteMem(memId);
		
		memDao.deleteMem(memId);
	}

	@Override
	public Model setCurrentPage(Model model, int currentPage) {
		model.addAttribute("currentPage", currentPage);
		return model;
	}
	
	@Override
	public Model writeForm(Model model) {
		model.addAttribute("loginDto", new LoginDto());
		model.addAttribute("memberDto", new MemberDto());
		return model;
	}

	@Override
	public Model myPage(Model model, HttpSession session) {
		String memId = (String) session.getAttribute("memId");
		
		int blockCount = 5; 
		int blockPage = 5;
		int totalCount = resDao.getCountMemRes(memId);
		
		MemberResPaging memResPaging = new MemberResPaging(1, totalCount, blockCount, blockPage);
		Map<String, Object> map = new HashMap<>();
		
		map.put("startRow", memResPaging.getStartCount());
		map.put("endRow", memResPaging.getEndCount());
		map.put("memId", memId);
		
		List<ReserveDto> list = resDao.memResList(map);
		
		model.addAttribute("currentPage", 1);
		model.addAttribute("pageHtml", memResPaging.getPagingHtml().toString());
		model.addAttribute("memberDto", memDao.read(memId));
		model.addAttribute("resList", list);
		model.addAttribute("totalCount", totalCount);
		return model;
	}
	
	@Override
	public HashMap<String, Object> resPaging(int resPage, String memId) {
		HashMap<String, Object> map = new  HashMap<>();
		HashMap<String, Object> resultMap = new HashMap<>();
		
		int blockCount = 5; 
		int blockPage = 5;
		int totalCount = resDao.getCountMemRes(memId);
		MemberResPaging memResPaging = new MemberResPaging(resPage, totalCount, blockCount, blockPage);
		
		map.put("startRow", memResPaging.getStartCount());
		map.put("endRow", memResPaging.getEndCount());
		map.put("memId", memId);
		
		List<ReserveDto> list = resDao.memResList(map);
		resultMap.put("pageHtml", memResPaging.getPagingHtml().toString());
		resultMap.put("resList", list);

		return resultMap;
	}

	@Override
	public Model updateClient(Model model, MemberDto memDto) {
		memDao.updateClient(memDto);
		return model;
	}

	@Override
	public HashMap<String, Object> isRightPass(String memId, String oldPass) {
		HashMap<String, Object> resultMap = new HashMap<>();
		MemberDto memDto = memDao.read(memId);
		
		if (passwordEncoder.matches(oldPass, memDto.getMemPass())) {
			resultMap.put("searchResult", "OK");
			return resultMap;
		} else {
			resultMap.put("searchResult", "NO");
			return resultMap;
		}
	}

	@Override
	public Model findForm(Model model) {
		model.addAttribute("findDto", new FindDto());
		return model;
	}

	@Override
	public String memberFindPass(FindDto findPassDto) {
		String inputId = findPassDto.getMemId();
		String inputName = findPassDto.getMemName();
		String inputEmail = findPassDto.getMemEmail();
		
		MemberDto memDto = memDao.read(inputId);
		if (memDto == null) 
			return GUESTLEVEL;
		else if (memDto.getMemName().equals(inputName) && memDto.getMemEmail().equals(inputEmail)) {
			String randomString = getRandomString().substring(0, 8);
			String encryptPassword = passwordEncoder.encode(randomString);
			
			HashMap<String, String> email = getPassEmail(memDto, randomString);
			sendEmailHelper(email.get("subject"), email.get("content"), email.get("receiver"));
			
			memDto.setMemPass(encryptPassword);
			memDao.updatePass(memDto);
			return "/member/findPassSuccess";
		} else {
			return WRONGINFO;
		}
	}

	@Override
	public String memberFindId(Model model, FindDto findIdDto) {
		List<MemberDto> tempList = memDao.findId(findIdDto);
		List<MemberDto> list = new ArrayList<>();
		
		if (tempList.isEmpty()) {
			return GUESTLEVEL;
		} else {
			for(MemberDto memDto : tempList) {
				String temp = memDto.getMemId();
				memDto.setMemId(temp.substring(0, temp.length()-2));
				list.add(memDto);
			}
			model.addAttribute("memList", list);
			return "/member/findIdSuccess";
		}
	}

	@Override
	public HashMap<String, Object> resDetail(int resNum) {
		HashMap<String, Object> resultMap = new HashMap<>();
		ReserveDto resDto = (ReserveDto) resDao.read(resNum);
		
		resultMap.put("resDto", resDto);
		return resultMap;
	}

}

package com.studymate.find.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.studymate.common.CommonServiceUtil;
import com.studymate.common.Dto;
import com.studymate.common.ServiceInterface;
import com.studymate.reserve.model.ReserveDto;
import com.studymate.reserve.model.ReservePaging;
import com.studymate.room.model.RoomDao;
import com.studymate.room.model.RoomDto;

@Service
public class FindServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	FindStudyDao findDao;
	@Autowired
	RoomDao roomDao;
	
	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 10; 
		int blockPage = 10;
		int totalCount = getTotalCount(findDao, map);
		
		FindStudyPaging findStudyPaging = new FindStudyPaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", findStudyPaging.getStartCount());
		map.put("endRow", findStudyPaging.getEndCount());
		
		List<Dto> list = getList(findDao, map); 
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", findStudyPaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "redirect:findList/1");
		return model;
	}
	
	@Override 
	public Model writeForm(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", "");
		map.put("keyField", "");
		List<RoomDto> list = roomDao.getAllRoom(map);
		
		model.addAttribute("resDto", new ReserveDto());
		model.addAttribute("rooms", list);
		return model;
	}
	
	public Model writeFormSelected(Model model, String borName, int borNum) {
		model.addAttribute("borNum", borNum);
		model.addAttribute("borName", borName);
		model.addAttribute("reserveDto", new ReserveDto());
		return model;
	}

	public String writeNsendEmail(HttpSession session , Model model, Dto resDto, String mailCheck) {
		String sessionId = (String) session.getAttribute("memId");
		
		if (mailCheck == null) { // 수신미동의시
			findDao.write(resDto);
		} else {
			HashMap<String, String> email = getReserveEmailContents(resDto);
			sendEmailHelper(email.get("subject"), email.get("content"), email.get("receiver"));
			
			findDao.write(resDto);
		}
		
		// 예약의 주체에 따라 페이지 이동
		if (sessionId.equals("admin")) 
			return "redirect:/reserveList/1";
		else {
			model.addAttribute("resDto", resDto);
			return "/reserve/reserveSuccess"; 
		}
	}

	@Override// 상세읽기 : 조회수는 update로 오지않았을경우만
	public Model read(Model model, int resNum, int currentPage, String update, String keyField, String keyWord) {
		model.addAttribute("resDto", findDao.read(resNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("listBtn", "/reserveList/1");
		model.addAttribute("updateBtn", "/reserveUpdate");
		model.addAttribute("deleteBtn", "/reserveDelete");
		model.addAttribute("primaryKey", resNum);
		return model;
	}
	
	public HashMap<String, Object> getBorName(int borNum) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		String borName = roomDao.getBorName(borNum);
		resultMap.put("searchResult", borName);
		return resultMap;
	}

	public String updateRes(HttpSession session, Dto resDto, int currentPage, int resNum) {
		findDao.update(resDto);
		
		if (session.getAttribute("memId").equals("admin"))
			return "redirect:/reserveRead/" + currentPage  + "-" + resNum;
		else
			return "redirect:/memberMypage";
	}

	@Override
	public Model delete(Model model, Dto resDto) {
		findDao.delete(((ReserveDto) resDto).getResNum());
		return model;
	}
	
	@Override
	public Model setCurrentPage(Model model, int currentPage, int resNum) {
		model.addAttribute("resNum", resNum);
		model.addAttribute("currentPage", currentPage);
		return model;
	}

	@Override // 이메일 전송으로 인해 사용하지 않음
	public void write(Dto dto) {
	}

	@Override // 페이지이동으로 인해 사용하지않음
	public Model update(Model model, Dto dto) {
		// TODO Auto-generated method stub
		return null;
	}

}

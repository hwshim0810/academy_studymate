package com.studymate.reserve.model;

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
import com.studymate.room.model.RoomDao;
import com.studymate.room.model.RoomDto;

@Service
public class ReserveServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	ReserveDao reserveDao;
	
	@Autowired
	RoomDao roomDao;
	
	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 10; 
		int blockPage = 10;
		int totalCount = getTotalCount(reserveDao, map);
		
		ReservePaging noticePaging = new ReservePaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", noticePaging.getStartCount());
		map.put("endRow", noticePaging.getEndCount());
		
		List<Dto> list = getList(reserveDao, map); 
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", noticePaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "reserveList/1");
		return model;
	}
	
	public Model writeForm(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", "");
		map.put("keyField", "");
		List<RoomDto> list = roomDao.getAllRoom(map);
		
		model.addAttribute("resDto", new ReserveDto());
		model.addAttribute("rooms", list);
		return model;
	}

	@Override
	public void write(Dto resDto) {
		reserveDao.write(resDto);
	}

	@Override// 상세읽기 : 조회수는 update로 오지않았을경우만
	public Model read(Model model, int resNum, int currentPage, String update, String keyField, String keyWord) {
		if (update.equals("n"))
			reserveDao.updateReadCount(resNum);
		
		model.addAttribute("resDto", reserveDao.read(resNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		return model;
	}

	@Override
	public Model update(Model model, Dto resDto) {
		reserveDao.update(resDto);
		return model;
	}

	@Override
	public Model delete(Model model, int resNum) {
		reserveDao.delete(resNum);
		return model;
	}
	
	@Override
	public Model setCurrentPage(Model model, int currentPage) {
		model.addAttribute("currentPage", currentPage);
		return model;
	}

}

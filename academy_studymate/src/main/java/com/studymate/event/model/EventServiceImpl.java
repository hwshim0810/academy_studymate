package com.studymate.event.model;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.studymate.common.CommonServiceUtil;
import com.studymate.common.Dto;
import com.studymate.common.ServiceInterface;

@Service
public class EventServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	EventDao eventDao;
	
	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 10; 
		int blockPage = 10;
		int totalCount = getTotalCount(eventDao, map);
		
		EventPaging eventPaging = new EventPaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", eventPaging.getStartCount());
		map.put("endRow", eventPaging.getEndCount());
		
		ArrayList<Dto> list = (ArrayList<Dto>) getList(eventDao, map); 
		
		for (Dto eventDto : list) { // 마감여부파악
			int boeAble = ((EventDto) eventDto).getBoeAble();
			try {
				if (((EventDto) eventDto).getBoeIsEnd().equals("Y")) continue;
				
				Date boeDate = FMT.parse(((EventDto) eventDto).getBoeDaterange().substring(13));
				int result  = NOW.compareTo(boeDate);
				
				if (boeAble == 0 || result > 0) {
					((EventDto) eventDto).setBoeIsEnd("Y");
					eventDao.updateIsEnd(((EventDto) eventDto).getBoeNum());
				}
			} catch (ParseException e) {
				System.err.println("Dateparse exception");
				e.printStackTrace();
			}
			
		}
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("eventList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", eventPaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "redirect:eventList/1");
		return model;
	}

	@Override // 파일로 인하여 사용하지않음
	public void write(Dto eventDto) {
		eventDao.write(eventDto);
	}

	@Override// 상세읽기 : 조회수는 update로 오지않았을경우만
	public Model read(Model model, int boeNum, int currentPage, String update, String keyField, String keyWord) {
		if (update.equals("n"))
			eventDao.updateReadCount(boeNum);
		
		model.addAttribute("eventDto", eventDao.read(boeNum));
		model.addAttribute("eventPrev", eventDao.readPrev(boeNum));
		model.addAttribute("eventNext", eventDao.readNext(boeNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("listBtn", "/eventList/1");
		model.addAttribute("updateBtn", "/eventUpdate");
		model.addAttribute("deleteBtn", "/eventDelete");
		model.addAttribute("primaryKey", boeNum);
		return model;
	}

	@Override
	public Model update(Model model, Dto eventDto) {
		eventDao.update(eventDto);
		return model;
	}

	@Override
	public Model delete(Model model, Dto eventDto) {
		eventDao.delete(((EventDto) eventDto).getBoeNum());
		return model;
	}

	@Override
	public Model setCurrentPage(Model model, int currentPage, int boeNum) {
		model.addAttribute("bonNum", boeNum);
		model.addAttribute("currentPage", currentPage);
		return model;
	}
	
	@Override
	public Model writeForm(Model model) {
		model.addAttribute("eventDto", new EventDto());
		return model;
	}

	public String write(MultipartHttpServletRequest request, EventDto eventDto) {
		MultipartFile file = request.getFile("main");
	   
		if (file == null) return "/room/noneFileError";
		
	    String uploadPath = request.getServletContext().getRealPath("resources/eventImg/");
		String mainOriginName = file.getOriginalFilename();
		String[] mainFileNames = {};
	
		mainFileNames = fileUpload(file, mainOriginName, uploadPath + "/");
		
		((EventDto) eventDto).setBoeMainpath(mainFileNames[0]);
		((EventDto) eventDto).setBoeMain(mainFileNames[1]);
		
		eventDao.write(eventDto);
		
		return "redirect:/eventList/1";
	}

	public String updateEvent(MultipartHttpServletRequest request, EventDto eventDto) {
		int boeNum = ((EventDto) eventDto).getBoeNum();
		
		MultipartFile file = request.getFile("main");
		if (file == null || file.getOriginalFilename().equals("")) return "/room/noneFileError";
		
		// Oldfile Delete
		EventDto oldDto = (EventDto) eventDao.read(boeNum);
		String oldFilePath = oldDto.getBoeMainpath();
		fileDelete(oldFilePath);
		
		// Newfile Write & Update
	    String uploadPath = request.getServletContext().getRealPath("resources/eventImg/");
		String mainOriginName = file.getOriginalFilename();
		String[] mainFileNames = {};
	
		mainFileNames = fileUpload(file, mainOriginName, uploadPath + "/");
		
		((EventDto) eventDto).setBoeMainpath(mainFileNames[0]);
		((EventDto) eventDto).setBoeMain(mainFileNames[1]);
		eventDao.update(eventDto);
		
		// Maybe It can be Datainput after forward readPage..?
		return "redirect:eventRead/" + request.getParameter("currentPage") + "-" + boeNum + "/?update=y";
	}

	public HashMap<String, Object> joinEvent(String memId, int boeNum) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("boeNum", boeNum);
		
		int result = eventDao.hasEvent(map);
		EventDto eventDto = (EventDto) eventDao.read(boeNum);
		
		if (result > 0 || eventDto.getBoeIsEnd().equals("Y") || eventDto.getBoeAble() == 0) {
			resultMap.put("eventResult", "NO");
			return resultMap;
		} else {
			eventDao.writeEventsub(map);
			eventDao.updateAble(boeNum);
			resultMap.put("eventResult", "OK");
			return resultMap;
		}
	}
}

package com.studymate.room.model;

import java.util.HashMap;
import java.util.List;
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
public class RoomServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	RoomDao roomDao;
	
	@Override
	public Model list(HttpSession session, Model model, int currentPage, String keyField, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("keyField", keyField);
		
		int blockCount = 6; 
		int blockPage = 10;
		int totalCount = getTotalCount(roomDao, map);
		
		RoomPaging roomPaging = new RoomPaging(currentPage, totalCount, blockCount, blockPage, keyField, keyWord);
		
		map.put("startRow", roomPaging.getStartCount());
		map.put("endRow", roomPaging.getEndCount());
		
		List<Dto> list = getList(roomDao, map); 
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("roomList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageHtml", roomPaging.getPagingHtml().toString());
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		
		session.setAttribute("page", "roomList/1");
		return model;
	}
	
	@Override // multipart때문에 미사용
	public void write(Dto dto) {}
	
	public void write(MultipartHttpServletRequest request, Dto roomDto) throws Exception {
		MultipartFile file = request.getFile("file");
//		String uploadPath = "C:/Source/upload/"; //임시경로
	    
	    String uploadPath = request.getServletContext().getRealPath("resources/roomImg/");
		String orginFileName = file.getOriginalFilename();
		String[] fileNames = {};
		
		if (!(orginFileName.equals("")))
			fileNames = fileUpload(file, orginFileName, uploadPath + "/");
		
		((RoomDto) roomDto).setBorNewFilename(fileNames[0]);
		((RoomDto) roomDto).setBorFilename(fileNames[1]);
		
		roomDao.write(roomDto);
	}

	@Override// 상세읽기 : 조회수는 update로 오지않았을경우만
	public Model read(Model model, int borNum, int currentPage, String update, String keyField, String keyWord) {
		if (update.equals("n"))
			roomDao.updateReadCount(borNum);
		
		model.addAttribute("roomDto", roomDao.read(borNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		return model;
	}

	@Override
	public Model update(Model model, Dto roomDto) {
		roomDao.update(roomDto);
		return model;
	}

	@Override
	public Model delete(Model model, int borNum) {
		String filePath = ((RoomDto) roomDao.read(borNum)).getBorNewFilename();
		if (!(filePath.equals(""))) fileDelete(filePath);
		
		roomDao.delete(borNum);
		
		return model;
	}

	@Override
	public Model setCurrentPage(Model model, int currentPage) {
		model.addAttribute("currentPage", currentPage);
		return model;
	}

	@Override
	public Model writeForm(Model model) {
		model.addAttribute("roomDto", new RoomDto());
		return model;
	}

}

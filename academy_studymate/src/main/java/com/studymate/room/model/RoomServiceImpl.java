package com.studymate.room.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
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
		
		session.setAttribute("page", "redirect:roomList/1");
		return model;
	}
	
	@Override // multipart때문에 미사용
	public void write(Dto dto) {}
	
	public void write(MultipartHttpServletRequest request, Dto roomDto) throws Exception {
		MultipartFile file = request.getFile("main");
		List<MultipartFile> subList = request.getFiles("sub");
	    
	    String uploadPath = request.getServletContext().getRealPath("resources/roomImg/");
		String mainOriginName = file.getOriginalFilename();
		String[] mainFileNames = {};
		ArrayList<String> subFileNames = new ArrayList<>();
	
		if (!(mainOriginName.equals("")))
			mainFileNames = fileUpload(file, mainOriginName, uploadPath + "/");
		
		((RoomDto) roomDto).setBorMainpath(mainFileNames[0]);
		((RoomDto) roomDto).setBorMain(mainFileNames[1]);
		
		roomDao.write(roomDto);
		int borNum = roomDao.getBorNum();
		
		for (MultipartFile subFile : subList) {
			RoomSubDto subDto = new RoomSubDto();
			String subOriginName = subFile.getOriginalFilename();
			
			if (!(subOriginName.equals(""))) {
				subFileUpload(subFile, subOriginName, subFileNames, uploadPath + "/");
				subDto.setBorNum(borNum);
				subDto.setBorSubpath(subFileNames.get(0));
				subDto.setBorSub(subFileNames.get(1));

				roomDao.writeSubFile(subDto);
				subFileNames.clear();
			}
			
		}

	}

	@Override// 상세읽기 : 조회수는 update로 오지않았을경우만
	public Model read(Model model, int borNum, int currentPage, String update, String keyField, String keyWord) {
		model.addAttribute("subFileList", roomDao.readSubFile(borNum));
		model.addAttribute("roomDto", roomDao.read(borNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("listBtn", "/roomList/1");
		model.addAttribute("updateBtn", "/roomUpdate");
		model.addAttribute("deleteBtn", "/roomDelete");
		model.addAttribute("primaryKey", borNum);
		return model;
	}

	@Override
	public Model update(Model model, Dto roomDto) {
		roomDao.update(roomDto);
		return model;
	}

	@Override
	public Model delete(Model model, Dto roomDto) {
		int borNum = ((RoomDto) roomDto).getBorNum();
		String filePath = ((RoomDto) roomDao.read(borNum)).getBorMainpath();
		List<RoomSubDto> subFilePath = roomDao.readSubFile(borNum);
		
		if (!(filePath.equals(""))) fileDelete(filePath);
		
		for(RoomSubDto subDto : subFilePath) {
			String subFilepath = subDto.getBorSubpath();
			if (!subFilePath.equals("")) fileDelete(subFilepath);
		}
		
		roomDao.delete(borNum);
		
		return model;
	}

	@Override
	public Model setCurrentPage(Model model, int currentPage, int borNum) {
		model.addAttribute("borNum", borNum);
		model.addAttribute("currentPage", currentPage);
		return model;
	}

	@Override
	public Model writeForm(Model model) {
		model.addAttribute("roomDto", new RoomDto());
		return model;
	}
	
	public HashMap<String, Object> geoCoding(String location) {
		if (location == null)  
			return null;
		
		HashMap<String, Object> resultMap = new HashMap<>();
		Geocoder geocoder = new Geocoder();
		// setAddress : 변환하려는 주소 (경기도 성남시 분당구 등)
		// setLanguate : 인코딩 설정
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();
		GeocodeResponse geocoderResponse;

		try {
			geocoderResponse = geocoder.geocode(geocoderRequest);
			
			if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {
				GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
				LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
								  
				resultMap.put("wd", latitudeLongitude.getLat().toString());
				resultMap.put("kd", latitudeLongitude.getLng().toString());
				return resultMap;
			}
		
		} catch (IOException ex) {
			ex.printStackTrace();
		}
			return null;
		}

}

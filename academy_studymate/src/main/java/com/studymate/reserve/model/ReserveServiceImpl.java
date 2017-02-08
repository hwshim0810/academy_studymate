package com.studymate.reserve.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.studymate.common.CommonServiceUtil;
import com.studymate.common.Dto;
import com.studymate.common.EmailDto;
import com.studymate.common.EmailSender;
import com.studymate.common.ServiceInterface;
import com.studymate.room.model.RoomDao;
import com.studymate.room.model.RoomDto;

@Service
public class ReserveServiceImpl extends CommonServiceUtil implements ServiceInterface {
	@Autowired
	ReserveDao reserveDao;
	@Autowired
	RoomDao roomDao;
	@Autowired
    EmailSender emailSender;
	@Autowired
	EmailDto email;
	
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

	public String writeNsendEmail(Dto resDto) {
		if (((ReserveDto) resDto).getMemId().equals("ad")) {
			reserveDao.write(resDto);
		} else {
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy년 MM월 dd일");
			Date today = new Date();
			
			email.setSubject("Studymate에서 " + ((ReserveDto) resDto).getMemId() +" 님께 보내드리는 예약안내 메일입니다.");
			email.setReceiver(((ReserveDto) resDto).getMemEmail());
			email.setContent("안녕하십니까? Studymate에 예약해주셔서 감사합니다.\n"
					+ "예약번호: " + ((ReserveDto) resDto).getResNum() + "\n"
					+ "이용예정일: " + ((ReserveDto) resDto).getResDate() + "\n"
					+ "방문예정시간: " + ((ReserveDto) resDto).getResVisit() + "\n"
					+ "이용예정시간: " + ((ReserveDto) resDto).getResTime() + "\n"
					+ "예약지점: " + ((ReserveDto) resDto).getBorName() + "\n"
					+ "예약인원: " + ((ReserveDto) resDto).getResCount() + "\n"
					+ "예약날짜: " + fmt.format(today) + "\n\n"
					+ "예약시간에 맞추어 방문해주시기를 바랍니다.");
			try {
				emailSender.SendEmail(email);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("SendException");
			}
			reserveDao.write(resDto);
		}
		
		return "redirect:/reserveList/1";
	}

	@Override// 상세읽기 : 조회수는 update로 오지않았을경우만
	public Model read(Model model, int resNum, int currentPage, String update, String keyField, String keyWord) {
		model.addAttribute("resDto", reserveDao.read(resNum));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("listBtn", "/reserveList/1");
		model.addAttribute("updateBtn", "/reserveUpdate");
		model.addAttribute("deleteBtn", "/reserveDelete");
		model.addAttribute("primaryKey", resNum);
		return model;
	}

	@Override
	public Model update(Model model, Dto resDto) {
		reserveDao.update(resDto);
		return model;
	}

	@Override
	public Model delete(Model model, Dto resDto) {
		reserveDao.delete(((ReserveDto) resDto).getResNum());
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

}

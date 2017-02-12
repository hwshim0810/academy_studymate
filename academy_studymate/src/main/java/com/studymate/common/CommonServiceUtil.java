package com.studymate.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.studymate.member.model.MemberDto;
import com.studymate.reserve.model.ReserveDto;
import com.studymate.review.model.ReviewReplyDto;

@Component
public class CommonServiceUtil {
	@Autowired
    EmailSender emailSender;
	@Autowired
	EmailDto email;

	protected int getTotalCount(Dao dao, Map<String, Object> map) {
		return dao.totalcount(map);
	}
	
	protected List<Dto> getList(Dao dao, Map<String, Object> map) {
		List<Dto> list = dao.list(map);
		return list;
	}
	
	protected String[] fileUpload(MultipartFile file, String originFileName, String uploadPath) {
			File uploadFile = new File(uploadPath + originFileName);
			// 같은 파일 존재시
			if(uploadFile.exists()){
				originFileName = new Date().getTime() + originFileName;
				uploadFile = new File(uploadPath + originFileName);
			}
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {
				System.err.println("Upload Exception");
			}
			
			String[] result = {uploadFile.getPath(), originFileName};
			return result;
	}
	
	protected void subFileUpload(MultipartFile subFile, String subOriginName, ArrayList<String> subFileNames, String uploadPath) {
		File uploadFile = new File(uploadPath + subOriginName);
		// 같은 파일 존재시
		if(uploadFile.exists()){
			subOriginName = new Date().getTime() + subOriginName;
			uploadFile = new File(uploadPath + subOriginName);
		}
		try {
			subFile.transferTo(uploadFile);
		} catch (Exception e) {
			System.err.println("Upload Exception");
		}
		
		subFileNames.add(uploadFile.getPath());
		subFileNames.add(subOriginName);
}
	
	protected void fileDelete(String filePath) {
		File file = new File(filePath);
		if (file.exists()) file.delete();
	}
	
    protected String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    protected HashMap<String, Object> getReplyList(HashMap<String, Object> map, Dao reviewDao, String paging) {
    	HashMap<String, Object> resultMap = new HashMap<>();
    	List<ReviewReplyDto> list = reviewDao.readReply(map);
    	
    	resultMap.put("reviewReply", list);
		resultMap.put("replyPaging", paging);
		resultMap.put("borvNum", map.get("borvNum"));
		return resultMap;
    }
    
    protected void sendEmailHelper(String subject, String content, String receiver) {
    	email.setSubject(subject);
    	email.setContent(content);
		email.setReceiver(receiver);
		try {
			emailSender.SendEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SendException");
		}
    }
    
    protected HashMap<String, String> getReserveEmailContents(Dto resDto) {
       	HashMap<String, String> resultMap = new HashMap<>();
    	SimpleDateFormat fmt = new SimpleDateFormat("yyyy년 MM월 dd일");
		Date today = new Date();
		
		String reserveSubject = "Studymate에서 " + ((ReserveDto) resDto).getMemId() +" 님께 보내드리는 예약안내 메일입니다.";
		String reserveContent  = "<table width='100%' height='100%' style='min-width: 348px;' border='0' cellspacing='0' cellpadding='0'>"
				+ "<tbody><tr height='32px'></tr><tr align='center'><td width='32px'></td><td><table border='0' cellspacing='0' cellpadding='0' style='max-width: 600px;'>"
				+ "<tbody><tr><td><table width='100%' border='0' cellspacing='0' cellpadding='0'><tbody><tr><td align='left'></td><td align='right'></td></tr></tbody>"
				+ "</table></td></tr><tr height='16'></tr><tr><td>"
				+ "<table bgcolor='#E6E6E6' width='100%' border='0' cellspacing='0' cellpadding='0' style='min-width: 332px; max-width: 600px; border: 1px solid #E0E0E0; border-bottom: 0; border-top-left-radius: 3px; border-top-right-radius: 3px;'>"
				+ "<tbody><tr><td height='72px' colspan='3'></td></tr><tr><td width='32px'></td>"
				+ "<td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 24px; color: #000000; line-height: 1.25;'>예약해주셔서 감사합니다.</td>"
				+ "<td width='32px'></td></tr><tr><td height='18px' colspan='3'></td></tr></tbody></table></td></tr><tr><td>"
				+ "<table bgcolor='#FAFAFA' width='100%' border='0' cellspacing='0' cellpadding='0' style='min-width: 332px; max-width: 600px; border: 1px solid #F0F0F0; border-bottom: 1px solid #C0C0C0; border-top: 0; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px;'>"
				+ "<tbody><tr height='16px'><td width='32px' rowspan='3'></td><td></td><td width='32px' rowspan='3'></td></tr><tr><td>"
				+ "<table style='min-width: 300px;' border='0' cellspacing='0' cellpadding='0'><tbody><tr><td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 13px; color: #202020; line-height: 1.5;'>"
				+ ((ReserveDto) resDto).getMemId() + "님, 안녕하세요.</td></tr>"
				+ "<tr><td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 13px; color: #202020; line-height: 1.5;'>"
				+ "Studymate 서비스를 이용해주셔서 감사합니다.<br><br>"
				+ ((ReserveDto) resDto).getMemId() +"님이  " + fmt.format(today) + " 예약하신 정보입니다.<br><hr>"
				+ "예약번호: " + ((ReserveDto) resDto).getResNum() + "<br>"
				+ "예약자명: " + ((ReserveDto) resDto).getMemName() + "<br>"
				+ "이용예정일: " + ((ReserveDto) resDto).getResDate() + "<br>"
				+ "방문예정시간: " + ((ReserveDto) resDto).getResVisit() + "<br>"
				+ "이용예정시간: " + ((ReserveDto) resDto).getResTime() + "<br>"
				+ "예약지점: " + ((ReserveDto) resDto).getBorName() + "<br>"
				+ "예약인원: " + ((ReserveDto) resDto).getResCount() + "<br>"
				+ "<br><br></td></tr><tr height='32px'></tr><tr>"
				+ "<td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 13px; color: #202020; line-height: 1.5;'>"
				+ "예약시간에 맞추어 방문해주시기를 바랍니다.<br>Studymate운영자</td></tr><tr height='16px'></tr><tr><td>"
				+ "<table style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 12px; color: #B9B9B9; line-height: 1.5;'><tbody>"
				+ "<tr><td>본 이메일은 발신 전용입니다.</td></tr></tbody></table></td></tr></tbody></table></td></tr>"
				+ "<tr height='32px'></tr></tbody></table></td></tr><tr height='16'></tr><tr>"
				+ "<td style='max-width: 600px; font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 10px; color: #BCBCBC; line-height: 1.5;'>"
				+ "</td></tr><tr><td><table style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 10px; color: #666666; line-height: 18px; padding-bottom: 10px'>"
				+ "<tbody><tr><td>본 이메일은 Studymate의 서비스정보를  알려드리기 위한 필수 이메일 서비스 공지입니다.</td></tr>"
				+ "<tr><td><div style='direction: ltr; text-align: left'>© 2017 Studymate. 서울특별시 강남구 그린아카데미</div></td></tr></tbody></table>"
				+ "</td></tr></tbody></table></td></tr><tr><td width='32px'></td></tr><tr height='32px'></tr></tbody></table>";
		
		resultMap.put("subject", reserveSubject);
		resultMap.put("content", reserveContent);
		resultMap.put("receiver", ((ReserveDto) resDto).getMemEmail());
		return resultMap;
    }
    
    protected HashMap<String, String> getWelcomeContents(String memId, String receiver) {
    	HashMap<String, String> resultMap = new HashMap<>();
    	
    	String welcomeSubject = "Studymate에 가입하신것을 환영합니다!!!";
		String welcomeContent =  "<table width='100%' height='100%' style='min-width: 348px;' border='0' cellspacing='0' cellpadding='0'>"
				+ "<tbody><tr height='32px'></tr><tr align='center'><td width='32px'></td><td><table border='0' cellspacing='0' cellpadding='0' style='max-width: 600px;'>"
				+ "<tbody><tr><td><table width='100%' border='0' cellspacing='0' cellpadding='0'><tbody><tr><td align='left'></td><td align='right'></td></tr></tbody>"
				+ "</table></td></tr><tr height='16'></tr><tr><td>"
				+ "<table bgcolor='#E6E6E6' width='100%' border='0' cellspacing='0' cellpadding='0' style='min-width: 332px; max-width: 600px; border: 1px solid #E0E0E0; border-bottom: 0; border-top-left-radius: 3px; border-top-right-radius: 3px;'>"
				+ "<tbody><tr><td height='72px' colspan='3'></td></tr><tr><td width='32px'></td>"
				+ "<td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 24px; color: #000000; line-height: 1.25;'>가입을 환영합니다.</td>"
				+ "<td width='32px'></td></tr><tr><td height='18px' colspan='3'></td></tr></tbody></table></td></tr><tr><td>"
				+ "<table bgcolor='#FAFAFA' width='100%' border='0' cellspacing='0' cellpadding='0' style='min-width: 332px; max-width: 600px; border: 1px solid #F0F0F0; border-bottom: 1px solid #C0C0C0; border-top: 0; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px;'>"
				+ "<tbody><tr height='16px'><td width='32px' rowspan='3'></td><td></td><td width='32px' rowspan='3'></td></tr><tr><td>"
				+ "<table style='min-width: 300px;' border='0' cellspacing='0' cellpadding='0'><tbody><tr><td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 13px; color: #202020; line-height: 1.5;'>"
				+ memId + "님, 안녕하세요.</td></tr>"
				+ "<tr><td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 13px; color: #202020; line-height: 1.5;'>"
				+ "Studymate 가입을 진심으로 환영합니다.<br><br>Studymate는 <strong>"
				+ memId +"</strong> 님의 원활한 서비스 이용을 위해 최선을 다하겠습니다.<br>"
				+ "스터디나 모임을 하기위한 장소를 찾는 효율적인 서비스가 될 것입니다.<br><strong>" + memId
				+ "</strong> 님을 위해 최선의 서비스로 운영하겠습니다.<br><br></td></tr><tr height='32px'></tr><tr>"
				+ "<td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 13px; color: #202020; line-height: 1.5;'>"
				+ "감사합니다.<br>Studymate운영자</td></tr><tr height='16px'></tr><tr><td>"
				+ "<table style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 12px; color: #B9B9B9; line-height: 1.5;'><tbody>"
				+ "<tr><td>본 이메일은 발신 전용입니다.</td></tr></tbody></table></td></tr></tbody></table></td></tr>"
				+ "<tr height='32px'></tr></tbody></table></td></tr><tr height='16'></tr><tr>"
				+ "<td style='max-width: 600px; font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 10px; color: #BCBCBC; line-height: 1.5;'>"
				+ "</td></tr><tr><td><table style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 10px; color: #666666; line-height: 18px; padding-bottom: 10px'>"
				+ "<tbody><tr><td>본 이메일은 Studymate의 서비스정보를  알려드리기 위한 필수 이메일 서비스 공지입니다.</td></tr>"
				+ "<tr><td><div style='direction: ltr; text-align: left'>© 2017 Studymate. 서울특별시 강남구 그린아카데미</div></td></tr></tbody></table>"
				+ "</td></tr></tbody></table></td></tr><tr><td width='32px'></td></tr><tr height='32px'></tr></tbody></table>";
		resultMap.put("subject", welcomeSubject);
		resultMap.put("content", welcomeContent);
		resultMap.put("receiver", receiver);
		return resultMap;
    }
    
    public HashMap<String, String> getPassEmail(MemberDto memDto, String randomString) {
    	HashMap<String, String> resultMap = new HashMap<>();
    
    	String passSubject = "Studymate에서 보내드리는 임시비밀번호입니다.";
		String passContent =  "<table width='100%' height='100%' style='min-width: 348px;' border='0' cellspacing='0' cellpadding='0'>"
				+ "<tbody><tr height='32px'></tr><tr align='center'><td width='32px'></td><td><table border='0' cellspacing='0' cellpadding='0' style='max-width: 600px;'>"
				+ "<tbody><tr><td><table width='100%' border='0' cellspacing='0' cellpadding='0'><tbody><tr><td align='left'></td><td align='right'></td></tr></tbody>"
				+ "</table></td></tr><tr height='16'></tr><tr><td>"
				+ "<table bgcolor='#E6E6E6' width='100%' border='0' cellspacing='0' cellpadding='0' style='min-width: 332px; max-width: 600px; border: 1px solid #E0E0E0; border-bottom: 0; border-top-left-radius: 3px; border-top-right-radius: 3px;'>"
				+ "<tbody><tr><td height='72px' colspan='3'></td></tr><tr><td width='32px'></td>"
				+ "<td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 24px; color: #000000; line-height: 1.25;'>임시비밀번호</td>"
				+ "<td width='32px'></td></tr><tr><td height='18px' colspan='3'></td></tr></tbody></table></td></tr><tr><td>"
				+ "<table bgcolor='#FAFAFA' width='100%' border='0' cellspacing='0' cellpadding='0' style='min-width: 332px; max-width: 600px; border: 1px solid #F0F0F0; border-bottom: 1px solid #C0C0C0; border-top: 0; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px;'>"
				+ "<tbody><tr height='16px'><td width='32px' rowspan='3'></td><td></td><td width='32px' rowspan='3'></td></tr><tr><td>"
				+ "<table style='min-width: 300px;' border='0' cellspacing='0' cellpadding='0'><tbody><tr><td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 13px; color: #202020; line-height: 1.5;'>"
				+ memDto.getMemId() + "님, 안녕하세요.</td></tr>"
				+ "<tr><td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 13px; color: #202020; line-height: 1.5;'>"
				+ "Studymate에서 보내드리는 임시비밀번호입니다.<br><br>회원님의 임시비밀번호는<strong>"
				+ randomString +"</strong>입니다.<br>"
				+ "<br></td></tr><tr height='32px'></tr><tr>"
				+ "<td style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 13px; color: #202020; line-height: 1.5;'>"
				+ "감사합니다.<br>Studymate운영자</td></tr><tr height='16px'></tr><tr><td>"
				+ "<table style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 12px; color: #B9B9B9; line-height: 1.5;'><tbody>"
				+ "<tr><td>본 이메일은 발신 전용입니다.</td></tr></tbody></table></td></tr></tbody></table></td></tr>"
				+ "<tr height='32px'></tr></tbody></table></td></tr><tr height='16'></tr><tr>"
				+ "<td style='max-width: 600px; font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 10px; color: #BCBCBC; line-height: 1.5;'>"
				+ "</td></tr><tr><td><table style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 10px; color: #666666; line-height: 18px; padding-bottom: 10px'>"
				+ "<tbody><tr><td>본 이메일은 Studymate의 서비스정보를  알려드리기 위한 필수 이메일 서비스 공지입니다.</td></tr>"
				+ "<tr><td><div style='direction: ltr; text-align: left'>© 2017 Studymate. 서울특별시 강남구 그린아카데미</div></td></tr></tbody></table>"
				+ "</td></tr></tbody></table></td></tr><tr><td width='32px'></td></tr><tr height='32px'></tr></tbody></table>";
		resultMap.put("subject", passSubject);
		resultMap.put("content", passContent);
		resultMap.put("receiver", memDto.getMemEmail());
		return resultMap;
    }
}

package com.studymate.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.studymate.review.model.ReviewReplyDto;

public class CommonServiceUtil {
	
	protected int getTotalCount(Dao dao, Map<String, Object> map) {
		return dao.totalcount(map);
	}
	
	protected List<Dto> getList(Dao dao, Map<String, Object> map) {
		List<Dto> list = dao.list(map);
		return list;
	}
	
	protected String fileUpload(MultipartFile file, String originFileName, String uploadPath) {
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
			return uploadFile.getPath();
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

}

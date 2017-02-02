package com.studymate.common;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public class CommonServiceUtil {
	protected int getTotalCount(Dao dao, Map<String, Object> map) {
		return dao.totalcount(map);
	}
	
	protected List<Dto> getList(Dao dao, Map<String, Object> map) {
		List<Dto> list = dao.list(map);
		return list;
	}
	
	protected void fileUpload(MultipartFile file, String fileName, String uploadPath) {
			File uploadFile = new File(uploadPath + fileName);
			// 같은 파일 존재시
			if(uploadFile.exists()){
				fileName = new Date().getTime() + fileName;
				uploadFile = new File(uploadPath + fileName);
			}
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {
				System.err.println("Upload Exception");
			}
	}
}

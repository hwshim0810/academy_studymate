package com.studymate.member.model;

import com.studymate.common.Dto;

public class LoginDto extends Dto {
	String memId, memPass;

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPass() {
		return memPass;
	}

	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	
}

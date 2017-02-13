package com.studymate.member.model;

import org.hibernate.validator.constraints.NotEmpty;

import com.studymate.common.Dto;

public class LoginDto extends Dto {
	@NotEmpty (message="필수입력")
	private String memId;
	@NotEmpty (message="필수입력")
	private String memPass;

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

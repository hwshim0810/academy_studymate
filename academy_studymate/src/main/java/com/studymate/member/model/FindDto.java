package com.studymate.member.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class FindDto {
	@NotEmpty (message="아이디필수입력")
	private String memId;
	@NotEmpty (message="이름필수입력") @Size(min=2,message="2자이상")
	private String memName;
	@Email(message="메일주소양식필요") @NotEmpty(message="메일필수입력") @Size(min=5,message="5자이상")
	private String memEmail;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
}

package com.studymate.member.model;

import java.sql.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.studymate.common.Dto;

public class MemberDto extends Dto {
	@NotEmpty (message="아이디필수입력")
	private String memId;
	@NotEmpty (message="암호필수입력") @Size(min=6,message="6자이상")
	private String memPass;
	@NotEmpty (message="이름필수입력") @Size(min=2,message="2자이상")
	private String memName;
	@NotEmpty (message="주소필수입력")
	private String memAddr;
	@NotEmpty (message="상세주소필수입력") @Size(min=3,message="3자이상")
	private String memArea;
	@Email(message="메일주소양식필요") @NotEmpty(message="메일필수입력") @Size(min=5,message="5자이상")
	private String memEmail;
	private String memSex, memBirth, memSiteout;
	private Date memRegdate;
	
	public MemberDto() {}
	
	public MemberDto(String memId, String memPass, String memName, String memSex, String memBirth, String memAddr,
			String memArea, String memEmail) {
		super();
		this.memId = memId;
		this.memPass = memPass;
		this.memName = memName;
		this.memSex = memSex;
		this.memBirth = memBirth;
		this.memAddr = memAddr;
		this.memArea = memArea;
		this.memEmail = memEmail;
	}
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
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemSex() {
		return memSex;
	}
	public void setMemSex(String memSex) {
		this.memSex = memSex;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemArea() {
		return memArea;
	}
	public void setMemArea(String memArea) {
		this.memArea = memArea;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemSiteout() {
		return memSiteout;
	}
	public void setMemSiteout(String memSiteout) {
		this.memSiteout = memSiteout;
	}
	public Date getMemRegdate() {
		return memRegdate;
	}
	public void setMemRegdate(Date memRegdate) {
		this.memRegdate = memRegdate;
	}
	
	
}

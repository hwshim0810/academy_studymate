package com.studymate.member.model;

import java.sql.Date;

public class MemberDto {
	private String memId, memPass, memName, memSex, memBirth, memAddr, memArea, memEmail, memSiteout;
	private Date memRegdate;
	
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

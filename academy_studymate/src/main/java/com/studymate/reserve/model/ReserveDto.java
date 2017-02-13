package com.studymate.reserve.model;

import java.sql.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.studymate.common.Dto;

public class ReserveDto extends Dto {
	private String memId;
	@NotEmpty(message="이름필수입력") @Size(min=2,message="2자이상")
	private String memName;
	@Email(message="메일주소양식필요") @NotEmpty(message="메일필수입력") @Size(min=5,message="5자이상")
	private String memEmail;
	private String borName;
	private int borNum;
	@NotEmpty(message="날짜필수입력")
	private String resDate;
	private String resVisit;
	private int resTime;
	private int resCount;
	private int resNum;
	private Date resRegdate;
	
	@Override
	public String toString() {
		return "ReserveDto [resNum=" + resNum + ", resDate=" + resDate + ", resVisit=" + resVisit + ", borName="
				+ borName + ", resRegdate=" + resRegdate + ", borNum=" + borNum + ", resCount=" + resCount
				+ ", resTime=" + resTime + ", memId=" + memId + ", memName=" + memName + ", memEmail=" + memEmail + "]";
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getResNum() {
		return resNum;
	}
	public void setResNum(int resNum) {
		this.resNum = resNum;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getResVisit() {
		return resVisit;
	}
	public void setResVisit(String resVisit) {
		this.resVisit = resVisit;
	}
	public String getBorName() {
		return borName;
	}
	public void setBorName(String borName) {
		this.borName = borName;
	}
	public Date getResRegdate() {
		return resRegdate;
	}
	public void setResRegdate(Date resRegdate) {
		this.resRegdate = resRegdate;
	}
	public int getBorNum() {
		return borNum;
	}
	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}
	public int getResCount() {
		return resCount;
	}
	public void setResCount(int resCount) {
		this.resCount = resCount;
	}
	public int getResTime() {
		return resTime;
	}
	public void setResTime(int resTime) {
		this.resTime = resTime;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
}

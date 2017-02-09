package com.studymate.reserve.model;

import java.sql.Date;

import com.studymate.common.Dto;

public class ReserveDto extends Dto {
	int resNum;
	String resDate, resVisit, borName;
	Date resRegdate;
	int borNum, resCount, resTime;
	String memId, memName, memEmail;
	
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

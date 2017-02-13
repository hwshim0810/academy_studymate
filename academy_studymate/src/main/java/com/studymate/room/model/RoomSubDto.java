package com.studymate.room.model;

import com.studymate.common.Dto;

public class RoomSubDto extends Dto {
	int borSubnum;
	int borNum;
	String borSub, borSubpath;
	int borIdx;
	
	@Override
	public String toString() {
		return "RoomSubDto [borNum=" + borNum + ", borSub=" + borSub + ", borSubpath=" + borSubpath + "]";
	}

	public int getBorIdx() {
		return borIdx;
	}
	public void setBorIdx(int borIdx) {
		this.borIdx = borIdx;
	}

	public int getBorSubnum() {
		return borSubnum;
	}
	public void setBorSubnum(int borSubnum) {
		this.borSubnum = borSubnum;
	}
	public int getBorNum() {
		return borNum;
	}
	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}
	public String getBorSub() {
		return borSub;
	}
	public void setBorSub(String borSub) {
		this.borSub = borSub;
	}
	public String getBorSubpath() {
		return borSubpath;
	}
	public void setBorSubpath(String borSubpath) {
		this.borSubpath = borSubpath;
	}
	
}

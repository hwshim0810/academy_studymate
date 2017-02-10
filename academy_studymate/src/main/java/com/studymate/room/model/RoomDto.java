package com.studymate.room.model;

import java.sql.Date;

import com.studymate.common.Dto;

public class RoomDto extends Dto{
	int borNum;
	String borName, borAddr, borArea, borFilename, borNewFilename;
	String borIntro;
	Date borRegdate;
	
	public String getBorIntro() {
		return borIntro;
	}
	public void setBorIntro(String borIntro) {
		this.borIntro = borIntro;
	}
	public String getBorNewFilename() {
		return borNewFilename;
	}
	public void setBorNewFilename(String borNewFilename) {
		this.borNewFilename = borNewFilename;
	}
	public int getBorNum() {
		return borNum;
	}
	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}
	public String getBorName() {
		return borName;
	}
	public void setBorName(String borName) {
		this.borName = borName;
	}
	public String getBorAddr() {
		return borAddr;
	}
	public void setBorAddr(String borAddr) {
		this.borAddr = borAddr;
	}
	public String getBorArea() {
		return borArea;
	}
	public void setBorArea(String borArea) {
		this.borArea = borArea;
	}
	public String getBorFilename() {
		return borFilename;
	}
	public void setBorFilename(String borFilename) {
		this.borFilename = borFilename;
	}
	public Date getBorRegdate() {
		return borRegdate;
	}
	public void setBorRegdate(Date borRegdate) {
		this.borRegdate = borRegdate;
	}
	
	
}

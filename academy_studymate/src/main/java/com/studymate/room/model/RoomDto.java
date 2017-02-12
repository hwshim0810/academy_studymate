package com.studymate.room.model;

import java.sql.Date;

import com.studymate.common.Dto;

public class RoomDto extends Dto{
	int borNum;
	String borName, borAddr, borArea, borMain, borMainpath;
	String borIntro;
	Date borRegdate;
	
	public String getBorMain() {
		return borMain;
	}
	public void setBorMain(String borMain) {
		this.borMain = borMain;
	}
	public String getBorMainpath() {
		return borMainpath;
	}
	public void setBorMainpath(String borMainpath) {
		this.borMainpath = borMainpath;
	}
	public String getBorIntro() {
		return borIntro;
	}
	public void setBorIntro(String borIntro) {
		this.borIntro = borIntro;
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
	public Date getBorRegdate() {
		return borRegdate;
	}
	public void setBorRegdate(Date borRegdate) {
		this.borRegdate = borRegdate;
	}
	
	
}

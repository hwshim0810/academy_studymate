package com.studymate.room.model;

import java.util.List;
import java.util.Map;

import com.studymate.common.Dao;

public interface RoomDao extends Dao {

	List<RoomDto> getAllRoom(Map<String, Object> map);

	String getBorName(int borNum);

}

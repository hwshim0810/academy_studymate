package com.studymate.common;

import java.util.List;
import java.util.Map;

public interface Dao {

	public int totalcount(Map<String, Object> map);

	public List<Dto> list(Map<String, Object> map);

	public Dto read(int bonNum);
	
	public Dto readPrev(int bonNum);
	
	public Dto readNext(int bonNum);

	public void write(Dto Dto);

	public void update(Dto Dto);

	public void delete(int bonNum);

	public void updateReadCount(int bonNum);

}

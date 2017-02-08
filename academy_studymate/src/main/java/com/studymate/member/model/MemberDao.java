package com.studymate.member.model;

import com.studymate.common.Dao;

public interface MemberDao extends Dao {

	MemberDto login(String memId);

	MemberDto read(String memId);
	
	void updateReadCount(String memId);

	void updateDelMem(String memId);

	void deleteMem(String memId);

}

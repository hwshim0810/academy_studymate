package com.studymate.member.model;

import java.util.List;

import com.studymate.common.Dao;

public interface MemberDao extends Dao {

	MemberDto read(String memId);
	
	void updateReadCount(String memId);

	void updateDelMem(MemberDto memDto);

	void deleteMem(String memId);

	void updateClient(MemberDto memDto);

	void updatePass(MemberDto memDto);

	List<MemberDto> findId(FindDto findIdDto);

}

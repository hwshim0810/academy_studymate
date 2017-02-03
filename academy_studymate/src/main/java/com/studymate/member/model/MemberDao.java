package com.studymate.member.model;

import com.studymate.common.Dao;

public interface MemberDao extends Dao {

	MemberDto login(String memId);

	void memberJoin(MemberDto memDto);

	MemberDto isAbleId(String memId);

	void updateReadCount(String memId);

	MemberDto read(String memId);

	void update(MemberDto memDto);

}

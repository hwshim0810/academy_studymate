package com.studymate.member.model;

public interface MemberDao {

	MemberDto login(String memId);

	void memberJoin(MemberDto memDto);

	MemberDto isAbleId(String memId);

}

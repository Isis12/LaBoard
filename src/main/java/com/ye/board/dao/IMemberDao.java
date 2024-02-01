package com.ye.board.dao;

import org.apache.ibatis.annotations.Select;

import com.ye.board.bean.Member;

public interface IMemberDao {

	public String getSecurityPwd(String id);

	public Member getMemberInfo(String id);

	public boolean memberJoin(Member mb);

	@Select("SELECT COUNT(*) FROM MEMBER WHERE M_ID = #{m_id}")
	public int idCheck(String m_id);

	@Select("SELECT COUNT(*) FROM MEMBER WHERE M_PHONE = #{m_phone}")
	public int phoneCheck(String m_phone);


}

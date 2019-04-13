package com.member.model;

import java.util.List;

public interface MemberDAO_interface {

	public int insert(MemberVo memberVO);

	public int update(MemberVo memberVO);

	public int delete(String mem_no);

	public MemberVo findByPrimaryKey(String mem_no);

	public List<MemberVo> getAll();

}

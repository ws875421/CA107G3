package com.member.model;

import java.util.List;

public class MemberService {

	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}

	public MemberVo updateMem_no() {

		MemberVo memberVo = new MemberVo();
		
		

		
		dao.insert(memberVo);
		return memberVo;
	}

	public void deleteMem_no(String mem_no) {
		dao.delete(mem_no);
	}

	public MemberVo getOneMem_no(String mem_no) {
		return dao.findByPrimaryKey(mem_no);
	}

	public List<MemberVo> getAll() {
		return dao.getAll();
	}

}

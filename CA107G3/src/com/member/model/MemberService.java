package com.member.model;

import java.util.List;

public class MemberService {

	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}

	public MemberVo add(String mem_name, String mem_account, String mem_pwd, String mem_gender, String mem_mail,
			String mem_id, String mem_tel, String mem_status, Double mem_balance, String mem_nickname ,byte[] mem_pic) {
		
		MemberVo vo = new MemberVo();
		vo.setMem_name(mem_name);
		vo.setMem_account(mem_account);
		vo.setMem_pwd(mem_pwd);
		vo.setMem_gender(mem_gender);
		vo.setMem_mail(mem_mail);
		vo.setMem_id(mem_id);
		vo.setMem_tel(mem_tel);
		vo.setMem_status(mem_status);
		vo.setMem_balance(mem_balance);
		vo.setMem_nickname(mem_nickname);
		//圖片
		vo.setMem_pic(mem_pic);
//		System.out.println(vo);
		dao.insert(vo);
		return vo;
	}

	public MemberVo updateMem_no(MemberVo memberVo) {
//
//		MemberVo memberVo = new MemberVo();
//		
//		MemberVo vo = new MemberVo();
//		vo.setMem_name(mem_name);
//		vo.setMem_account(mem_account);
//		vo.setMem_pwd(mem_pwd);
//		vo.setMem_gender(mem_gender);
//		vo.setMem_mail(mem_mail);
//		vo.setMem_id(mem_id);
//		vo.setMem_tel(mem_tel);
//		vo.setMem_status(mem_status);
//		vo.setMem_balance(mem_balance);
//		vo.setMem_nickname(mem_nickname);
//		//圖片
//		vo.setMem_pic(mem_pic);
//		System.out.println(memberVo);

		dao.update(memberVo);
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

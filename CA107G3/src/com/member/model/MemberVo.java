package com.member.model;

import java.io.Serializable;

public class MemberVo implements Serializable {

	private String mem_no;
	private String mem_name;
	private String mem_account;
	private String mem_pwd;
	private String mem_gender;
	private String mem_mail;
	private String mem_id;
	private String mem_tel;
	private String mem_status;
	private byte[] mem_pic;
	private Double mem_balance;
	private String mem_nickname;

	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 新增
	public MemberVo(String mem_name, String mem_account, String mem_pwd, String mem_gender, String mem_mail,
			String mem_id, String mem_tel, String mem_status, Double mem_balance, String mem_nickname) {
		super();
		this.mem_name = mem_name;
		this.mem_account = mem_account;
		this.mem_pwd = mem_pwd;
		this.mem_gender = mem_gender;
		this.mem_mail = mem_mail;
		this.mem_id = mem_id;
		this.mem_tel = mem_tel;
		this.mem_status = mem_status;
		this.mem_balance = mem_balance;
		this.mem_nickname = mem_nickname;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	// 更新
	public MemberVo(String mem_name, String mem_account, String mem_pwd, String mem_gender, String mem_tel,
			String mem_status, byte[] mem_pic, Double mem_balance, String mem_nickname) {
		super();
		this.mem_name = mem_name;
		this.mem_account = mem_account;
		this.mem_pwd = mem_pwd;
		this.mem_gender = mem_gender;
		this.mem_tel = mem_tel;
		this.mem_status = mem_status;
		this.mem_pic = mem_pic;
		this.mem_balance = mem_balance;
		this.mem_nickname = mem_nickname;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_account() {
		return mem_account;
	}

	public void setMem_account(String mem_account) {
		this.mem_account = mem_account;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_mail() {
		return mem_mail;
	}

	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public String getMem_status() {
		return mem_status;
	}

	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}

	public byte[] getMem_pic() {
		return mem_pic;
	}

	public void setMem_pic(byte[] mem_pic) {
		this.mem_pic = mem_pic;
	}

	public Double getMem_balance() {
		return mem_balance;
	}

	public void setMem_balance(Double mem_balance) {
		this.mem_balance = mem_balance;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	@Override
	public String toString() {
		return "MemberVo [mem_no=" + mem_no + ", mem_name=" + mem_name + ", mem_account=" + mem_account + ", mem_pwd="
				+ mem_pwd + ", mem_gender=" + mem_gender + ", mem_mail=" + mem_mail + ", mem_id=" + mem_id
				+ ", mem_tel=" + mem_tel + ", mem_status=" + mem_status + ", mem_pic=" + mem_pic + ", mem_balance="
				+ mem_balance + ", mem_nickname=" + mem_nickname + "]";
	}

}

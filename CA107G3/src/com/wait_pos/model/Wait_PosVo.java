package com.wait_pos.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Wait_PosVo implements Serializable {

	private String wait_no;
	private String mem_no;
	private String vendor_no;
	private Integer wait_mun;
	private Integer wait_people;
	private Timestamp wait_gettime;
	private Integer wait_remind;
	private Integer wait_status;

	public Wait_PosVo() {
	}

	// INSERT
	public Wait_PosVo(String mem_no, String vendor_no, Integer wait_mun, Integer wait_people, Timestamp wait_gettime,
			Integer wait_remind, Integer wait_status) {
		super();
		this.mem_no = mem_no;
		this.vendor_no = vendor_no;
		this.wait_mun = wait_mun;
		this.wait_people = wait_people;
		this.wait_gettime = wait_gettime;
		this.wait_remind = wait_remind;
		this.wait_status = wait_status;
	}
	

	// update
	public Wait_PosVo(String mem_no, String vendor_no, Integer wait_people, Integer wait_remind, Integer wait_status) {
		super();
		this.mem_no = mem_no;
		this.vendor_no = vendor_no;
		this.wait_people = wait_people;
		this.wait_remind = wait_remind;
		this.wait_status = wait_status;
	}

	public String getWait_no() {
		return wait_no;
	}

	public void setWait_no(String wait_no) {
		this.wait_no = wait_no;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getVendor_no() {
		return vendor_no;
	}

	public void setVendor_no(String vendor_no) {
		this.vendor_no = vendor_no;
	}

	public Integer getWait_mun() {
		return wait_mun;
	}

	public void setWait_mun(Integer wait_mun) {
		this.wait_mun = wait_mun;
	}

	public Integer getWait_people() {
		return wait_people;
	}

	public void setWait_people(Integer wait_people) {
		this.wait_people = wait_people;
	}

	public Timestamp getWait_gettime() {
		return wait_gettime;
	}

	public void setWait_gettime(Timestamp wait_gettime) {
		this.wait_gettime = wait_gettime;
	}

	public Integer getWait_remind() {
		return wait_remind;
	}

	public void setWait_remind(Integer wait_remind) {
		this.wait_remind = wait_remind;
	}

	public Integer getWait_status() {
		return wait_status;
	}

	public void setWait_status(Integer wait_status) {
		this.wait_status = wait_status;
	}

	@Override
	public String toString() {
		return "Wait_PosVo [wait_no=" + wait_no + ", mem_no=" + mem_no + ", vendor_no=" + vendor_no + ", wait_mun="
				+ wait_mun + ", wait_people=" + wait_people + ", wait_gettime=" + wait_gettime + ", wait_remind="
				+ wait_remind + ", wait_status=" + wait_status + "]";
	}

}

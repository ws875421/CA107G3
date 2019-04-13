package com.rep_res.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

//餐廳檢舉清單
public class Rep_ResVo implements Serializable {

	private String rep_res_no;
	private String mem_no;
	private String vendor_no;
	private String rep_res_detl;
	private Timestamp rep_res_time;
	private String rep_res_status;

	public Rep_ResVo() {

	}

	// 後台人員更新狀態
	public Rep_ResVo(String rep_res_no, String rep_res_status) {
		super();
		this.rep_res_no = rep_res_no;
		this.rep_res_status = rep_res_status;
	}

	// 新增
	public Rep_ResVo(String mem_no, String vendor_no, String rep_res_detl, Timestamp rep_res_time,
			String rep_res_status) {
		super();
		this.mem_no = mem_no;
		this.vendor_no = vendor_no;
		this.rep_res_detl = rep_res_detl;
		this.rep_res_time = rep_res_time;
		this.rep_res_status = rep_res_status;
	}

	public String getRep_res_no() {
		return rep_res_no;
	}

	public void setRep_res_no(String rep_res_no) {
		this.rep_res_no = rep_res_no;
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

	public String getRep_res_detl() {
		return rep_res_detl;
	}

	public void setRep_res_detl(String rep_res_detl) {
		this.rep_res_detl = rep_res_detl;
	}

	public Timestamp getRep_res_time() {
		return rep_res_time;
	}

	public void setRep_res_time(Timestamp rep_res_time) {
		this.rep_res_time = rep_res_time;
	}

	public String getRep_res_status() {
		return rep_res_status;
	}

	public void setRep_res_status(String rep_res_status) {
		this.rep_res_status = rep_res_status;
	}

	@Override
	public String toString() {
		return "Rep_ResVo [rep_res_no=" + rep_res_no + ", mem_no=" + mem_no + ", vendor_no=" + vendor_no
				+ ", rep_res_detl=" + rep_res_detl + ", rep_res_time=" + rep_res_time + ", rep_res_status="
				+ rep_res_status + "]";
	}

}

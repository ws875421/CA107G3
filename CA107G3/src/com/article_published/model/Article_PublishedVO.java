package com.article_published.model;

import java.sql.Date;

public class Article_PublishedVO implements java.io.Serializable{
	private String art_no;
	private String mem_no;
	private String art_title;
	private String art_content;
	private Date art_time;
	private byte[] art_pic1;
	private byte[] art_pic2;
	private byte[] art_pic3;
	private byte[] art_pic4;
	private byte[] art_pic5;
	private Integer art_code;
	
	public String getArt_no() {
		return art_no;
	}
	public void setArt_no(String art_no) {
		this.art_no = art_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getArt_title() {
		return art_title;
	}
	public void setArt_title(String art_title) {
		this.art_title = art_title;
	}
	public String getArt_content() {
		return art_content;
	}
	public void setArt_content(String art_content) {
		this.art_content = art_content;
	}
	public Date getArt_time() {
		return art_time;
	}
	public void setArt_time(Date art_time) {
		this.art_time = art_time;
	}
	public byte[] getArt_pic1() {
		return art_pic1;
	}
	public void setArt_pic1(byte[] art_pic1) {
		this.art_pic1 = art_pic1;
	}
	public byte[] getArt_pic2() {
		return art_pic2;
	}
	public void setArt_pic2(byte[] art_pic2) {
		this.art_pic2 = art_pic2;
	}
	public byte[] getArt_pic3() {
		return art_pic3;
	}
	public void setArt_pic3(byte[] art_pic3) {
		this.art_pic3 = art_pic3;
	}
	public byte[] getArt_pic4() {
		return art_pic4;
	}
	public void setArt_pic4(byte[] art_pic4) {
		this.art_pic4 = art_pic4;
	}
	public byte[] getArt_pic5() {
		return art_pic5;
	}
	public void setArt_pic5(byte[] art_pic5) {
		this.art_pic5 = art_pic5;
	}
	public Integer getArt_code() {
		return art_code;
	}
	public void setArt_code(Integer art_code) {
		this.art_code = art_code;
	}
	
	
	
	
	

}

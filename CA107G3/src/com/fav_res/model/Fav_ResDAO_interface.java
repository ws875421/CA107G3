package com.fav_res.model;

import java.util.List;

public interface Fav_ResDAO_interface {

	public int insert(Fav_ResVo fav_ResVo);

	public int update(Fav_ResVo fav_ResVo);

	public int delete(String rep_res_no, String vendor_no);

	public List<Fav_ResVo> findByMem_No(String rep_res_no);

	public List<Fav_ResVo> getAll();
}

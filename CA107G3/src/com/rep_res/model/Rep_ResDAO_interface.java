package com.rep_res.model;

import java.util.List;

public interface Rep_ResDAO_interface {

	public int insert(Rep_ResVo rep_ResVo);

	public int update(Rep_ResVo rep_ResVo);

	public int delete(String rep_res_no);

	public Rep_ResVo findByPrimaryKey(String rep_res_no);

	public List<Rep_ResVo> getAll();
}

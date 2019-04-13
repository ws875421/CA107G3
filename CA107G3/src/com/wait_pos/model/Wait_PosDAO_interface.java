package com.wait_pos.model;

import java.util.List;

public interface Wait_PosDAO_interface {

	public int insert(Wait_PosVo posVo);

	public int update(Wait_PosVo posVo);

	public int delete(String posVo_no);

	public Wait_PosVo findByPrimaryKey(String posVo_no);

	public List<Wait_PosVo> getAll();

}

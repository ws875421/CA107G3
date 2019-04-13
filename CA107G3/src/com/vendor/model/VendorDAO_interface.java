package com.vendor.model;

import java.util.List;

public interface VendorDAO_interface {
	
	public int insert(VendorVo vendorVO);

	public int update(VendorVo vendor);

	public int delete(String vendor_no);

	public VendorVo findByPrimaryKey(String vendor_no);

	public List<VendorVo> getAll();

}

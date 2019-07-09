package com.charida.app.supplier.dto;

public class ServiceAreaDto implements CodeDto {
	
	private String mem_id ;
	private int area_seq ;
	private String service_area_code ;
	
	@Override
	public String getMem_id() {
		return mem_id ;
	}
	@Override
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id ;
	}
	@Override
	public int getSeq() {
		return area_seq ;
	}
	@Override
	public void setSeq(int type_seq) {
		this.area_seq = type_seq ;
	}
	@Override
	public String getCode() {
		return service_area_code ;
	}
	@Override
	public void setCode(String type_code) {
		this.service_area_code = type_code;
	}
	

}

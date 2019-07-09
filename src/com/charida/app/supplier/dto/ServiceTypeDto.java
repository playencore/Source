package com.charida.app.supplier.dto;

public class ServiceTypeDto implements CodeDto {
	
	private String mem_id ;
	private int type_seq ;
	private String type_code ;
	
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
		return type_seq ;
	}
	@Override
	public void setSeq(int type_seq) {
		this.type_seq = type_seq ;
	}
	@Override
	public String getCode() {
		return type_code ;
	}
	@Override
	public void setCode(String type_code) {
		this.type_code = type_code;
	}
	
	
	
}

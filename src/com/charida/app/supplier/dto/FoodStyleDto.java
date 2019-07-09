package com.charida.app.supplier.dto;

public class FoodStyleDto implements CodeDto {
	
	private String mem_id ;
	private int style_seq ;
	private String food_style_cood ;
	
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
		return style_seq ;
	}
	@Override
	public void setSeq(int type_seq) {
		this.style_seq = type_seq ;
	}
	@Override
	public String getCode() {
		return food_style_cood ;
	}
	@Override
	public void setCode(String type_code) {
		this.food_style_cood = type_code;
	}
	

}

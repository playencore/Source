package com.charida.app.supplier.dto;

public class PermissionDto {
	
	private String mem_id ; 
	private int permission_seq ;
	private int permission_yn ;
	private String disallowance_reason ;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getPermission_seq() {
		return permission_seq;
	}
	public void setPermission_seq(int permission_seq) {
		this.permission_seq = permission_seq;
	}
	public int getPermission_yn() {
		return permission_yn;
	}
	public void setPermission_yn(int permission_yn) {
		this.permission_yn = permission_yn;
	}
	public String getDisallowance_reason() {
		return disallowance_reason;
	}
	public void setDisallowance_reason(String disallowance_reason) {
		this.disallowance_reason = disallowance_reason;
	}
	
		
}

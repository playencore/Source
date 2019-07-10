package com.charida.app.supplier.dto;

import com.charida.app.member.dto.MemberDto;

public class SupplierDto {
	
	private String mem_id ;
	private int regist_num ;
	private String explanation ;
	private String name ;
	private int maximum_seating ;
	private int minimum_seating ;
	private int cert_file_id ;
	private String telegram_id ;
	private MemberDto memberDto ;
	private PermissionDto permissionDto ;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getRegist_num() {
		return regist_num;
	}
	public void setRegist_num(int regist_num) {
		this.regist_num = regist_num;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMaximum_seating() {
		return maximum_seating;
	}
	public void setMaximum_seating(int maximum_seating) {
		this.maximum_seating = maximum_seating;
	}
	public int getMinimum_seating() {
		return minimum_seating;
	}
	public void setMinimum_seating(int minimum_seating) {
		this.minimum_seating = minimum_seating;
	}
	public int getCert_file_id() {
		return cert_file_id;
	}
	public void setCert_file_id(int cert_file_id) {
		this.cert_file_id = cert_file_id;
	}
	public String getTelegram_id() {
		return telegram_id;
	}
	public void setTelegram_id(String telegram_id) {
		this.telegram_id = telegram_id;
	}
	public MemberDto getMemberDto() {
		return memberDto;
	}
	public void setMemberDto(MemberDto memberDto) {
		this.memberDto = memberDto;
	}
	public PermissionDto getPermissionDto() {
		return permissionDto;
	}
	public void setPermissionDto(PermissionDto permissionDto) {
		this.permissionDto = permissionDto;
	}
	
	
	
}

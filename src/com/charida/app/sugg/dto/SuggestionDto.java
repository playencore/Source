package com.charida.app.sugg.dto;

import java.sql.Timestamp;

public class SuggestionDto {
	private String sugg_id;
	private String mem_id;
	private String serv_id;
	private int per_bud;
	private Timestamp sugg_date;
	private String choose_yn;
	private Timestamp choose_date;
	
	public String getSugg_id() {
		return sugg_id;
	}
	public void setSugg_id(String sugg_id) {
		this.sugg_id = sugg_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getServ_id() {
		return serv_id;
	}
	public void setServ_id(String serv_id) {
		this.serv_id = serv_id;
	}
	public int getPer_bud() {
		return per_bud;
	}
	public void setPer_bud(int per_bud) {
		this.per_bud = per_bud;
	}
	public Timestamp getSugg_date() {
		return sugg_date;
	}
	public void setSugg_date(Timestamp sugg_date) {
		this.sugg_date = sugg_date;
	}
	public String getChoose_yn() {
		return choose_yn;
	}
	public void setChoose_yn(String choose_yn) {
		this.choose_yn = choose_yn;
	}
	public Timestamp getChoose_date() {
		return choose_date;
	}
	public void setChoose_date(Timestamp choose_date) {
		this.choose_date = choose_date;
	}
	
	
}

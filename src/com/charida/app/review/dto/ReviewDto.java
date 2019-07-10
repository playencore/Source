package com.charida.app.review.dto;

public class ReviewDto {
	private String serv_id;
	private String mem_id;
	private String serv_root;
	private String menu_score;
	private String price_score;
	private String serv_score;
	private String recommand;
	private String title;
	private String content;
	private String file_yn;
	private String blind_yn;
	private String review_date;
	
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getServ_id() {
		return serv_id;
	}
	public void setServ_id(String serv_id) {
		this.serv_id = serv_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getServ_root() {
		return serv_root;
	}
	public void setServ_root(String serv_root) {
		this.serv_root = serv_root;
	}
	public String getMenu_score() {
		return menu_score;
	}
	public void setMenu_score(String menu_score) {
		this.menu_score = menu_score;
	}
	public String getPrice_score() {
		return price_score;
	}
	public void setPrice_score(String price_score) {
		this.price_score = price_score;
	}
	public String getServ_score() {
		return serv_score;
	}
	public void setServ_score(String serv_score) {
		this.serv_score = serv_score;
	}
	public String getRecommand() {
		return recommand;
	}
	public void setRecommand(String recommand) {
		this.recommand = recommand;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile_yn() {
		return file_yn;
	}
	public void setFile_yn(String file_yn) {
		this.file_yn = file_yn;
	}
	public String getBlind_yn() {
		return blind_yn;
	}
	public void setBlind_yn(String blind_yn) {
		this.blind_yn = blind_yn;
	}
	
}

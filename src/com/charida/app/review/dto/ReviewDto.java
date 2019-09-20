package com.charida.app.review.dto;

import java.util.List;

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
	private String best_food_cg;
	private String best_food_option;
	private String worst_food_cg;
	private String worst_food_option;
	
	
	
	
	private List<Integer> picture;
	
	private int file_seq;
	private int file_id;
	private int servicePicture1;
	private int servicePicture2;
	private int servicePicture3;
	private int servicePicture4;
	private int servicePicture5;
	private int servicePicture6;
	
	
	public String getBest_food_cg() {
		return best_food_cg;
	}
	public void setBest_food_cg(String best_food_cg) {
		this.best_food_cg = best_food_cg;
	}
	public String getBest_food_option() {
		return best_food_option;
	}
	public void setBest_food_option(String best_food_option) {
		this.best_food_option = best_food_option;
	}
	public String getWorst_food_cg() {
		return worst_food_cg;
	}
	public void setWorst_food_cg(String worst_food_cg) {
		this.worst_food_cg = worst_food_cg;
	}
	public String getWorst_food_option() {
		return worst_food_option;
	}
	public void setWorst_food_option(String worst_food_option) {
		this.worst_food_option = worst_food_option;
	}
	public int getFile_seq() {
		return file_seq;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public List<Integer> getPicture() {
		return picture;
	}
	public void setPicture(List<Integer> picture) {
		this.picture = picture;
	}
	public int getServicePicture1() {
		return servicePicture1;
	}
	public int getServicePicture2() {
		return servicePicture2;
	}
	public int getServicePicture3() {
		return servicePicture3;
	}
	public int getServicePicture4() {
		return servicePicture4;
	}
	public int getServicePicture5() {
		return servicePicture5;
	}
	public int getServicePicture6() {
		return servicePicture6;
	}
	public void setServicePicture1(int servicePicture1) {
		this.servicePicture1 = servicePicture1;
	}
	public void setServicePicture2(int servicePicture2) {
		this.servicePicture2 = servicePicture2;
	}
	public void setServicePicture3(int servicePicture3) {
		this.servicePicture3 = servicePicture3;
	}
	public void setServicePicture4(int servicePicture4) {
		this.servicePicture4 = servicePicture4;
	}
	public void setServicePicture5(int servicePicture5) {
		this.servicePicture5 = servicePicture5;
	}
	public void setServicePicture6(int servicePicture6) {
		this.servicePicture6 = servicePicture6;
	}
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

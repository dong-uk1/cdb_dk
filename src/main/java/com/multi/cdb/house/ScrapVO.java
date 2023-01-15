package com.multi.cdb.house;

import org.springframework.stereotype.Component;

@Component
public class ScrapVO {
	private String scrap_title;
	private String scrap_link;
	private String scrap_type;
	private String scrap_member;
	
	public String getScrap_title() {
		return scrap_title;
	}
	public void setScrap_title(String scrap_title) {
		this.scrap_title = scrap_title;
	}
	public String getScrap_link() {
		return scrap_link;
	}
	public void setScrap_link(String scrap_link) {
		this.scrap_link = scrap_link;
	}
	public String getScrap_type() {
		return scrap_type;
	}
	public void setScrap_type(String scrap_type) {
		this.scrap_type = scrap_type;
	}
	public String getScrap_member() {
		return scrap_member;
	}
	public void setScrap_member(String scrap_member) {
		this.scrap_member = scrap_member;
	}
	
	@Override
	public String toString() {
		return "ScrapVO [scrap_title=" + scrap_title + ", scrap_link=" + scrap_link + ", scrap_type=" + scrap_type
				+ ", scrap_member=" + scrap_member + "]";
	}
	

}

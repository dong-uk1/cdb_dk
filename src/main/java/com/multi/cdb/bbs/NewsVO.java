package com.multi.cdb.bbs;


import java.util.Date;


public class NewsVO {
	private String no;
	private String title;
	private String link;
	private String category;
	private String author;
	private Date pubdate;
	private String description;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getPubdate() {
		return pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "NewsVO [no=" + no + ", title=" + title + ", link=" + link + ", category=" + category + ", author="
				+ author + ", pubdate=" + pubdate + ", description=" + description + "]";
	}

	

}

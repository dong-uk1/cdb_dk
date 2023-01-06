package com.multi.cdb.bbs;

public class ReplyVO {
	
	int reply_id;
	String member_id;
	String reply_contents;
	int bbs_Id;
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReply_contents() {
		return reply_contents;
	}
	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}
	public int getBbs_Id() {
		return bbs_Id;
	}
	public void setBbs_Id(int bbs_Id) {
		this.bbs_Id = bbs_Id;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_id=" + reply_id + ", member_id=" + member_id + ", reply_contents=" + reply_contents
				+ ", bbs_Id=" + bbs_Id + "]";
	}
	
	
}

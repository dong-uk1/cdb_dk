package com.multi.cdb.member;

public class MemberVO {
	String member_id;
	String member_pw;
	String member_name;
	String member_home;
	String member_birth;
	String member_gen;
	String member_tel;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_home() {
		return member_home;
	}

	public void setMember_home(String member_home) {
		this.member_home = member_home;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_gen() {
		return member_gen;
	}

	public void setMember_gen(String member_gen) {
		this.member_gen = member_gen;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", member_home=" + member_home + ", member_birth=" + member_birth + ", member_gen=" + member_gen
				+ ", member_tel=" + member_tel + "]";
	}

}

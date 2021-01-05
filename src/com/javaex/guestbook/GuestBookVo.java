package com.javaex.guestbook;

public class GuestBookVo {
	
	//필드
	public int no;
	public String name, pw, content, date;
	
	
	//생성자
	public GuestBookVo() {}
	
	public GuestBookVo(int no, String name, String pw, String content, String date) {
		this.no = no;
		this.name = name;
		this.pw = pw;
		this.content = content;
		this.date = date;
	}
	
	
	
	public GuestBookVo(String name, String pw, String content, String date) {
	
		this.name = name;
		this.pw = pw;
		this.content = content;
		this.date = date;
	}

	public GuestBookVo(String name, String pw, String content) {
		
		this.name = name;
		this.pw = pw;
		this.content = content;
		
	}
	
	//g/s
	
	
	
	//메서드
	
	@Override
	public String toString() {
		return "GuestBookVo [no=" + no + ", name=" + name + ", password=" + pw + ", content=" + content
				+ ", date=" + date + "]";
	}
	
	
}

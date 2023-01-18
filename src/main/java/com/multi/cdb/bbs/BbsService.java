<<<<<<< HEAD
package com.multi.cdb.bbs;

public class BbsService {
	private int bbs_no;
	private int id;
	private String title;
	private String content;
	private String writer;

	public int getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "BbsVO [id=" + id + ", title=" + title + ", content=" + content + ", writer=" + writer + "]";
	}

}
=======
package com.multi.cdb.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BbsService implements BbsServiceInter {
	@Autowired
	BbsDAOInter dao;
	
	@Override
	public List<BbsVO> list() {
		return dao.list();
	}
	
	
}
>>>>>>> 8d1c19413864fe343b5f33f875caa98114e6c76d

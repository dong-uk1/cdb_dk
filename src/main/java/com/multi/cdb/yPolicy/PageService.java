package com.multi.cdb.yPolicy;

import org.springframework.stereotype.Service;

@Service //싱글톤
public class PageService {

	public int pages(int count) {
		int pages = 0;
		if(count % 30 == 0) {
			pages = count / 30; //120개 --> 12pages
		}else {
			pages = count / 30 + 1; //122개 --> 13pages 
		}
		return pages;
	}
	
}

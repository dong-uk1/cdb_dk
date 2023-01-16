package com.multi.cdb.house;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private BuyDAOInterface dao;
	
	@Setter(onMethod_ = @Autowired)
	private BorrowDAOInterface dao2;
	
	@Test
	public void test() {
		log.info(dao.show_pbname("741"));
	}
	
	@Test
	public void test2() {
		Map <String, Object> map = new HashMap<String, Object>();
		String br_pbid = "12799";
		String br_brtc = "경기도";
		map.put("br_pbid", br_pbid);
		map.put("br_brtc", br_brtc);
		log.info(dao2.detail(map));
	}
	
	@Test
	public void test3() {
		String br_brtc= "전라남도";
		log.info(dao2.city(br_brtc));
	}
}

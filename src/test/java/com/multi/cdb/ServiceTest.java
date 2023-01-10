package com.multi.cdb;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ServiceTest {

	@Autowired
	private BorrowService service;

	@Autowired
	private BuyService service2;

	BorrowVO borrow = new BorrowVO();

	/*
	 * 여기는 buy test
	 */
	@Test
	// service 제대로 주입 가능한지 테스트
	public void borrow_testExist() {
		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void borrow_all() {
		service.all().forEach(borrow -> log.info(borrow));
	}

	@Test
	public void borrow_city() {
		String br_brtc = "부산광역시";
		service.city(br_brtc).forEach(borrow -> log.info(borrow));
	}

	@Test
	public void borrow_detail() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("br_pbid", "12799");
		map.put("br_brtc", "세종특별자치시");
		service.detail(map).forEach(borrow -> log.info(borrow));
	}

	BuyVO buy = new BuyVO();

	/*
	 * 여기서 부터는 buy test
	 */
	@Test
	public void buy_testExist() {
		log.info(service2);
		assertNotNull(service2);
	}

	@Test
	public void buy_all() {
		service2.all().forEach(buy -> log.info(buy));
	}

	@Test
	public void buy_city() {
		String by_brtc = "경기도";
		service2.city(by_brtc).forEach(buy -> log.info(buy));
	}

	@Test
	public void buy_detail() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("by_pbid", "741");
		map.put("by_brtc", "경기도");
		service2.detail(map).forEach(buy -> log.info(buy));
	}
}

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

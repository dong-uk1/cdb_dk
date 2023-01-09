package com.multi.cdb.yPolicy;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

@Component
public class YPolicyDAOImpl implements YPolicyDAOInterface {

	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public void insert(YPolicyVO vo) {
		// insert into YP values (#{YP_ID}, #{YP_NAME}, #{YP_PI}, #{YP_INFO}, #{YP_CATEGORY}, #{YP_SSIZE}, #{YP_CONTENT}, #{YP_RQMAGE}, #{YP_RQMJOB}, #{YP_RQMEDU}, #{YP_RQMMAJR}, #{YP_RQMFIELD}, #{YP_AI}, #{YP_PERIOD}, #{YP_PROCEDURE}, #{YP_ANM}, #{YP_URL}, NULL, NULL)
		my.insert("yp.insert", vo);
	}

	@Override
	public void update(YPolicyVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<YPolicyVO> search(YPolicyVO vo) {
		// select YP_CATEGORY, YP_NAME, YP_PI from YP where YP_NAME = #{YP_NAME} and YP_CATEGORY = #{YP_CATEGORY} and YP_REGION = #{YP_REGION}
		return my.selectList("yp.search", vo);
	}

	@Override
	public List<YPolicyVO> YpList() {
		// select YP_CATEGORY, YP_NAME, YP_PI from YP
		return my.selectList("yp.all");
		/* mongoDB로 실행해봄
		 * Query query = new Query(); return mongo.find(query, YPolicyVO.class, "yp");
		 */
	}
	
	@Override
	public List<YPolicyVO> selectOne(String YP_CATEGORY){
		// select YP_CATEGORY, YP_NAME, YP_PI from YP where YP_CATEGORY = #{YP_CATEGORY}
		return my.selectList("yp.selectOne", YP_CATEGORY);
	}
	
	@Override
	public List<YPolicyVO> detailOne(String YP_NAME) {
		// select * from YP where YP_NAME = #{YP_NAME}
		return my.selectList("yp.detailOne", YP_NAME);
	}

}

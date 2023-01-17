package com.multi.cdb.job;

import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class GetApiData {
	@Autowired
	JobDAO dao;

	public void main() {

		ArrayList<JobVO> list = new ArrayList<JobVO>();

		try {
			for (int page = 1; page <= 5; page++) {

				// 소셜 로그인 , 공공api 등의 url
				String url = "https://openapi.work.go.kr/opi/opi/opia/wantedApi.do?authKey=WNLBYCQ6O7J85X4DTL2752VR1HJ&callTp=L&returnType=XML&startPage="+ page + "&display=100";

				// Spring boot에서 제공하는 RestTemplate
				RestTemplate restTemplate = new RestTemplate();
				restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));

				// 1. api호출하여 결과를 가져오기
				// 대부분의 api는 get형태가 많다 = 정보를 가져오거나 받아오는 형태
				// RestTemplate.getForObject(URI url, Class<T> responseTyPe) => (호출하는 url, 반환타입)
				String response = restTemplate.getForObject(url, String.class);

				// XML을 JSON Object로 변환하기
				JSONObject jobj = XML.toJSONObject(response);
				// byte[] jobj2 = jobj.toString().getBytes("utf-8");

				// 변환된 데이터 확인
				// {"response":{"emps":{"emp":[{"name":"one","id":1},{"name":"two","id":2},{"name":"three","id":3}]}}}
				System.out.println("--------------jobj.toString---------------");
				System.out.println(jobj);

				// 3. 데이터에서 꺼내어쓰기

				JSONObject jobj1 = jobj.getJSONObject("wantedRoot");

				// {"item":[{"name":"one","id":1},{"name":"two","id":2},{"name":"three","id":3}]}
//				 System.out.println("--------------jobj1---------------");
//				 System.out.println(jobj1.toString());

				// 배열 형태이니 반복문을 이용

				JSONArray jarr = jobj1.getJSONArray("wanted");
				System.out.println(jarr.length());

				SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
//			String stringDate = "채용시까지";

				for (int i = 1; i < jarr.length(); i++) {
					// {"yP_ID":"~~~","yP_NAME":"~~", ...}

					String job_wantedAuthNo = jarr.getJSONObject(i).getString("wantedAuthNo");
					String job_company = jarr.getJSONObject(i).getString("company");
					String job_title = jarr.getJSONObject(i).getString("title");
					String job_salTpNm = jarr.getJSONObject(i).getString("salTpNm");
					String job_sal = jarr.getJSONObject(i).getString("sal");
					int job_minSal = jarr.getJSONObject(i).getInt("minSal");
					int job_maxSal = jarr.getJSONObject(i).getInt("maxSal");
					String job_region = jarr.getJSONObject(i).getString("region");
					String job_holidayTpNm = jarr.getJSONObject(i).getString("holidayTpNm");
					String job_minEdubg = jarr.getJSONObject(i).getString("minEdubg");
					String job_career = jarr.getJSONObject(i).getString("career");
					// java.util.Date job_regDt =
					// format.parse(jarr.getJSONObject(i).getString("regDt"));
					/*
					 * String jRegDt = jarr.getJSONObject(i).getString("regDt");
					 *
					 * java.text.ParseException: Unparseable date: "채용시까지  23-03-04" 채용시까지를 자르고 뒤에만
					 * 가져가기 위한 시도였음. if(jRegDt.length() > 8) { String[] array = jRegDt.split(" ");
					 * java.util.Date job_regDt = format.parse(array[1]);
					 * 
					 * }else { java.util.Date job_regDt =
					 * format.parse(jarr.getJSONObject(i).getString("regDt")); }
					 * 
					 * ver.2 if(.equals(stringDate)) {}
					 */
//				java.util.Date job_closeDt = format.parse(jarr.getJSONObject(i).getString("closeDt"));
					String job_regDt = jarr.getJSONObject(i).getString("regDt");
					String job_closeDt = jarr.getJSONObject(i).getString("closeDt");
					String job_wantedInfoUrl = jarr.getJSONObject(i).getString("wantedInfoUrl");
					String job_wantedMobileInfoUrl = jarr.getJSONObject(i).getString("wantedMobileInfoUrl");
					int job_zipCd = jarr.getJSONObject(i).getInt("zipCd");
					int job_strtnmCd = jarr.getJSONObject(i).getInt("strtnmCd");
					String job_basicAddr = jarr.getJSONObject(i).getString("basicAddr");
//					String job_detailAddr = jarr.getJSONObject(i).getString("detailAddr");
					int job_empTpCd = jarr.getJSONObject(i).getInt("empTpCd");
					int job_jobsCd = jarr.getJSONObject(i).getInt("jobsCd");
					String job_prefCd = jarr.getJSONObject(i).getString("prefCd");

					JobVO vo = new JobVO(job_wantedAuthNo, job_company, job_title, job_salTpNm, job_sal, job_minSal,
							job_maxSal, job_region, job_holidayTpNm, job_minEdubg, job_career, job_regDt, job_closeDt,
							job_wantedInfoUrl, job_wantedMobileInfoUrl, job_zipCd, job_strtnmCd, job_basicAddr,
							job_empTpCd, job_jobsCd, job_prefCd);

					
					/*
					 * JobVO vo = new JobVO(job_wantedAuthNo, job_company, job_title, job_salTpNm,
					 * job_sal, job_minSal, job_maxSal, job_region, job_holidayTpNm, job_minEdubg,
					 * job_career, job_regDt, job_closeDt, job_wantedInfoUrl,
					 * job_wantedMobileInfoUrl, job_zipCd, job_strtnmCd, job_basicAddr,
					 * job_detailAddr, job_empTpCd, job_jobsCd, job_prefCd);
					 */

					dao.insert(vo);
					list.add(vo);

				}

				System.out.println("--------------jarr---------------");
				System.out.println(jarr);
				System.out.println(page);

				// map.put("jobj", jobj.toString());

				// String ret1 = jobj.getString("items"); //y
				// String ret2 = jobj.getString("data"); //123

				// System.out.println(ret1 + "," + ret2);

			} // for
		} // try
		catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		// [JSONObject, JSONObject, JSONObject] ==> {VO, VO, VO}
	}

}

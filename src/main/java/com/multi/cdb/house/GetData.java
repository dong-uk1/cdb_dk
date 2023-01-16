package com.multi.cdb.house;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/cdb")
public class GetData {

	@Autowired
	BorrowDAOInterface dao;

	@Autowired
	BuyDAOInterface dao2;

	@GetMapping("/borrow")
	public String getBorrowData(BorrowVO vo) {
		// Stringbuffer(문자열 추가 혹은 변경) 객체 추가
		StringBuffer result = new StringBuffer();
		String jsonPrintString = null;
		try {

			// api url 주소
			String apiUrl = "http://apis.data.go.kr/1613000/HWSPR02/rsdtRcritNtcList?"
					+ "serviceKey=pABfPJQMPmS/e5jUDA/ljQb85NfvBWLV0l7GsNHLD3XnFiYuNElsnqRS9Cg8cZfEDgZVEcdzCVnm0/gkE3nskw=="
					+ "&numOfRows=200&pageNo=3";

			// URL 객체 생성
			URL url = new URL(apiUrl);

			// http 프로토콜로 urlConnection 객체 생성 (url객체를 httpurlconnection타입으로 형변환)
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();

			urlConnection.connect();

			// 바이트 단위로 파일을 읽어들임.
			BufferedInputStream bufferedInputStream = new BufferedInputStream(urlConnection.getInputStream());
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(bufferedInputStream, "UTF-8"));
			String returnLine;

			// bufferedReader가 널일때까지 StringBuffer에 append
			while ((returnLine = bufferedReader.readLine()) != null) {
				result.append(returnLine);
			}

			// String형으로 변환
			jsonPrintString = result.toString();

			JSONParser parser = new JSONParser();
			JSONObject object = (JSONObject) parser.parse(jsonPrintString);

			// 응답 json 키값으로 파싱하기
			JSONObject response = (JSONObject) object.get("response");
			JSONObject body = (JSONObject) response.get("body");
			JSONArray itemArr = (JSONArray) body.get("item");

			SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");

			// 넘어오는전체 데이터 개수 확인하기
			log.info(itemArr.size());
			for (int i = 0; i < itemArr.size(); i++) {
				object = (JSONObject) itemArr.get(i);
				String suplyHoCo = String.valueOf(object.get("suplyHoCo")); // 공급호수(전세임대)
				// 빈 문자열("") 넘어올시 null로 처리해줌.
				if (!StringUtils.hasText(suplyHoCo)) {
					suplyHoCo = null;
				}
				String pblancId = String.valueOf(object.get("pblancId")); // 공고 id
				int houseSn = Integer.parseInt(String.valueOf(object.get("houseSn"))); // 단지 일련번호
				String sttusNm = String.valueOf(object.get("sttusNm")); // 상태명
				String pblancNm = String.valueOf(object.get("pblancNm")); // 공고명
				String suplyInsttNm = String.valueOf(object.get("suplyInsttNm")); // 공급 기관명
				String houseTyNm = String.valueOf(object.get("houseTyNm")); // 주택유형명
				String suplyTyNm = String.valueOf(object.get("suplyTyNm")); // 공급유형명
				String rcritPblancDe = String.valueOf(object.get("rcritPblancDe")); // 모집공고일자
				String przwnerPresnatnDe = String.valueOf(object.get("przwnerPresnatnDe")); // 당첨자발표일자
				String refrnc = String.valueOf(object.get("refrnc")); // 문의처
				String url_d = String.valueOf(object.get("url")); // 모집공고 url
				String hsmpNm = String.valueOf(object.get("hsmpNm")); // 단지명
				String brtcNm = String.valueOf(object.get("brtcNm")); // 광역시도명
				String signguNm = String.valueOf(object.get("signguNm")); // 시군구명
				String fullAdres = String.valueOf(object.get("fullAdres")); // 전체주소
				// 빈문자열("")이 넘어올 시 int로 형변환하다가 NumberFormatException 예외 발생해서
				// "" -> "0"으로 치환후 정수 0으로 처리해줌.
				String totstr = String.valueOf(object.get("totHshldCo"));
				if (!StringUtils.hasText(totstr)) {
					totstr = "0";
				}
				int totHshldCo = Integer.parseInt(totstr); // 총 세대수
				int sumSuplyCo = Integer.parseInt(String.valueOf(object.get("sumSuplyCo"))); // 공급 호수
				int rentGtn = Integer.parseInt(String.valueOf(object.get("rentGtn"))); // 최소임대보증금
				int enty = Integer.parseInt(String.valueOf(object.get("enty"))); // 최소계약금
				int prtpay = Integer.parseInt(String.valueOf(object.get("prtpay"))); // 최소 중도금
				int surlus = Integer.parseInt(String.valueOf(object.get("surlus"))); // 최소 잔금
				int mtRntchrg = Integer.parseInt(String.valueOf(object.get("mtRntchrg"))); // 최소 월임대료
				String beginDe = String.valueOf(object.get("beginDe")); // 모집 시작 일자
				String endDe = String.valueOf(object.get("endDe")); // 모집 종료 일자

				vo.setBr_pbid(pblancId);
				vo.setBr_suplyhoco(suplyHoCo);
				vo.setBr_housesn(houseSn);
				vo.setBr_state(sttusNm);
				vo.setBr_pbname(pblancNm);
				vo.setBr_suplyint(suplyInsttNm);
				vo.setBr_housetype(houseTyNm);
				vo.setBr_suplytype(suplyTyNm);
				vo.setBr_recrude((Date) date.parse(rcritPblancDe));
				vo.setBr_winannde((Date) date.parse(przwnerPresnatnDe));
				vo.setBr_url(url_d);
				vo.setBr_brtc(brtcNm);
				vo.setBr_signgu(signguNm);
				vo.setBr_fulladdr(fullAdres);
				vo.setBr_hsmp(hsmpNm);
				vo.setBr_totalhshold(totHshldCo);
				vo.setBr_sumsuplyco(sumSuplyCo);
				vo.setBr_rentgtn(rentGtn);
				vo.setBr_entity(enty);
				vo.setBr_prtpay(prtpay);
				vo.setBr_surlus(surlus);
				vo.setBr_monthrent(mtRntchrg);
				vo.setBr_beginde((Date) date.parse(beginDe));
				vo.setBr_end((Date) date.parse(endDe));
				vo.setBr_refrnc(refrnc);
				
				
				dao.insert(vo);
				
				// 총 453개의 데이터가 넘어옴.
				// 1) numofRows=200 pageNo=1  --> 200
				// 2) numOfRows=200 pageNo=2  --> 200
				// 3) numOfRows=200 pageNo=3  --> 70
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jsonPrintString;
	}

	@GetMapping("/buy")
	public String getButData(BuyVO vo) {
		StringBuffer result = new StringBuffer();
		String jsonPrintString = null;
		try {
			String apiUrl = "http://apis.data.go.kr/1613000/HWSPR02/ltRsdtRcritNtcList?"
					+ "serviceKey=pABfPJQMPmS/e5jUDA/ljQb85NfvBWLV0l7GsNHLD3XnFiYuNElsnqRS9Cg8cZfEDgZVEcdzCVnm0/gkE3nskw=="
					+ "&numOfRows=100&pageNo=1";
			URL url = new URL(apiUrl);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.connect();
			BufferedInputStream bufferedInputStream = new BufferedInputStream(urlConnection.getInputStream());
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(bufferedInputStream, "UTF-8"));
			String returnLine;

			while ((returnLine = bufferedReader.readLine()) != null) {
				result.append(returnLine);
			}
			jsonPrintString = result.toString();

			JSONParser parser = new JSONParser();
			JSONObject object = (JSONObject) parser.parse(jsonPrintString);

			// 응답 json 키값으로 파싱하기
			JSONObject response = (JSONObject) object.get("response");
			JSONObject body = (JSONObject) response.get("body");
			JSONArray itemArr = (JSONArray) body.get("item");

			SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");

			// 넘어오는전체 데이터 개수 확인하기
			log.info(itemArr.size());
			for (int i = 0; i < itemArr.size(); i++) {
				object = (JSONObject) itemArr.get(i);
				String pblancId = String.valueOf(object.get("pblancId")); // 공고 id
				int houseSn = Integer.parseInt(String.valueOf(object.get("houseSn"))); // 단지 일련번호
				String sttusNm = String.valueOf(object.get("sttusNm")); // 상태명
				String pblancNm = String.valueOf(object.get("pblancNm")); // 공고명
				String suplyInsttNm = String.valueOf(object.get("suplyInsttNm")); // 공급 기관명
				String houseTyNm = String.valueOf(object.get("houseTyNm")); // 주택유형명
				String rcritPblancDe = String.valueOf(object.get("rcritPblancDe")); // 모집공고일자
				String przwnerPresnatnDe = String.valueOf(object.get("przwnerPresnatnDe")); // 당첨자발표일자
				String refrnc = String.valueOf(object.get("refrnc")); // 문의처
				String url_d = String.valueOf(object.get("url")); // 모집공고 url
				String hsmpNm = String.valueOf(object.get("hsmpNm")); // 단지명
				String brtcNm = String.valueOf(object.get("brtcNm")); // 광역시도명
				String signguNm = String.valueOf(object.get("signguNm")); // 시군구명
				String fullAdres = String.valueOf(object.get("fullAdres")); // 전체주소
				int sumSuplyCo = Integer.parseInt(String.valueOf(object.get("sumSuplyCo"))); // 공급 호수
				int enty = Integer.parseInt(String.valueOf(object.get("enty"))); // 최소계약금
				int prtpay = Integer.parseInt(String.valueOf(object.get("prtpay"))); // 최소 중도금
				int surlus = Integer.parseInt(String.valueOf(object.get("surlus"))); // 최소 잔금
				String beginDe = String.valueOf(object.get("beginDe")); // 모집 시작 일자
				String endDe = String.valueOf(object.get("endDe")); // 모집 종료 일자

				vo.setBy_pbid(pblancId);
				vo.setBy_housesn(houseSn);
				vo.setBy_state(sttusNm);
				vo.setBy_pbname(pblancNm);
				vo.setBy_suplyint(suplyInsttNm);
				vo.setBy_housetype(houseTyNm);
				vo.setBy_recrude((Date)date.parse(rcritPblancDe));
				vo.setBy_winannde((Date) date.parse(przwnerPresnatnDe));
				vo.setBy_refer(refrnc);
				vo.setBy_url(url_d);
				vo.setBy_hsmp(hsmpNm);
				vo.setBy_brtc(brtcNm);
				vo.setBy_signgu(signguNm);
				vo.setBy_fulladdr(fullAdres);
				vo.setBy_sumsuplyco(sumSuplyCo);
				vo.setBy_entity(enty);
				vo.setBy_prtpay(prtpay);
				vo.setBy_surlus(surlus);
				vo.setBy_beginde((Date) date.parse(beginDe));
				vo.setBy_end((Date) date.parse(endDe));
				
				dao2.insert(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jsonPrintString;
	}

}

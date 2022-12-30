package com.multi.cdb;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class BuyController {

	@GetMapping("/buy")
	public String callApi() {
		StringBuffer result = new StringBuffer();
		String jsonPrintString = null;
		try {
			String apiUrl = "http://apis.data.go.kr/1613000/HWSPR02/ltRsdtRcritNtcList?"
					+ "serviceKey=pABfPJQMPmS/e5jUDA/ljQb85NfvBWLV0l7GsNHLD3XnFiYuNElsnqRS9Cg8cZfEDgZVEcdzCVnm0/gkE3nskw=="
					+ "&pblancId=12774";
			URL url = new URL(apiUrl);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
//			urlConnection.setRequestMethod("GET");
			urlConnection.connect();
			BufferedInputStream bufferedInputStream = new BufferedInputStream(urlConnection.getInputStream());
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(bufferedInputStream, "UTF-8"));
			String returnLine;
			
			while((returnLine = bufferedReader.readLine()) != null) {
				result.append(returnLine);
			}
			jsonPrintString = result.toString();
			log.info("@@@@@@@@@@@@@@@@@@@@@@");
			log.info(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jsonPrintString;
	}
}

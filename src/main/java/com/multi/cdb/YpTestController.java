package com.multi.cdb;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@RestController
public class YpTestController {

	 @GetMapping("/yp-test")
	    public String ypApi() {
	        StringBuffer result = new StringBuffer();
	        String jsonPrintString = null;
	        try {
	        	String apiUrl = "https://www.youthcenter.go.kr/opi/empList.do?openApiVlak=5c0e90c4dbb47a74b3a37e0b&pageIndex=1&display=100";
	            URL url = new URL(apiUrl);
	            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
	            urlConnection.connect();
	            BufferedInputStream bufferedInputStream = new BufferedInputStream(urlConnection.getInputStream());
	            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(bufferedInputStream, "UTF-8"));
	            String returnLine;
	            while((returnLine = bufferedReader.readLine()) != null) {
	                result.append(returnLine);
	            }

	            JSONObject jsonObject = XML.toJSONObject(result.toString());
	            jsonPrintString = jsonObject.toString();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return jsonPrintString;
	    }
}

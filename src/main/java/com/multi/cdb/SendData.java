package com.multi.cdb;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SendData {

	private final static String BASE_URL = "http://apis.data.go.kr/1613000/HWSPR02/rsdtRcritNtcList";
	private final String API_KEY = "pABfPJQMPmS/e5jUDA/ljQb85NfvBWLV0l7GsNHLD3XnFiYuNElsnqRS9Cg8cZfEDgZVEcdzCVnm0/gkE3nskw==";
	@RequestMapping(value = "/api", produces = "application/json; charset=utf8")
	public String getData(Model model) {

		String serviceKey = API_KEY;
		String pblancId = "12774";
		String pageNo = "1";
		String numOfRows = "8";

		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(BASE_URL);
		factory.setEncodingMode(DefaultUriBuilderFactory.EncodingMode.VALUES_ONLY);

		WebClient webClient = WebClient.builder().uriBuilderFactory(factory).baseUrl(BASE_URL).build();
		
		String response = webClient.get()
				.uri(uriBuilder -> uriBuilder.queryParam("serviceKey", serviceKey).queryParam("pblancId", pblancId)
						.queryParam("pageNo", pageNo).queryParam("numOfRows", numOfRows).build())
				.retrieve().bodyToMono(String.class).block();

		model.addAttribute("response", response);
		
		log.info("@@@@@@@@@@@@@@@@");
		log.info(factory);
		log.info(model);
		log.info(response);
		return "test/test";
	}

}

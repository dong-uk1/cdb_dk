package com.multi.cdb.yPolicy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YPolicyController {

	@Autowired
	ApiTest2 apiTest2;
	
	@RequestMapping("yptest")
	public void name() {
	apiTest2.main();
}
}

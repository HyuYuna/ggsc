package ams.main.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

@Controller

public class RequestController {

	/*@RequestMapping(value = "/request_test.do", method = { RequestMethod.POST , RequestMethod.GET })*/
	public String request_test(HttpServletRequest request, ModelMap model)
	  throws Exception{
		return "request/request_test.main";
	}
	
}

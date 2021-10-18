package egovframework.mobile.com.util.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import egovframework.mobile.com.util.service.ComCodeService;

@Controller
public class ComCodeController {
	
	/** ComCodeService */
	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;
	
	
	
}
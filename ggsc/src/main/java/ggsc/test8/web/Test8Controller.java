package ggsc.test8.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.test0.service.Test0Service;
import ggsc.test0.service.Test0VO;
import ggsc.test1.service.Test1Service;
import ggsc.test1.service.Test1VO;
import ggsc.test8.service.Test8Service;
import ggsc.test8.service.Test8VO;

@Controller
public class Test8Controller {
	
	@Resource(name = "test0Service")
	private Test0Service test0Service;

	@Resource(name = "test1Service")
	private Test1Service test1Service;
	
	@Resource(name = "test8Service")
	private Test8Service test8Service;
	
	
	@RequestMapping(value = "/test8List.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test8List(Test8VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		

		Test0VO test0VO = new Test0VO();
		test0VO.setYsmHclassCd("G1");
		List<EgovMap> g1List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g1List" , g1List);
		
		model.addAttribute("vo", vo);
		
		return "test8/test8_list.main";
		
		
	}
	
	
	@RequestMapping(value = "/test8StateList_ajax.do" , method = RequestMethod.POST)
	public String test8StateList_ajax(Test8VO vo , HttpServletRequest request, ModelMap model) {
		
		List<EgovMap> list = test8Service.getTest8StateList(vo);
		model.addAttribute("list" , list);
		return "jsonView";
		
	}
	
	
	
	@RequestMapping(value = "/yumiList.do" , method = { RequestMethod.GET, RequestMethod.POST })
	public String yumiList(Test8VO vo , HttpServletRequest request , ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd" , mnuCd);
		

		Test0VO test0VO = new Test0VO();
		test0VO.setYsmHclassCd("G1");
		List<EgovMap> g1List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g1List" , g1List);
		
		model.addAttribute("vo", vo);
		
		return "test8/yumi_list.main";
		
	}
	
	
	@RequestMapping(value = "/yumiStateList_ajax.do" , method = RequestMethod.POST)
	public String yumiStateList_ajax(Test8VO vo , HttpServletRequest request , ModelMap model) {
		
		List<EgovMap> list = test8Service.getYumiStateList(vo);
		model.addAttribute("list", list);
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/appleList.do" , method = { RequestMethod.GET, RequestMethod.POST })
	public String appleList(Test8VO vo, HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd" , mnuCd);
		

		Test0VO test0VO = new Test0VO();
		test0VO.setYsmHclassCd("G1");
		List<EgovMap> g1List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g1List" , g1List);
		
		model.addAttribute("vo" , vo);
		
		
		return "test8/apple_list.main";
	
	}
	
	
	@RequestMapping(value = "/appleStateList_ajax.do" , method = { RequestMethod.GET, RequestMethod.POST})
	public String appleStateList_ajax(Test8VO vo , HttpServletRequest request , ModelMap model) {
		
		List<EgovMap> list = test8Service.getAppleStateList(vo);
		model.addAttribute("list", list);
		
		model.addAttribute("vo", vo);
		
		return "jsonView";
	}
	
	
	
	@RequestMapping(value = "/ysmStateList_ajax.do" , method = { RequestMethod.GET, RequestMethod.POST})
	public String ysmStateList_ajax(Test8VO vo , HttpServletRequest request , ModelMap model) {
		
		List<EgovMap> list = test8Service.getYsmStateList(vo);
		model.addAttribute("list" , list);
		
		model.addAttribute("vo" , vo);
		
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/randomList.do" , method = { RequestMethod.GET, RequestMethod.POST})
	public String randomList(Test8VO vo, HttpServletRequest request , ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd" , mnuCd);
		
		Test0VO test0VO = new Test0VO();
		test0VO.setYsmHclassCd("G1");
		List<EgovMap> g1List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g1List" , g1List);
		
		model.addAttribute("vo" , vo);
		
		return "test8/random_list.main";
		
	}
	
	
	@RequestMapping(value = "/randomStateList_ajax.do", method = RequestMethod.POST) 
	public String randomStateList_ajax(HttpServletRequest request, ModelMap model, Test8VO vo) {
		
		List<EgovMap> list = test8Service.getRandomStateList(vo);
		model.addAttribute("list" , list);
		
		model.addAttribute("vo" , vo);
		
		return "jsonView";
		
	}
	
	
	
	
	
	
	
	
	
	
}
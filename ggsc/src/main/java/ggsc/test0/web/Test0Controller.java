package ggsc.test0.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.test0.service.Test0Service;
import ggsc.test0.service.Test0VO;

@Controller
public class Test0Controller {

	
	@Resource(name = "test0Service")
	private Test0Service test0Service;
	
	
	@RequestMapping(value = "/test0List.do" , method = RequestMethod.GET) 
	public String test0Lisst(HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd" , mnuCd);
		return "test0/test0_list.main";
	}
	
	
	@RequestMapping(value = "/test0List_ajax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test0List_ajax(Test0VO vo , HttpServletRequest request, ModelMap model) {
		
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> list = test0Service.getTest0List(vo);
		model.addAttribute("list", list);
		int totalPageCnt = test0Service.getTest0ListTotCnt(vo);
		
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "jsonView";
		
	}
	
	
	@RequestMapping(value = "/test0Dtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test0Dtl(Test0VO vo, HttpServletRequest request, ModelMap model){	
		
		String schYsmHclassNm = request.getParameter("schYsmHclassNm") == null ? "" : request.getParameter("schYsmHclassNm");
		model.addAttribute("schYsmHclassNm" , schYsmHclassNm);
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		return "test0/test0_dtl.main";
	}
	
	
	
	@RequestMapping(value = "/test0Dtl_ajax.do", method = RequestMethod.POST)
	public String test0Dtl_ajax(HttpServletRequest request, ModelMap model, Test0VO vo){
		
		String addYsmHclassNm = request.getParameter("addYsmHclassNm") == null? "" : request.getParameter("addYsmHclassNm");
		String mclList = request.getParameter("mclList") == null ? "" : request.getParameter("mclList");
		String addYsmHclassCd = request.getParameter("addYsmHclassCd") == null ? "" : request.getParameter("addYsmHclassCd");
		String addYsmMclassNm = request.getParameter("addYsmMclassNm") == null ? "" : request.getParameter("addYsmMclassNm");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setRegId((String)map.get("userId"));
	 	
		if(addYsmHclassNm != "") {
			vo.setFirstIndex(1);
			vo.setSchYsmHclassNm(addYsmHclassNm);
			int testCnt = test0Service.getClassTest(vo);
			System.out.println("대분류 COUNT : " + testCnt);
			if(testCnt >0) {
				model.addAttribute("error" , "동일한 대분류명이 존재하여 생성할 수 없습니다");
				return "jsonView";
			} else {
				vo.setYsmHclassNm(addYsmHclassNm);
				test0Service.insertYsmHcd(vo);
			}
		}
		
		if(addYsmMclassNm != "") {
			vo.setFirstIndex(2);
			vo.setSchYsmHclassCd(addYsmHclassCd);
			vo.setSchYsmMclassNm(addYsmMclassNm);
			System.out.println("테스트겍" + vo.getSchYsmHclassCd());
			int testCnt = test0Service.getClassTest(vo);
			System.out.println("중분류 COUNT : " + testCnt);
			if(testCnt >0) {
				model.addAttribute("error" , "동일한 중분류명이 존재햐야 생성할 수 없습니다");
				return "jsonView";
			} else {
				vo.setYsmHclassCd(addYsmHclassCd);
				vo.setYsmMclassNm(addYsmMclassNm);
				test0Service.insertYsmMcd(vo);
			}
		}
		
		if(mclList != "") {
			vo.setYsmHclassCd(mclList);
			List<EgovMap> listM = test0Service.getTest0MList(vo);
			model.addAttribute("listM", listM);
		}
		
		List<EgovMap> listH = test0Service.getTest0HList(vo);
		model.addAttribute("listH", listH);
		System.out.println("대분류 관련 확인" + listH);
		model.addAttribute("vo", vo);
		
		return "jsonView";
	}
	
	
	
	
}
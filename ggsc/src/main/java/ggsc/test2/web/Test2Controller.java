package ggsc.test2.web;

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
import ggsc.test1.service.Test1Service;
import ggsc.test1.service.Test1VO;
import ggsc.test2.service.Test2Service;
import ggsc.test2.service.Test2VO;

@Controller
public class Test2Controller {
	
	@Resource(name = "test0Service")
	private Test0Service test0Service;

	@Resource(name = "test1Service")
	private Test1Service test1Service;
	
	@Resource(name = "test2Service")
	private Test2Service test2Service;

	
	@RequestMapping(value = "/test2List.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test2List(Test2VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test0VO test0VO = new Test0VO();
		test0VO.setYsmHclassCd("G1");
		List<EgovMap> g1List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g1List" , g1List);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> detail = test2Service.getTest2List(vo);
		model.addAttribute("detail", detail);
		int totalPageCnt = test2Service.getTest2ListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "test2/test2_list.main";
		
		
	}
	
	
	@RequestMapping(value = "/test2Dtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test2Dtl(Test2VO vo, HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("num" , num);
		
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test0VO test0VO = new Test0VO();
		test0VO.setYsmHclassCd("G1");
		List<EgovMap> g1List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g1List" , g1List);

		
		if(num !=""){
			EgovMap detail = null;
			int intNum = Integer.parseInt(num);
			detail = test2Service.getTest2Detail(intNum);
			model.addAttribute("detail", detail);
		}

		
		model.addAttribute("vo", vo);
		model.addAttribute("userId", loginVO.get("userId").toString());
		
		return "test2/test2_dtl.main";
	}
	
	
	
	@RequestMapping(value = "/test2Reg.do", method = RequestMethod.POST)
	public String test2Reg(HttpServletRequest request, ModelMap model, Test2VO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1List(test1);
		model.addAttribute("test1List", test1List);
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		String writer = (String)map.get("userNm");
		vo.setWriter(writer);
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			test2Service.insertTest2(vo);		
		} else if(save.equals("U")) {
			test2Service.updateTest2(vo);
		} else if(save.equals("D")) {
			test2Service.deleteTest2(vo);
		}
		return "redirect:/test2List.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/narcissusCheck_ajax.do", method = RequestMethod.POST)
	public String narcissusCheckAjax(HttpServletRequest request, ModelMap model){
		
		String title = request.getParameter("title") == null ? "" : request.getParameter("title");
		
		int niCk = test2Service.narcissusCheck(title);
		String narcissusCheck = "";
		String msg = "";
		if(niCk > 0){
			narcissusCheck = "N";
			msg = "이미 등록된 센터명입니다.";
		}else{
			narcissusCheck = "Y";
			msg = "등록 가능한 센터명입니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("narcissusCheck", narcissusCheck);
		return "jsonView";
	}
	
	
	
	
}
package ggsc.test1.web;

import java.io.IOException;

import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.test1.service.Test1Service;
import ggsc.test1.service.Test1VO;

@Controller
public class Test1Controller {

	
	@Resource(name = "test1Service")
	private Test1Service test1Service;
	
	
	@RequestMapping(value = "/test1List.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test1List(Test1VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> test1List = test1Service.getTest1List(vo);
		model.addAttribute("test1List", test1List);
		int totalPageCnt = test1Service.getTest1ListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "test1/test1_list.main";
		
		
	}
	
	
	@RequestMapping(value = "/test1Dtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test1Dtl(Test1VO vo, HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("mnuCd", mnuCd);
		
		EgovMap rescDtl = null;
		if(num !=""){
			int intNum = Integer.parseInt(num);
			rescDtl = test1Service.getTest1Detail(intNum);
		}
		
		model.addAttribute("currentPageNo", vo.getCurrentPageNo());
		model.addAttribute("detail", rescDtl);
		model.addAttribute("vo", vo);
		model.addAttribute("userId", loginVO.get("userId").toString());
		
		return "test1/test1_dtl.main";
	}
	
	
	
	@RequestMapping(value = "/test1Reg.do", method = RequestMethod.POST)
	public String test1Reg(HttpServletRequest request, ModelMap model, Test1VO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		String writer = (String)map.get("userNm");
		vo.setWriter(writer);
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			test1Service.insertTest1(vo);		
		} else if(save.equals("U")) {
			test1Service.updateTest1(vo);
		} else if(save.equals("D")) {
			test1Service.deleteTest1(vo);
		}
		return "redirect:/test1List.do?mnuCd=" + mnuCd;
	}
	
	
	
	
}
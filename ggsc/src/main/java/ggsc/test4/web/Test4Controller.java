package ggsc.test4.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ggsc.cnsmng.service.UserInfoVO;
import ggsc.test1.service.Test1Service;
import ggsc.test1.service.Test1VO;
import ggsc.test2.service.Test2Service;
import ggsc.test2.service.Test2VO;
import ggsc.test4.service.Test4Service;
import ggsc.test4.service.Test4VO;

@Controller
public class Test4Controller {

	@Resource(name = "test1Service")
	private Test1Service test1Service;
	
	@Resource(name = "test2Service")
	private Test2Service test2Service;
	
	@Resource(name = "test4Service")
	private Test4Service test4Service;
	
	
	@RequestMapping(value = "/test4List.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test4List(Test4VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);
		
		EgovMap loginVo = (EgovMap) request.getSession().getAttribute("LoginVO");
		String regId = loginVo.get("userId").toString();
		vo.setRegId(regId);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> detail = test4Service.getTest4List(vo);
		model.addAttribute("detail", detail);
		int totalPageCnt = test4Service.getTest4ListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "test4/test4_list.main";
		
		
	}
	
	
	@RequestMapping(value = "/test4Dtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test4Dtl(Test4VO vo, HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		
		String type = request.getParameter("type") == null ? "" : request.getParameter("type");
		
		EgovMap detail = null;
		if (type.equals("D")) {
			String ysmNo = request.getParameter("ysmNo") == null ? "" : request.getParameter("ysmNo");
			detail = test4Service.getTest4Detail(ysmNo);
		}
		
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);


		model.addAttribute("type", type);
		model.addAttribute("detail", detail);
		model.addAttribute("vo", vo);
		model.addAttribute("regId", loginVO.get("userId").toString());
		
		return "test4/test4_dtl";
	}
	
	
	
	@RequestMapping(value = "/ysmIdCheck_ajax.do", method = RequestMethod.POST)
	public String ysmIdCheckAjax(HttpServletRequest request, ModelMap model) {

		String ysmId = request.getParameter("ysmId") == null ? "" : request.getParameter("ysmId");
		int idYn = test4Service.idCheck(ysmId);
		String idCheck = "";
		String msg = "";
		if (idYn > 0) {
			idCheck = "N";
			msg = "이미 가입된 ID 입니다.";
		} else {
			idCheck = "Y";
			msg = "사용 가능한 ID 입니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("idCheck", idCheck);
		return "jsonView";
	}
	
	
	
	
	@RequestMapping(value = "/test4Reg.do", method = RequestMethod.POST)
	public String test4Reg(HttpServletRequest request, ModelMap model, Test4VO vo){
		
		System.out.println("ysmNo=="+request.getParameter("ysmNo"));
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1List(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);
		
		EgovMap login = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setRegId(login.get("userId").toString());
		
		
		test4Service.insertTest4(vo);	
		System.out.println("yuna=="+request.getParameter("ysmId"));
		test4Service.insertYsmUser(vo);	
		System.out.println("pw==="+request.getParameter("pw"));
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/test4Upd.do", method = RequestMethod.POST)
	public String test4Upd(HttpServletRequest request, ModelMap model, Test4VO vo){
		
		System.out.println("fate123"+request.getParameter("ysmId"));
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1List(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);
		
		
		test4Service.updateTest4(vo);
		test4Service.updateYsmUser(vo);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/test4Del.do", method = RequestMethod.POST)
	public String test4Del(HttpServletRequest request, ModelMap model, Test4VO vo){
		
		
		test4Service.deleteYsmUser(vo);
		test4Service.deleteTest4(vo);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "/ysmConfirm_ajax.do", method = RequestMethod.POST)
	public String confirmAjax(HttpServletRequest request, ModelMap model, Test4VO vo) {
		
		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");
		
		String regId = (String) login.get("userId");
		EgovMap details = test4Service.getTest4Detail(String.format("%s", vo.getYsmNo()));
		vo.setRegId(regId);
		vo.setFate(details.get("fate").toString());
		vo.setNarcissus(details.get("narcissus").toString());
		test4Service.updateConfirm(vo);
		String msg = "접수확인이 되었습니다.";

		model.addAttribute("msg", msg);
		return "jsonView";
		
	}
	
	@RequestMapping(value = "/findYsmUser.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String findYsmUser(HttpServletRequest request, ModelMap model, Test4VO vo) {
		String ysmNm = request.getParameter("ysmNm") == null ? "" : request.getParameter("ysmNm");
		if (ysmNm.length() > 0) {
			try {
				ysmNm = URLDecoder.decode(ysmNm, "UTF-8");
			} catch (UnsupportedEncodingException  e) {
				
			}
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> list = test4Service.findYsmUser(vo);
		int totalPageCnt = test4Service.getFindYsmUserTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		return "test4/findYsmUser";
		
		
	}
		
	
}
	
	
	
	
	
package ggsc.test3.web;

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
import ggsc.test3.service.Test3Service;
import ggsc.test3.service.Test3VO;
import ggsc.test4.service.Test4Service;
import ggsc.test4.service.Test4VO;

@Controller
public class Test3Controller {
	
	@Resource(name = "test0Service")
	private Test0Service test0Service;

	@Resource(name = "test1Service")
	private Test1Service test1Service;
	
	@Resource(name = "test2Service")
	private Test2Service test2Service;
	
	@Resource(name = "test3Service")
	private Test3Service test3Service;
	
	@Resource(name = "test4Service")
	private Test4Service test4Service;
	
	
	@RequestMapping(value = "/test3List.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test3List(Test3VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> detail = test3Service.getTest3List(vo);
		model.addAttribute("detail", detail);
		int totalPageCnt = test3Service.getTest3ListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "test3/test3_list.main";
		
		
	}
	
	
	@RequestMapping(value = "/test3List_ajax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test3List_ajax(Test3VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> list = test3Service.getTest3List(vo);
		model.addAttribute("list", list);
		int totalPageCnt = test3Service.getTest3ListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "jsonView";
		
		
	}
	
	
	@RequestMapping(value = "/test3Dtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test3Dtl(Test3VO t3vo, Test4VO t4vo , HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		String ysmYn = request.getParameter("ysmYn") == null ? "" : request.getParameter("ysmYn");
		String ysmId = request.getParameter("ysmId") == null ? "" : request.getParameter("ysmId");
		model.addAttribute("ysmId", ysmId);
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);


		if(save !="") {
			test3Service.updateTest3(t3vo);
			test4Service.updateYsmUser(t4vo);
		} 
		
		if(ysmYn !="") {
			test3Service.updateYunaYn(t3vo);
			test4Service.updateYsmYn(t4vo);
		}
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		if (t3vo.getYsmId() != null) {
			EgovMap detail = test3Service.getTest3Detail(ysmId);
			model.addAttribute("detail", detail);
		}
		
		model.addAttribute("page", request.getParameter("page"));
		model.addAttribute("vo", t3vo);
		model.addAttribute("userId", loginVO.get("userId").toString());
		
		return "test3/test3_dtl";
	}
	
	@RequestMapping(value = "/test3Dtl_ajax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test3Dtl_ajax(Test3VO vo, HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		String ysmId = request.getParameter("ysmId") == null ? "" : request.getParameter("ysmId");
		model.addAttribute("ysmId", ysmId);
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);

		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		if (vo.getYsmId() != null) {
			EgovMap detail = test3Service.getTest3Detail(ysmId);
			System.out.println("ysmId=======" + ysmId);
			model.addAttribute("detail", detail);
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("userId", loginVO.get("userId").toString());
		
		return "jsonview";
	}
	
	
	
	
	@RequestMapping(value = "/yuna_join_info.do", method = RequestMethod.GET)
	public String yuna_join_info(HttpServletRequest request, ModelMap model){
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);

		Test0VO test0VO = new Test0VO();
		test0VO.setYsmHclassCd("G1");
		List<EgovMap> g1List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g1List" , g1List);
		
		return "test3/yuna_join_info";
	}
	
	
	@RequestMapping(value = "/yuna_join_write.do", method = RequestMethod.POST)
	public String yuna_join_write(HttpServletRequest request, ModelMap model , Test3VO test3VO , Test4VO test4VO){
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		test3VO.setRegId(regId);
		test4VO.setRegId(regId);
		
		test3Service.insertYunaUser(test3VO);
		test4Service.insertYsmUser(test4VO);
		
		String msg = "가입이 완료 됐습니다";
		model.addAttribute("msg" , msg);
		
		return "test3/yuna_join_info";
	}
	
	
	@RequestMapping(value = "/securityYuna_popup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String securityYuna_popup(HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		model.addAttribute("userId", loginVO.get("userId").toString());
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		String ysmId = request.getParameter("ysmId") == null ? "" : request.getParameter("ysmId");
		model.addAttribute("ysmId", ysmId);
		
		Test1VO test1 = new Test1VO();
		List<EgovMap> test1List = test1Service.getTest1SelectList(test1);
		model.addAttribute("test1List", test1List);
		
		Test2VO test2 = new Test2VO();
		List<EgovMap> test2List = test2Service.getTest2SelectList(test2);
		model.addAttribute("test2List", test2List);


		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		EgovMap detail = test3Service.getTest3Detail(ysmId);
		model.addAttribute("detail", detail);
		
		
		return "test3/securityYuna_popup";
	}
	
	@RequestMapping(value = "/securityYuna_reg_ajax.do" , method = RequestMethod.POST)
	public String securityYuna_reg_ajax(HttpServletRequest request, ModelMap model, Test3VO vo) {
		
		test3Service.insertSecurity(vo);
	
		return "jsonView";
		
	}
	
}
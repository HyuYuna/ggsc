package ggsc.test7.web;

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
import ggsc.test0.service.Test0Service;
import ggsc.test0.service.Test0VO;
import ggsc.test1.service.Test1Service;
import ggsc.test1.service.Test1VO;
import ggsc.test2.service.Test2Service;
import ggsc.test2.service.Test2VO;
import ggsc.test3.service.Test3Service;
import ggsc.test4.service.Test4Service;
import ggsc.test6.service.Test6Service;
import ggsc.test6.service.Test6VO;
import ggsc.test7.service.Test7Service;
import ggsc.test7.service.Test7VO;
import ggsc.test7.service.yunaInfoVO;

@Controller
public class Test7Controller {
	
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
	
	@Resource(name = "test6Service")
	private Test6Service test6Service;
	
	@Resource(name = "test7Service")
	private Test7Service test7Service;
	
	
	@RequestMapping(value = "/test7List.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test7List(Test6VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
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
		
		test0VO.setYsmHclassCd("G2");
		List<EgovMap> g2List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g2List" , g2List);
		
		test0VO.setYsmHclassCd("G3");
		List<EgovMap> g3List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g3List" , g3List);
		
		test0VO.setYsmHclassCd("G4");
		List<EgovMap> g4List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g4List" , g4List);
		
		test0VO.setYsmHclassCd("G5");
		List<EgovMap> g5List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g5List" , g5List);
		
		test0VO.setYsmHclassCd("G6");
		List<EgovMap> g6List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g6List" , g6List);
		
		test0VO.setYsmHclassCd("G7");
		List<EgovMap> g7List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g7List" , g7List);


		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> detail = test7Service.getTest7List(vo);
		model.addAttribute("detail", detail);
		
		
		List<EgovMap> g2detail = test7Service.getTest7G2List(vo);
		model.addAttribute("g2detail", g2detail);
		
		List<EgovMap> g3detail = test7Service.getTest7G3List(vo);
		model.addAttribute("g3detail", g3detail);
		
		
		
		List<EgovMap> t6detail = test6Service.getTest6List(vo);
		model.addAttribute("t6detail", t6detail);
		
		int totalPageCnt = test7Service.getTest7ListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		return "test7/test7_list.main";
		
		
	}
	
	
	@RequestMapping(value = "/test7Dtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test7Dtl(Test6VO vo, HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
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
		
		test0VO.setYsmHclassCd("G2");
		List<EgovMap> g2List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g2List" , g2List);
		
		test0VO.setYsmHclassCd("G3");
		List<EgovMap> g3List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g3List" , g3List);
		
		test0VO.setYsmHclassCd("G4");
		List<EgovMap> g4List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g4List" , g4List);
		
		test0VO.setYsmHclassCd("G5");
		List<EgovMap> g5List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g5List" , g5List);
		
		test0VO.setYsmHclassCd("G6");
		List<EgovMap> g6List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g6List" , g6List);
		
		test0VO.setYsmHclassCd("G7");
		List<EgovMap> g7List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g7List" , g7List);

		
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		if (vo.getNum() != null) {
			EgovMap detail = test7Service.getTest7Detail(vo);
			model.addAttribute("detail", detail);
		}

		
		model.addAttribute("vo", vo);
		model.addAttribute("userId",loginVO.get("userId").toString());
		
		return "test7/test7_dtl.main";
	}
	
	@RequestMapping(value = "/test7RegView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test7RegView(HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
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
		
		test0VO.setYsmHclassCd("G2");
		List<EgovMap> g2List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g2List" , g2List);
		
		test0VO.setYsmHclassCd("G3");
		List<EgovMap> g3List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g3List" , g3List);
		
		test0VO.setYsmHclassCd("G4");
		List<EgovMap> g4List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g4List" , g4List);
		
		test0VO.setYsmHclassCd("G5");
		List<EgovMap> g5List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g5List" , g5List);
		
		test0VO.setYsmHclassCd("G6");
		List<EgovMap> g6List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g6List" , g6List);
		
		test0VO.setYsmHclassCd("G7");
		List<EgovMap> g7List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g7List" , g7List);

		
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		
		model.addAttribute("userId",loginVO.get("userId").toString());
		
		return "test7/test7_reg.main";
	}
	
	
	
	@RequestMapping(value = "/test7Reg.do", method = RequestMethod.POST)
	public String test7Reg(HttpServletRequest request, ModelMap model, Test6VO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			test7Service.insertTest7(vo);		
		} else if(save.equals("U")) {
			test7Service.updateTest7(vo);
		} else if(save.equals("D")) {
			test7Service.deleteTest7(vo);
		}
		return "redirect:/test7List.do?mnuCd=" + mnuCd;
	}
	

	@RequestMapping(value = "/test7Insert.do", method = RequestMethod.POST)
	public String test7Insert(HttpServletRequest request, ModelMap model, Test6VO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		vo.setRegId(regId);
		
		test7Service.insertTest7(vo);		
		
		return "redirect:/test7List.do?mnuCd=" + mnuCd;
	}
	
	@RequestMapping(value = "/test7RegCheckAjax.do", method = RequestMethod.POST)
	public String test7RegCheckAjax(HttpServletRequest request, ModelMap model, Test6VO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		
		String ysmNoStr = request.getParameter("ysmNo");
		int ysmNo = Integer.parseInt(ysmNoStr);
		int result = test7Service.getTest7RegCheckAjax(ysmNo);
		
		model.addAttribute("result", result);
		
		return "redirect:/test7List.do?mnuCd=" + mnuCd;
	}
	
	
	
	@RequestMapping(value = "/noinClosePopup.do", method = {RequestMethod.GET , RequestMethod.POST})
	public String noinClosePopup(HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		Test0VO test0VO = new Test0VO();
		test0VO.setYsmHclassCd("G2");
		List<EgovMap> g2List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g2List" , g2List);
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		return "test7/noinClose.main";
	}
	
	@RequestMapping(value = "/noinCloseReg.do", method = {RequestMethod.GET , RequestMethod.POST})
	public String noinCloseReg(Test6VO vo ,HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		String num = request.getParameter("num");
		model.addAttribute("num",num);
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		test7Service.insertNoinClose(vo);
		
		return "redirect:/test7List.do?mnuCd=" + mnuCd;
	}
	

	@RequestMapping(value = "/noinGroupList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noinGroupList(Test6VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> detail = test7Service.getNoinGroupList(vo);
		model.addAttribute("detail", detail);
		
		List<EgovMap> t7detail = test7Service.getTest7List(vo);
		model.addAttribute("t7detail", t7detail);

		
		int totalPageCnt = test7Service.getNoinGroupTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		return "test7/noinGroup_list.main";
		
		
	}
	
	

	@RequestMapping(value = "/noinGroupDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noinGroupDtl(Test6VO vo, HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		
		EgovMap ngDtl = null;
		
		EgovMap replyDtl = null;
		if(num != "") {
			int intNum = Integer.parseInt(num);
			ngDtl = test7Service.getNoinGroupDtl(intNum);
			if (ngDtl != null) {
				String answerYn = (String) ngDtl.get("answerYn");
				if(answerYn.equals("Y")) {
					replyDtl = test7Service.getNoinGroupReplyDtl(intNum);
				}
			}
		}

		model.addAttribute("detail" , ngDtl);
		model.addAttribute("replyDtl" , replyDtl);
		model.addAttribute("vo", vo);
		model.addAttribute("userId",loginVO.get("userId").toString());
		
		return "test7/noinGroup_dtl.main";
	}
	
	
	
	@RequestMapping(value = "/noinGroupReg.do", method = RequestMethod.POST)
	public String noinGroupReg(HttpServletRequest request, ModelMap model, Test6VO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			test7Service.insertNoinGroup(vo);		
		} else if(save.equals("U")) {
			test7Service.updateNoinGroup(vo);
		}  else if(save.equals("R")) {
			test7Service.insertNoinGroupReply(vo);
		} else if(save.equals("RU")) {
			test7Service.updateNoinGroupReply(vo);
		}
		return "redirect:/noinGroupList.do?mnuCd=" + mnuCd;
	}
	

	@RequestMapping(value = "/noinGroupDel.do", method = RequestMethod.POST)
	public String noinGroupDel(HttpServletRequest request, ModelMap model, Test6VO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		vo.setRegId(regId);
		
		if(save.equals("D")) {
			test7Service.deleteNoinGroup(vo);		
		} else if(save.equals("RD")) {
			test7Service.deleteNoinGroupReply(vo);
		} 
		return "redirect:/noinGroupList.do?mnuCd=" + mnuCd;
	}
	
	
	@RequestMapping(value = "/addRequestList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addRequestList(Test6VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> t6detail = test6Service.getTest6List(vo);
		model.addAttribute("t6detail", t6detail);
		
		List<EgovMap> detail = test7Service.getAddRequestList(vo);
		model.addAttribute("detail" , detail);
		
		int totalPageCnt = test7Service.getAddRequestTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		
		return "test7/addRequest_list.main";
		
	}
	
	
	
	@RequestMapping(value = "/addRequestDtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addRequestDtl(Test7VO vo, HttpServletRequest request, ModelMap model){	

		EgovMap loginVO = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
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
		
		test0VO.setYsmHclassCd("G2");
		List<EgovMap> g2List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g2List" , g2List);
	
		
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		if (vo.getNum() != null) {
			EgovMap detail = test7Service.getAddRequestDetail(vo);
			model.addAttribute("detail", detail);
		}

		
		model.addAttribute("vo", vo);
		model.addAttribute("userId",loginVO.get("userId").toString());
		
		return "test7/addRequest_dtl.main";
	}
	
	
	@RequestMapping(value = "/addRequestReg.do" , method = RequestMethod.POST)
	public String addRequestReg(Test7VO vo, HttpServletRequest request, ModelMap model) {
		EgovMap login = (EgovMap) request.getSession().getAttribute("LoginVO");
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		
		String regId = (String)login.get("userId");
		vo.setRegId(regId);
		
		String addReqGb = vo.getAddReqGb();
		
		if (save.equals("S")) {
			if (addReqGb.equals("1")) {
				test7Service.insertAddInReq(vo);
			} else {
				test7Service.insertAddOutReq(vo);
			}
		} else {
			if (addReqGb.equals("1")) {
				vo.setNum(save);
				test7Service.updateAddInReq(vo);
			} else {
				vo.setNum(save);
				test7Service.updateAddOutReq(vo);
			}
		}
		
		
		model.addAttribute("mnuCd" , mnuCd);
		
		return "redirect:/addRequestList.do?mnuCd=" + mnuCd;
		
	}
	
	
	
	@RequestMapping(value = "/yunaDtl_ajax.do" , method = RequestMethod.POST)
	public String yunaDtl_ajax(Test7VO vo, HttpServletRequest request, ModelMap model) {
		
		String ysmId = request.getParameter("ysmId") == null ? "" : request.getParameter("ysmId");
		
		EgovMap Details = test3Service.getTest3Detail(ysmId);
		model.addAttribute("Detail" , Details);
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/findYunaPopup", method = { RequestMethod.GET, RequestMethod.POST })
	public String findYunaPopup(HttpServletRequest request, ModelMap model , yunaInfoVO vo){
		
		String ysmId = request.getParameter("ysmId") == null ? "" : request.getParameter("ysmId");
		if (ysmId.length() > 0) {
			try {
				ysmId = URLDecoder.decode(ysmId, "UTF-8");
			} catch (UnsupportedEncodingException  e) {
				
			}
		}

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);

		List<EgovMap> list = test7Service.findYunaPopup(vo);
		int totalPageCnt = test7Service.getFindYunaTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		return "test7/findYunaPopup";
	
	
	} 
	
	
	
}
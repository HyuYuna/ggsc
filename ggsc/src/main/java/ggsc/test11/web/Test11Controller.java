package ggsc.test11.web;

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
import ggsc.test11.service.Test11Service;
import ggsc.test11.service.Test11VO;
import ggsc.test2.service.Test2Service;

@Controller
public class Test11Controller {
	
	@Resource(name = "test0Service")
	private Test0Service test0Service;

	@Resource(name = "test1Service")
	private Test1Service test1Service;
	
	@Resource(name = "test2Service")
	private Test2Service test2Service;
	
	@Resource(name = "test11Service")
	private Test11Service test11Service;
	
	
	@RequestMapping(value = "/test11List.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test11List(Test11VO vo , HttpServletRequest request, ModelMap model) {
		
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
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
		
		test0VO.setYsmHclassCd("G5");
		List<EgovMap> g5List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g5List" , g5List);
		
		test0VO.setYsmHclassCd("G6");
		List<EgovMap> g6List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g6List" , g6List);
		
		test0VO.setYsmHclassCd("G7");
		List<EgovMap> g7List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g7List" , g7List);

		test0VO.setYsmHclassCd("G8");
		List<EgovMap> g8List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g8List" , g8List);
		
		test0VO.setYsmHclassCd("G10");
		List<EgovMap> g10List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g10List" , g10List);
		
		test0VO.setYsmHclassCd("G11");
		List<EgovMap> g11List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g11List" , g11List);
		
		test0VO.setYsmHclassCd("G12");
		List<EgovMap> g12List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g12List" , g12List);
		
		test0VO.setYsmHclassCd("G13");
		List<EgovMap> g13List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g13List" , g13List);
		
	
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(10); // 페이징 리스트의 사이즈

		vo.setFirstIndex((vo.getCurrentPageNo() - 1) * 10);
		vo.setLastIndex((vo.getCurrentPageNo()) * 10);
		
		List<EgovMap> detail = test11Service.getTest11List(vo);
		model.addAttribute("detail", detail);
		int totalPageCnt = test11Service.getTest11ListTotCnt(vo);
		model.addAttribute("totalPageCnt", totalPageCnt);
		paginationInfo.setTotalRecordCount(totalPageCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "test11/test11_list.main";
		
		
	}
	
	
	@RequestMapping(value = "/test11Dtl.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test11Dtl(Test11VO vo, HttpServletRequest request, ModelMap model){	

		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		model.addAttribute("mnuCd", mnuCd);
		
		
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
		
		test0VO.setYsmHclassCd("G5");
		List<EgovMap> g5List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g5List" , g5List);
		
		test0VO.setYsmHclassCd("G6");
		List<EgovMap> g6List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g6List" , g6List);
		
		test0VO.setYsmHclassCd("G7");
		List<EgovMap> g7List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g7List" , g7List);

		test0VO.setYsmHclassCd("G8");
		List<EgovMap> g8List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g8List" , g8List);
		
		test0VO.setYsmHclassCd("G10");
		List<EgovMap> g10List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g10List" , g10List);
		
		test0VO.setYsmHclassCd("G11");
		List<EgovMap> g11List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g11List" , g11List);
		
		test0VO.setYsmHclassCd("G12");
		List<EgovMap> g12List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g12List" , g12List);
		
		test0VO.setYsmHclassCd("G13");
		List<EgovMap> g13List = test0Service.getTest0MList(test0VO);
		model.addAttribute("g13List" , g13List);
		
		
		EgovMap map = (EgovMap) request.getSession().getAttribute("LoginVO");
		model.addAttribute("map", map);
		if (vo.getYukiNo() != null) {
			EgovMap detail = test11Service.getTest11Detail(vo);
			model.addAttribute("detail", detail);
		}

		
		model.addAttribute("vo", vo);
		model.addAttribute("userId",map.get("userId").toString());
		
		return "test11/test11_dtl.main";
	}
	
	
	
	@RequestMapping(value = "/test11Reg.do", method = RequestMethod.POST)
	public String test11Reg(HttpServletRequest request, ModelMap model, Test11VO vo){
		String mnuCd = request.getParameter("mnuCd") == null ? "" : request.getParameter("mnuCd");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String regId = (String)map.get("userId");
		vo.setRegId(regId);
		
		if(save.equals("S")) {
			test11Service.insertTest11(vo);		
		} else if(save.equals("U")) {
			test11Service.updateTest11(vo);
		} else if(save.equals("D")) {
			test11Service.deleteTest11(vo);
		}
		return "redirect:/test11List.do?mnuCd=" + mnuCd;
	}
	
	
	
	
}
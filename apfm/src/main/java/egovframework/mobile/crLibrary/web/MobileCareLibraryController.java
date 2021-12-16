package egovframework.mobile.crLibrary.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.mobile.crLibrary.service.CrLibraryVO;
import egovframework.mobile.crLibrary.service.MobileCareLibraryService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller

public class MobileCareLibraryController {
	
	/** MobileFreeBbsService */
	@Resource(name = "mobileCareLibraryService")
	private MobileCareLibraryService mobileCareLibraryService;
	
	@RequestMapping(value = "/careLibraryList.do")
	public String careLibraryList(CrLibraryVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		// 마음돌봄 자료실  목록
		List<EgovMap> crLibraryList = mobileCareLibraryService.getCrLibraryList(vo);
		model.addAttribute("crLibraryList", crLibraryList);
		
		return "mobile/careLibrary/careLibraryList";
	}
	
	@RequestMapping(value = "/careLibraryInsert.do")
	public String careLibraryInsert(CrLibraryVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "mobile/careLibrary/careLibraryInsert";
	}
	
	@RequestMapping(value = "/careLibraryView.do")
	public String careLibraryView(CrLibraryVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		model.addAttribute("vo", vo);
		
		// 마음돌봄 자료실 상세보기
		EgovMap CrlibDtl = null;
		if(num !="") {
			// 마음돌봄 자료실 상세보기
			CrlibDtl = mobileCareLibraryService.getCareLibraryDtl(vo);
		}
		model.addAttribute("detail", CrlibDtl);
		
		return "mobile/careLibrary/careLibraryView";
	}
	
}
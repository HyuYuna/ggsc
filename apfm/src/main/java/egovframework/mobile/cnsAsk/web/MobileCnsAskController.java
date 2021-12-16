package egovframework.mobile.cnsAsk.web;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.mobile.cnsAsk.service.CnsAskVO;
import egovframework.mobile.cnsAsk.service.MobileCnsAskService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller

public class MobileCnsAskController {
	
	/** MobileMainService */
	@Resource(name = "mobileCnsAskService")
	private MobileCnsAskService mobileCnsAskService;
	
	@RequestMapping(value = "/cnsAskList.do")
	public String cnsAskList(CnsAskVO vo ,HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");	
			response.setContentType("text/html; charset=UTF-8");		 
			PrintWriter out = response.getWriter();		 
			out.println("<script>alert('로그인 후에 상담문의를 할 수 있습니다.');</script>");
			out.flush();
			return "mobile/main/login";
		} else {
			model.addAttribute("loginYn", "Y");
		}
		vo.setCnsleId((String)map.get("userId"));
		vo.setWriter((String)map.get("userNm"));
		
		// 상담문의하기
		List<EgovMap> cnsAskList = mobileCnsAskService.getCnsAskList(vo);
		model.addAttribute("cnsAskList",cnsAskList);
		
		return "mobile/cnsAsk/cnsAskList";
	}
	
	@RequestMapping(value = "/cnsAskInsert.do")
	public String cnsAskInsert(CnsAskVO vo ,HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
			return "mobile/main/login";
		} else {
			model.addAttribute("loginYn", "Y");
		}
		vo.setCnsleId((String)map.get("userId"));
		vo.setWriter((String)map.get("userNm"));
		
		return "mobile/cnsAsk/cnsAskInsert";
	}
	
	@RequestMapping(value = "/cnsAskReg.do")
	public String freeBbsReg(CnsAskVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setCnsleId((String)map.get("userId"));
		vo.setWriter((String)map.get("userNm"));
		
		// 상담문의 등록
		mobileCnsAskService.getCnsAskReg(vo);
		
		return "redirect:/mgnoincoun/cnsAskList.do";
	}
	
}
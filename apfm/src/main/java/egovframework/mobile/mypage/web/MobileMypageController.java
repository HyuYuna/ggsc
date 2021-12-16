package egovframework.mobile.mypage.web;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.mobile.com.util.service.ComCodeService;
import egovframework.mobile.mypage.service.MobileMypageService;
import egovframework.mobile.mypage.service.MypageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller

public class MobileMypageController {
	
	/** MobileJoinService */
	@Resource(name = "mobileMypageService")
	private MobileMypageService mobileMypageService;
	
	/** ComCodeService */
	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;
	
	@RequestMapping(value = "/mypageView.do")
	public String mypageView(MypageVO vo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");	
			response.setContentType("text/html; charset=UTF-8");		 
			PrintWriter out = response.getWriter();		 
			out.println("<script>alert('로그인 후에 열람 할 수 있습니다.');</script>");
			out.flush();
			return "mobile/main/login";
		} else {
			model.addAttribute("loginYn", "Y");
		}
		vo.setCnsleId((String)map.get("userId"));
		// 마이페이지 최근상담내역
		EgovMap recCns = mobileMypageService.getMypageRecCns(vo);
		model.addAttribute("recCns",recCns);
		// 상담이력 목록
		List<EgovMap> cnsHisList = mobileMypageService.getMypageCnsHisList(vo);
		model.addAttribute("cnsHisList",cnsHisList);
		//System.out.println("cnsHisList"+cnsHisList.get(0));
		// 상담구분
		model.addAttribute("cnsGbCode", comCodeService.selectCnsGbList());
		// 상담진행상태
		model.addAttribute("cnsStatCode", comCodeService.selectCnsStatList());
		return "mobile/mypage/mypageView";
	}
	
	@RequestMapping(value = "/mypageDtl.do")
	public String mypageDtl(MypageVO vo, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");	
			response.setContentType("text/html; charset=UTF-8");		 
			PrintWriter out = response.getWriter();		 
			out.println("<script>alert('로그인 후에 열람 할 수 있습니다.');</script>");
			out.flush();
			return "mobile/main/login";
		} else {
			model.addAttribute("loginYn", "Y");
		}
		vo.setCnsleId((String)map.get("userId"));
		
		String caseNo = request.getParameter("caseNo") == null ? "" : request.getParameter("caseNo");
		vo.setCaseNo(Integer.parseInt(caseNo));
		
		// 마이페이지 상세보기
		EgovMap mypageDtl = mobileMypageService.getMypageRecCnsDtl(vo);
		model.addAttribute("detail",mypageDtl);
		System.out.println("mypageDtl 값 : "+mypageDtl);
		
		// 상담구분
		model.addAttribute("cnsGbCode", comCodeService.selectCnsGbList());
		// 상담진행상태
		model.addAttribute("cnsStatCode", comCodeService.selectCnsStatList());
		
		return "mobile/mypage/mypageDtl";
	}
	
}
package egovframework.mobile.comfCns.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.mobile.com.util.service.ComCodeService;
import egovframework.mobile.comfCns.service.AddComfCnsVO;
import egovframework.mobile.comfCns.service.ComfCnsVO;
import egovframework.mobile.comfCns.service.MobileComfCnsService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller

public class MobileComfCnsController {
	
	/** MobileMainService */
	@Resource(name = "mobileComfCnsService")
	private MobileComfCnsService mobileComfCnsService;
	
	/** ComCodeService */
	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;
	
	@RequestMapping(value = "/comfCnsInsert.do")
	public String comfCnsInsert(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");		
		if(map == null) {
			String msg = "로그인 후에 상담신청을 하실 수 있습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("loginYn", "N");	
		} else {
			model.addAttribute("loginYn", "Y");	
		}
		model.addAttribute("map", map);
		
		// 상담신청구분
		model.addAttribute("cnsReqCode", comCodeService.selectCnsReqList());
		// 센터구분
		model.addAttribute("centerGbCode", comCodeService.selectCenterGbList());
		// 권역구분
		model.addAttribute("zoneGbCode", comCodeService.selectZoneGbList());
		// 권역구분
		model.addAttribute("cnsGbCode", comCodeService.selectCnsGbList());
		// 학력
		model.addAttribute("eduCode", comCodeService.selectEduList());
		// 주거형태
		model.addAttribute("livgCode", comCodeService.selectLivgList());
		// 주택형태
		model.addAttribute("houseCode", comCodeService.selectHouseList());
		// 동거형태
		model.addAttribute("liveCode", comCodeService.selectLiveList());
		// 상담자구분
		model.addAttribute("cnsrGbCode", comCodeService.selectCnsrGbList());
		// 상담경위
		model.addAttribute("cnsDtlCode", comCodeService.selectCnsDtlList());
		// 노인과의 관계
		model.addAttribute("olderRelCode", comCodeService.selectOlderRelList());
		// 결혼상태
		model.addAttribute("merrStatCode", comCodeService.selectMerrStatList());
		// 주요문제
		model.addAttribute("majorProbCode", comCodeService.selectMajorProbList());		
		// 지역구분
		model.addAttribute("localGbCode", comCodeService.selectLocalGbList());	
		// 주호소문제
		model.addAttribute("majorApplCode", comCodeService.selectMajorApplList());
		
		return "mobile/comfCns/comfCnsInsert";
	}
	
	@RequestMapping(value = "/comfCnsReg.do")
	public String comfCnsReg(ComfCnsVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setUserId((String)map.get("userId"));
		
		// 상담신청 등록
		mobileComfCnsService.insertComfCnsReg(vo);
		
		return "redirect:/mgnoincoun/mobileMainList.do";
	}
	
	@RequestMapping(value = "/addComfCnsInsert.do")
	public String addComfCnsInsert(HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");		
		if(map == null) {
			model.addAttribute("loginYn", "N");
			return "mobile/main/login";
		} else {
			model.addAttribute("loginYn", "Y");
		}		
		// 학력
		model.addAttribute("eduCode", comCodeService.selectEduList());
		// 주거형태
		model.addAttribute("livgCode", comCodeService.selectLivgList());
		// 주택형태
		model.addAttribute("houseCode", comCodeService.selectHouseList());
		// 동거형태
		model.addAttribute("liveCode", comCodeService.selectLiveList());
		// 상담자구분
		model.addAttribute("cnsrGbCode", comCodeService.selectCnsrGbList());
		// 상담경위
		model.addAttribute("cnsDtlCode", comCodeService.selectCnsDtlList());
		// 노인과의 관계
		model.addAttribute("olderRelCode", comCodeService.selectOlderRelList());
		// 결혼상태
		model.addAttribute("merrStatCode", comCodeService.selectMerrStatList());
		// 주요문제
		model.addAttribute("majorProbCode", comCodeService.selectMajorProbList());
		// 지역구분
		model.addAttribute("localGbCode", comCodeService.selectLocalGbList());	
		// 주호소문제
		model.addAttribute("majorApplCode", comCodeService.selectMajorApplList());
		
		return "mobile/comfCns/addComfCnsInsert";
	}
	
	@RequestMapping(value = "/addComfCnsReg.do")
	public String addComfCnsReg(AddComfCnsVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setCnsleId((String)map.get("userId"));
		
		// 상담신청 등록(추가자료입력)
		mobileComfCnsService.insertAddComfCnsReg(vo);
		
		return "redirect:/mgnoincoun/mobileMainList.do";
	}
	
}
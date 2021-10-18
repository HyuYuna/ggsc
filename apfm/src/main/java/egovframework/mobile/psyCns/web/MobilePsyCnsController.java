package egovframework.mobile.psyCns.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.mobile.psyCns.service.MobilePsyCnsService;
import egovframework.mobile.psyCns.service.PsyCnsDocVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
/*@RequestMapping(value = "/mgnoincoun")*/
public class MobilePsyCnsController {
	
	/** MobileJoinService */
	@Resource(name = "mobilePsyCnsService")
	private MobilePsyCnsService mobilePsyCnsService;
	
	@RequestMapping(value = "/psyCnsList.do")
	public String psyCnsList(HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "mobile/psyCns/psyCnsList";
	}
	
	// DUKE-AD
	@RequestMapping(value = "/psyDukeDoc.do")
	public String psyDukeDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}		
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map", map);
		return "mobile/psyCns/psyDukeDoc";
	}
	
	// DUKE-AD 등록 ajax
	@RequestMapping(value = "/psyDukeDocRegAjax.do")
	public String psyDukeDocAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// DUKE-AD 등록 ajax
		// mobilePsyCnsService.insertPsyDukeDoc(vo);
		return "jsonView";
	}
	
	// GDS-SI
	@RequestMapping(value = "/psyGdsDoc.do")
	public String psyGdsDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map", map);
		return "mobile/psyCns/psyGdsDoc";
	}
	
	// GDS-SI 등록 ajax
	@RequestMapping(value = "/psyGdsDocRegAjax.do")
	public String psyGdsDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// GDS-SI 등록 ajax
		// mobilePsyCnsService.insertPsyGdsDoc(vo);
		return "jsonView";
	}
	
	// 불안척도
	@RequestMapping(value = "/psyAnxiDoc.do")
	public String psyAnxiDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map", map);
		return "mobile/psyCns/psyAnxiDoc";
	}
	
	// 불안척도 등록 ajax
	@RequestMapping(value = "/psyAnxiDocRegAjax.do")
	public String psyAnxiDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// 불안척도 등록 ajax
		// mobilePsyCnsService.insertPsyAnxiDoc(vo);
		return "jsonView";
	}
	
	// 대인관계변화척도
	@RequestMapping(value = "/psyPerRelDoc.do")
	public String psyPerRelDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map", map);
		return "mobile/psyCns/psyPerRelDoc";
	}
	
	// 대인관계변화척도 등록 ajax
	@RequestMapping(value = "/psyPerRelDocRegAjax.do")
	public String psyPerRelDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// 대인관계변화척도 등록 ajax
		// mobilePsyCnsService.insertPsyPerRelDoc(vo);
		return "jsonView";
	}
	
	// 사별스트레스척도
	@RequestMapping(value = "/psyBereavDoc.do")
	public String psyBereavDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		model.addAttribute("map", map);
		return "mobile/psyCns/psyBereavDoc";
	}
	
	// 사별스트레스척도 등록 ajax
	@RequestMapping(value = "/psyBereavDocRegAjax.do")
	public String psyBereavDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// 사별스트레스척도 등록 ajax
		// mobilePsyCnsService.insertPsyBereavDoc(vo);
		return "jsonView";
	}
	
	// 스트레스척도
	@RequestMapping(value = "/psyStressDoc.do")
	public String psyStressDoc(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		/*vo.setCnsleId((String)map.get("userId"));
		vo.setCnsleNm((String)map.get("userNm"));
		vo.setGender((String)map.get("gender"));
		vo.setTelNo((String)map.get("tel"));
		model.addAttribute("vo", vo);*/
		
		model.addAttribute("map", map);
		
		return "mobile/psyCns/psyStressDoc";
	}
	
	// 스트레스척도 등록 ajax
	@RequestMapping(value = "/psyStressDocRegAjax.do")
	public String psyStressDocRegAjax(PsyCnsDocVO vo, HttpServletRequest request, ModelMap model){	
		
		// 스트레스척도 등록 ajax
		// mobilePsyCnsService.insertPsyBereavDoc(vo);
		return "jsonView";
	}
	
}
/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.user.mypage.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

//import egovframework.admin.admRd.service.AdmRdDefaultVO;
//import egovframework.admin.admRd.service.AdmRdVO;
//import egovframework.admin.usrMng.service.UsrMngVO;
import egovframework.cmm.util.DateTimeUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.user.main.service.EgovMainService;
import egovframework.user.main.service.LoginVO;
import egovframework.user.mypage.service.MypageService;
import egovframework.user.mypage.service.MypageDefaultVO;
import egovframework.user.mypage.service.MypageVO;
import egovframework.user.notice.service.NotDefaultVO;
import egovframework.user.notice.service.NotVO;


/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  ?????????      ?????????              ????????????
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           ????????????
 *
 * @author ????????????????????? ???????????? ?????????
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class MypageController {

	/** EgovSampleService */
	@Resource(name = "mypageService")
	private MypageService mypageService;
	
	/** EgovSampleService */
	@Resource(name = "mainService")
	private EgovMainService mainService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	
	//??????
	//private static final String FILE_PATH = "D:/upload";
	//private static final String FILE_PATH2 = "D:/project/kga_2/eGovFrameDev-3.2.0-64bit/workspace/apf/src/main/webapp/excelFile";
	
	//??????
	private static final String FILE_PATH = "/www/futureplan_or_kr/www/upload";
	//private static final String FILE_PATH2 = "/www/futureplan_or_kr/www/excelFile";
	
	
	
	/**
	 * ??????????????? -> ???????????? ???????????? ??????
	 * @param searchVO - ????????? ????????? ?????? SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/mypageInfo.do")
	public String mypageInfo(@ModelAttribute("searchVO") MypageVO mypageVO, ModelMap model,HttpServletRequest req){
		
//		try {
//			HttpSession session = req.getSession();
//			session.getAttribute("id");
//			session.getAttribute("name");
//			String id = (String) session.getAttribute("id");
//			mypageVO.setId(id);
//			if (id == null || id == "") {
//				model.addAttribute("loginYn", "N");
//				return "user/main/login";
//			} else {
//
//				mypageVO = mypageService.selectMypageInfo(mypageVO);
//				model.addAttribute(mypageVO);
//
//				return "user/mypage/mypageInfo";
//			} 
//		} catch (Exception e) {
//			utility.func.Logging(this.getClass().getName(), e);
//			return null;
//
//		}
		return null;
	}
	
	
	/**
	 * ??????????????? -> ????????? ???????????? ?????? ???????????? ??????
	 * @param searchVO - ????????? ????????? ?????? SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/regHist.do")
	public String regHist(@ModelAttribute("searchVO") MypageDefaultVO searchVO, ModelMap model, HttpServletRequest req) throws Exception {
		
//		System.out.println("??????????????? ---->  ????????????");
//		
//		HttpSession session = req.getSession();
//		
//		session.getAttribute("id");
//		session.getAttribute("name");
//		
//		String id = (String)session.getAttribute("id");
//		searchVO.setId(id);
//		
//		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
//		searchVO.setPageSize(propertiesService.getInt("pageSize"));
//
//		/** pageing setting */
//		PaginationInfo paginationInfo = new PaginationInfo();
//		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
//		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
//		paginationInfo.setPageSize(searchVO.getPageSize());
//
//		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
//		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
//		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
//		
//		//???????????? - ????????? ????????????
//		//int regGubun1 = mypageService.regDataSch1(searchVO);
//		
//		//???????????? - ????????? ????????????
//		//int regGubun2 = mypageService.regDataSch2(searchVO);
//		
//		//???????????? - ????????? ????????????
//		//int regGubun3 = mypageService.regDataSch3(searchVO);
//		
//		//????????????????????? - ????????? ????????????
//		//int regGubun4 = mypageService.regDataSch4(searchVO);
//		
//		
//			
//		//???????????? - ????????? ?????? ??????
//		List<?> mypageList1 = mypageService.mypageList1(searchVO);
//		model.addAttribute("mypageList1", mypageList1);
//		
//			
//		//???????????? - ????????? ?????? ??????
//		List<?> mypageList2 = mypageService.mypageList2(searchVO);
//		model.addAttribute("mypageList2", mypageList2);
//		
//		
//		//???????????? - ????????? ?????? ??????
//		List<?> mypageList3 = mypageService.mypageList3(searchVO);
//		model.addAttribute("mypageList3", mypageList3);
//		
//		
//		//????????????????????? - ????????? ????????????
//		List<?> mypageList4 = mypageService.mypageList4(searchVO);
//		model.addAttribute("mypageList4", mypageList4);
//			
//		
//		
		
		return null;
	}
	
	
	/**
	 * ??????????????? -> ????????? ???????????? ???????????????
	 * @param id - ????????? ??? id
	 * @param searchVO - ?????? ???????????? ????????? ?????? VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping("/myHist_view.do")
	public String myHist_view(@RequestParam("selectedNum") int rdnum, @ModelAttribute("searchVO") MypageVO mypageVO, ModelMap model,HttpServletRequest req) throws Exception {
		
//		HttpSession session = req.getSession();
//		
//		session.getAttribute("id");
//		session.getAttribute("name");
//		
//		String id = (String)session.getAttribute("id");
//		mypageVO.setId(id);
//		mypageVO.setRd_num(rdnum);
//		
//		//??????????????? -> ?????? ????????? ???????????? ???????????? ??????
//		mypageVO = mypageService.selectMyHistView(mypageVO);
//		model.addAttribute(mypageVO);
		
		return null;
	}
	

	/**
	 * ???????????? ?????? ???????????? ??????
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/memberMove.do")
	public String memberMove(@ModelAttribute("searchVO") MypageDefaultVO searchVO, ModelMap model) throws Exception {
		
        //int ret = mainService.insertMemberReg(model);
		
        //model.addAttribute("ret", ret);
		return null;
	}
	
	@RequestMapping(value = "/memberMove2.do")
	public String memberMove2(@ModelAttribute("searchVO") MypageVO searchVO, ModelMap model) throws Exception {
		
        //mypageService.insertData(searchVO);
		
        //model.addAttribute("ret", ret);
		return null;
	}

	/**
	 * ????????? ?????? ???????????? ??????
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/phoneReg.do")
	public String phoneReg(@ModelAttribute("searchVO") MypageDefaultVO searchVO, ModelMap model) throws Exception {
		
        //int ret = mainService.insertMemberReg(model);
		
        //model.addAttribute("ret", ret);
		return null;
	}
	
	
	/**
	 * ????????? ?????? pop2 ???????????? ??????
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/phonePop2.do")
	public String phonePop2(@ModelAttribute("searchVO") MypageDefaultVO searchVO, ModelMap model) throws Exception {
		
     
		
		return null;
	}
	
	/**
	 * ????????? ?????? pop3 ???????????? ??????
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/phonePop3.do")
	public String phonePop3(@ModelAttribute("searchVO") MypageDefaultVO searchVO, ModelMap model) throws Exception {
		
       
//		
//		return "user/mypage/phonePop3";
		return null;
	}
	
	/**
	 * ????????? ?????? pop3 ???????????? ??????
	 * @param searchVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/phonePop4.do")
	public String phonePop4(@ModelAttribute("searchVO") MypageDefaultVO searchVO, ModelMap model){
		
//       
//		
//		try {
//			return "user/mypage/phonePop4";
//		} catch (Exception e) {
//			utility.func.Logging(this.getClass().getName(), e);
//			return null;
//
//		}
		return null;
	}
	
	
	/**
	 * ???????????? ???????????? ??????
	 */
	@RequestMapping(value = "/memberReg.do")
	public String memberReg(@ModelAttribute("searchVO") MypageDefaultVO searchVO, ModelMap model) throws Exception {
//		
//        //int ret = mainService.insertMemberReg(model);
//		
//        //model.addAttribute("ret", ret);
//		return "user/mypage/memberReg";
		return null;
	}
	
	/**
	 * ???????????? ???????????? ??????
	 */
	@RequestMapping(value = "/insertMove.do")
	public String insertMove(MypageVO mypageVO, Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
//        //int ret = mainService.insertMemberReg(model);
//		mypageVO = new MypageVO();
//		
//		Cookie[] cookies = req.getCookies();
//
//		if(cookies != null){
//
//			for(int i=0; i< cookies.length; i++){
//	
//			cookies[i].setMaxAge(0); // ??????????????? 0?????? ??????
//	
//			res.addCookie(cookies[i]); // ?????? ????????? ??????
//	
//			}
//
//		}
//		
//        //model.addAttribute("ret", ret);
//		return "user/mypage/memberInsert";
		return null;
	}
	
	/**
	 * ???????????? ??????
	 */
	@RequestMapping(value = "/insertMemberReg.do")
	public String insertMemberReg(MypageVO mypageVO, Model model, HttpServletRequest req){
//	
//		
//		System.out.println("-----------------    MypageController /insertMemberReg.do   Start  --------------");
//		
//		try{
//			
//			
//			
//			mypageService.insertData(mypageVO);
//			
//		}catch(Exception e){
//			utility.func.Logging(this.getClass().getName(), e);
//			return null;
//
//		}
//		
//		//mypageService.insertMemberReg(mypageVO);
//        
//		
//         //model.addAttribute("ret", ret);
//		return "user/join/joinresult";\
		return null;
	}
	
	
	/**
	 * ???????????????????????? - ????????? ???????????? ???????????? ??????
	 */
	@RequestMapping("/myRptReg.do")
	public String myRptReg(@ModelAttribute("searchVO") MypageVO mypageVO, Model model, HttpServletRequest req){
		
//		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
//		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
//		
//		
//		try {
//			mypageVO.setId((String) req.getSession().getAttribute("id"));
//			mypageVO.setName((String) req.getSession().getAttribute("name"));
//			if (req.getSession().getAttribute("id") == null || req.getSession().getAttribute("id").equals("")) {
//				return "user/main/login";
//
//			} else {
//				//??????????????????????????? ???????????? ????????? ??????
//				List<?> cdList = mypageService.schUploadRptMypage(mypageVO);
//				System.out.println("cdList ====== " + cdList);
//				model.addAttribute("cdList", cdList);
//
//				model.addAttribute(mypageVO);
//
//				return "user/mypage/mypageCdRptUpload";
//			} 
//		} catch (Exception e) {
//			utility.func.Logging(this.getClass().getName(), e);
//			return null;
//
//		}
		return null;
	}
	
	
	/**
	 * ???????????????????????? - ????????? ????????? ???????????? ??????
	 */
	@RequestMapping("/mypageUploadMove.do")
	public String mypageUploadMove(@ModelAttribute("searchVO") MypageVO mypageVO, Model model, HttpServletRequest req) throws Exception {
//		
//		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
//		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
//		
//		
//		mypageVO.setId((String)req.getSession().getAttribute("id"));
//		mypageVO.setName((String)req.getSession().getAttribute("name"));
//		
//		String tmpMng_no = (String)req.getParameter("tmpMng_no");
//		String tmpWitr_id = (String)req.getParameter("tmpWitr_id");
//		String tmpWitr_name = (String)req.getParameter("tmpWitr_name");
//		String tmpRpt1_id = (String)req.getParameter("tmpRpt1_id");
//		String tmpRpt1_name = (String)req.getParameter("tmpRpt1_name");
//		mypageVO.setMng_no(tmpMng_no);
//		mypageVO.setWitr_id(tmpWitr_id);
//		mypageVO.setWitr_name(tmpWitr_name);
//		mypageVO.setRpt1_id(tmpRpt1_id);
//		mypageVO.setRpt1_name(tmpRpt1_name);
//		
//		if(req.getSession().getAttribute("id")==null || req.getSession().getAttribute("id").equals("")){
//			return "user/main/login";
//			
//		}else{
//			
//			model.addAttribute(mypageVO);
//			
//			return "user/mypage/mypageUpload";
//		}
		return null;
	}
	
	
	/**
	 * ???????????????????????? - ????????? ????????? 
	 */
	@RequestMapping("/mypageCdRptUpload.do")
	public String mypageCdRptUpload(@RequestParam("mypageFile") MultipartFile file, MypageVO mypageVO,  Model model, HttpSession session,  MultipartHttpServletRequest req) throws Exception {
//		System.out.println("<!---------------    ??????????????? ????????? ?????????    ---------------------->");
//		
//		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
//		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
//		
//		
//		mypageVO.setId((String)req.getSession().getAttribute("id"));
//		mypageVO.setName((String)req.getSession().getAttribute("name"));
//		
//		String tmpMng_no = (String)req.getParameter("mng_no");
//		String tmpWitr_id = (String)req.getParameter("witr_id");
//		String tmpRpt1_id = (String)req.getParameter("rpt1_id");
//		String tmpRpt2_id = (String)req.getParameter("rpt2_id");
//		mypageVO.setMng_no(tmpMng_no);
//		mypageVO.setWitr_id(tmpWitr_id);
//		mypageVO.setRpt1_id(tmpRpt1_id);
//		mypageVO.setRpt2_id(tmpRpt2_id);
//		
//		
//		MultipartFile mypageFile =req.getFile("mypageFile"); //?????? ??? ??????
//		 
//        Map returnObject = new HashMap(); 
//        
//        String orgfilename = file.getOriginalFilename();
//        String sysfilename = "";
//        String currentDate = DateTimeUtil.currentDate();
//        
//        
//        
//        String filePath = FILE_PATH+"/"+currentDate;
//		File dir = new File(filePath);
//        if (!dir.isDirectory()) {
//            dir.mkdirs();
//        }
//        
//        File f = new File(orgfilename);
//        
//        //File file2 = f.getCanonicalFile();
//        //String file_path = f.getPath();
//        
//        File destFile = new File(filePath+"/"+orgfilename);
//
//        try{
//        	mypageFile.transferTo(destFile); //?????? ???????????? ????????? file(destFile)??? ?????? 
//        }catch(Exception e){
//            throw new RuntimeException(e.getMessage(),e);
//        }
//        
//        //System.out.println("convFile f.getPath() ======================  "+ f.getPath());
//        //System.out.println("convFile f.getCanonicalFile() ======================  "+ f.getCanonicalFile());
//        //System.out.println("convFile file_path ======================  "+ file_path);
//        
//        int size = 0;
//        
//        try { 
//        	
//        	//sysfilename = orgfilename.substring(orgfilename.lastIndexOf("."), orgfilename.length());
//        	sysfilename = orgfilename.length()+'-'+orgfilename;
//        	
//        	System.out.println("sysfilename  =============  " + sysfilename);
//        	
//			size = (int) file.getSize();
//            
//			mypageVO.setOrg_file_nm(orgfilename);
//			mypageVO.setSys_file_nm(sysfilename);
//			mypageVO.setFile_path(filePath);
//			mypageVO.setFile_size(size);
//			
//            //Iterator iter = (Iterator) req.getFileNames(); 
//            //MultipartFile mfile = null; 
//            String fieldName = ""; 
//            
//            // ?????? ???????????????
//            //while (iter.hasNext()) { 
//                //fieldName = iter.next().toString(); // ????????? ???????????? 
//                //mfile = req.getFile(fieldName); 
//                //String origName; 
//                //origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //???????????? ?????? // ???????????? ????????? 
//                
//                returnObject.put("params", req.getParameterMap()); 
//                
//                
//                //?????? ?????? : ?????? ??? ??????
//                //admRdService.excelUpload("D:/"+orgfilename,admRdVO);
//                mypageService.mypageCdRptUpload(mypageVO);
//                
//                //?????? ?????? : ?????? ??? ??????
//                //admRdService.excelUpload("/www/futureplan_or_kr/www/excel_file/"+orgfilename,admRdVO);
//                
//                
//            //}
//                //txManager.commit(txStatus);
//                //status.setComplete();
//            
//            } catch (Exception e) { // TODO Auto-generated catch block 
//            	utility.func.Logging(this.getClass().getName(), e);
//    			return null;
//
//
//            }
//		
//		
//		model.addAttribute(mypageVO);
//		
//		return "forward:/myRptReg.do";
		return null;
	}
	
	
	
	/**
	 * ????????????????????? - ????????? ?????? ????????????.
	 * @param id - ????????? ??? id
	 * @param searchVO - ?????? ???????????? ????????? ?????? VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/mypageCdRptDownLoad.do")
	public void mypageCdRptDownLoad(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
//		Map<String, Object> fileInfo = (Map<String, Object>) model.get("downloadFile");
//
//		
//		String mng_no = (String)req.getParameter("tmpMng_no");
//		String witr_id = (String)req.getParameter("tmpWitr_id");
//		String rpt1_id = (String)req.getParameter("tmpRpt1_id");
//		
//		
//		
//		String org_file_nm = (String)req.getParameter("tmpOrg_file_nm");
//		//String org_file_nm = "????????????????????????????????????.pdf";
//		String sys_file_nm = (String)req.getParameter("tmpSys_file_nm");
//		String file_path = (String)req.getParameter("tmpFile_path");
//		String file_size = (String)req.getParameter("tmpFile_size");
//		
//		System.out.println("mng_no =============    "+mng_no);
//		System.out.println("witr_id =============    "+witr_id);
//		System.out.println("rpt1_id =============    "+rpt1_id);
//		
//		
//		System.out.println("org_file_nm =============    "+org_file_nm);
//		System.out.println("sys_file_nm =============    "+sys_file_nm);
//		System.out.println("file_path =============    "+file_path);
//		System.out.println("file_size =============    "+file_size);
//		
//		
//		// ??????
//		//String uploadPath = "D:/upload/20191230/";
//		//String uploadPath = "/www/futureplan_or_kr/www/upload/";
//		String uploadPath = file_path;
//		
//		//????????? ??????
//		//String uploadPath = "/upload/";
// 
//		File uFile = new File(uploadPath, org_file_nm);
//		//int fSize = (int) uFile.length();
//		int fSize = Integer.parseInt(file_size);
//		
//		System.out.println("uFile =============    "+uFile);
//		System.out.println("fSize =============    "+fSize);
// 
//		if (fSize > 0) {
// 
//			try{
//				BufferedInputStream in = new BufferedInputStream(new FileInputStream(uFile));
//				String mimetype = "application/x-msdownload;charset=utf-8";
//	
//				// String mimetype = servletContext.getMimeType(requestedFile);
//				//String mimetype = "text/html";
//				res.setBufferSize(fSize);
//				//res.setContentType(mimetype);
//			
//				//res.setHeader("Content-Disposition", "attachment; filename=\"" + org_file_nm + "\"");
//				res.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(org_file_nm, "utf-8") + ";");
//				res.setContentLength(fSize);
//	
//				FileCopyUtils.copy(in, res.getOutputStream());
//	
//				in.close();
//				res.getOutputStream().flush();
//				res.getOutputStream().close();
//			}catch(Exception e){
//				utility.func.Logging(this.getClass().getName(), e);
//				
//
//			}
//		} else {
//			//setContentType??? ???????????? ????????? ????????? ??????
//			res.setContentType("application/x-msdownload;charset=utf-8");
//			PrintWriter printwriter = res.getWriter();
//			printwriter.println("<html>");
//			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + org_file_nm + "</h2>");
//			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
//			printwriter.println("<br><br><br>&copy; webAccess");
//			printwriter.println("</html>");
//			printwriter.flush();
//			printwriter.close();
//		}
		
	}
	
	
	/**
	 * ???????????????????????? - ???????????? ?????????????????? ??????
	 */
	@RequestMapping("/mypageReportMain.do")
	public String mypageReportMain(@ModelAttribute("searchVO") MypageVO mypageVO, Model model, HttpServletRequest req) throws Exception {
		
//		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
//		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
//		
//		
//		mypageVO.setId((String)req.getSession().getAttribute("id"));
//		mypageVO.setName((String)req.getSession().getAttribute("name"));
//		
//		if(req.getSession().getAttribute("id")==null || req.getSession().getAttribute("id").equals("")){
//			return "user/main/login";
//			
//		}else{
//			//??????????????????????????? ???????????? ???????????? ??????
//			List<?> cdList = mypageService.schReportMypage(mypageVO);
//			System.out.println("cdList ====== "+cdList);
//			model.addAttribute("cdList", cdList);
//			
//			model.addAttribute(mypageVO);
//			
//			return "user/mypage/mypageCdReportUpload";
//		}
//		
		return null;
	}
	
	
	/**
	 * ???????????????????????? - ???????????? ????????? ???????????? ??????
	 */
	@RequestMapping("/mypageReportUploadMove.do")
	public String mypageReportUploadMove(@ModelAttribute("searchVO") MypageVO mypageVO, Model model, HttpServletRequest req) throws Exception {
//		
//		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
//		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
//		
//		
//		mypageVO.setId((String)req.getSession().getAttribute("id"));
//		mypageVO.setName((String)req.getSession().getAttribute("name"));
//		
//		String tmpMng_no = (String)req.getParameter("tmpMng_no");
//		String tmpWitr_id = (String)req.getParameter("tmpWitr_id");
//		String tmpWitr_name = (String)req.getParameter("tmpWitr_name");
//		String tmpRpt2_id = (String)req.getParameter("tmpRpt2_id");
//		String tmpRpt2_name = (String)req.getParameter("tmpRpt2_name");
//		mypageVO.setMng_no(tmpMng_no);
//		mypageVO.setWitr_id(tmpWitr_id);
//		mypageVO.setWitr_name(tmpWitr_name);
//		mypageVO.setRpt2_id(tmpRpt2_id);
//		mypageVO.setRpt2_name(tmpRpt2_name);
//		
//		if(req.getSession().getAttribute("id")==null || req.getSession().getAttribute("id").equals("")){
//			return "user/main/login";
//			
//		}else{
//			
//			model.addAttribute(mypageVO);
//			
//			return "user/mypage/mypageReportUpload";
//		}
		return null;
	}
	
	
	
	/**
	 * ???????????????????????? - ???????????? ????????? 
	 */
	@RequestMapping("/mypageReportUpload.do")
	public String mypageReportUpload(@RequestParam("mypageFile") MultipartFile file, MypageVO mypageVO,  Model model, HttpSession session,  MultipartHttpServletRequest req) throws Exception {
//		System.out.println("<!---------------    ??????????????? ????????? ?????????    ---------------------->");
//		
//		System.out.println("loginId =============   "+req.getSession().getAttribute("id"));
//		System.out.println("loginName =============   "+req.getSession().getAttribute("name"));
//		
//		
//		mypageVO.setId((String)req.getSession().getAttribute("id"));
//		mypageVO.setName((String)req.getSession().getAttribute("name"));
//		
//		String tmpMng_no = (String)req.getParameter("mng_no");
//		String tmpWitr_id = (String)req.getParameter("witr_id");
//		String tmpRpt1_id = (String)req.getParameter("rpt1_id");
//		String tmpRpt2_id = (String)req.getParameter("rpt2_id");
//		mypageVO.setMng_no(tmpMng_no);
//		mypageVO.setWitr_id(tmpWitr_id);
//		mypageVO.setRpt1_id(tmpRpt1_id);
//		mypageVO.setRpt2_id(tmpRpt2_id);
//		
//		
//		MultipartFile mypageFile =req.getFile("mypageFile"); //?????? ??? ??????
//		 
//        Map returnObject = new HashMap(); 
//        
//        String orgfilename = file.getOriginalFilename();
//        String sysfilename = "";
//        String currentDate = DateTimeUtil.currentDate();
//        
//        
//        
//        String filePath = FILE_PATH+"/"+currentDate;
//		File dir = new File(filePath);
//        if (!dir.isDirectory()) {
//            dir.mkdirs();
//        }
//        
//        File f = new File(orgfilename);
//        
//        //File file2 = f.getCanonicalFile();
//        //String file_path = f.getPath();
//        
//        File destFile = new File(filePath+"/"+orgfilename);
//
//        try{
//        	mypageFile.transferTo(destFile); //?????? ???????????? ????????? file(destFile)??? ?????? 
//        }catch(Exception e){
//        	utility.func.Logging(this.getClass().getName(), e);
//			return null;
//
//        }
//        
//        //System.out.println("convFile f.getPath() ======================  "+ f.getPath());
//        //System.out.println("convFile f.getCanonicalFile() ======================  "+ f.getCanonicalFile());
//        //System.out.println("convFile file_path ======================  "+ file_path);
//        
//        int size = 0;
//        
//        try { 
//        	
//        	//sysfilename = orgfilename.substring(orgfilename.lastIndexOf("."), orgfilename.length());
//        	sysfilename = orgfilename.length()+'-'+orgfilename;
//        	
//        	System.out.println("sysfilename  =============  " + sysfilename);
//        	
//			size = (int) file.getSize();
//            
//			mypageVO.setOrg_file_nm(orgfilename);
//			mypageVO.setSys_file_nm(sysfilename);
//			mypageVO.setFile_path(filePath);
//			mypageVO.setFile_size(size);
//			
//            //Iterator iter = (Iterator) req.getFileNames(); 
//            //MultipartFile mfile = null; 
//            String fieldName = ""; 
//            
//            // ?????? ???????????????
//            //while (iter.hasNext()) { 
//                //fieldName = iter.next().toString(); // ????????? ???????????? 
//                //mfile = req.getFile(fieldName); 
//                //String origName; 
//                //origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //???????????? ?????? // ???????????? ????????? 
//                
//                returnObject.put("params", req.getParameterMap()); 
//                
//                
//                //?????? ?????? : ?????? ??? ??????
//                //admRdService.excelUpload("D:/"+orgfilename,admRdVO);
//                
//                //???????????? ???????????? ????????? ???????????? ??????
//                int tmpMax = mypageService.mypageReportMaxNum(mypageVO);
//                mypageVO.setRpt2_num(Integer.toString(tmpMax));
//                //??????
//                mypageService.mypageReportUpload(mypageVO);
//                
//                //?????? ?????? : ?????? ??? ??????
//                //admRdService.excelUpload("/www/futureplan_or_kr/www/excel_file/"+orgfilename,admRdVO);
//                
//                
//            //}
//                //txManager.commit(txStatus);
//                //status.setComplete();
//            
//            } catch (Exception e) { // TODO Auto-generated catch block 
//            	utility.func.Logging(this.getClass().getName(), e);
//    			return null;
//
//            }
//		
//		
//		model.addAttribute(mypageVO);
//		
		return null;
		
	}
	
	
	
	
	/**
	 * ????????????????????? - ???????????? ?????? ????????????.
	 * @param id - ????????? ??? id
	 * @param searchVO - ?????? ???????????? ????????? ?????? VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/mypageReportDownLoad.do")
	public void mypageReportDownLoad(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("Unused");
//		Map<String, Object> fileInfo = (Map<String, Object>) model.get("downloadFile");
//
//		
//		String mng_no = (String)req.getParameter("tmpMng_no");
//		String witr_id = (String)req.getParameter("tmpWitr_id");
//		String rpt2_id = (String)req.getParameter("tmpRpt2_id");
//		
//		
//		
//		String org_file_nm = (String)req.getParameter("tmpOrg_file_nm");
//		//String org_file_nm = "????????????????????????????????????.pdf";
//		String sys_file_nm = (String)req.getParameter("tmpSys_file_nm");
//		String file_path = (String)req.getParameter("tmpFile_path");
//		String file_size = (String)req.getParameter("tmpFile_size");
//		
//		System.out.println("mng_no =============    "+mng_no);
//		System.out.println("witr_id =============    "+witr_id);
//		System.out.println("rpt2_id =============    "+rpt2_id);
//		
//		
//		System.out.println("org_file_nm =============    "+org_file_nm);
//		System.out.println("sys_file_nm =============    "+sys_file_nm);
//		System.out.println("file_path =============    "+file_path);
//		System.out.println("file_size =============    "+file_size);
//		
//		
//		// ??????
//		//String uploadPath = "D:/upload/20191230/";
//		//String uploadPath = "/www/futureplan_or_kr/www/upload/";
//		String uploadPath = file_path;
//		
//		//????????? ??????
//		//String uploadPath = "/upload/";
// 
//		File uFile = new File(uploadPath, org_file_nm);
//		//int fSize = (int) uFile.length();
//		int fSize = Integer.parseInt(file_size);
//		
//		System.out.println("uFile =============    "+uFile);
//		System.out.println("fSize =============    "+fSize);
// 
//		if (fSize > 0) {
// 
//			try{
//				BufferedInputStream in = new BufferedInputStream(new FileInputStream(uFile));
//				String mimetype = "application/x-msdownload;charset=utf-8";
//	
//				// String mimetype = servletContext.getMimeType(requestedFile);
//				//String mimetype = "text/html";
//				res.setBufferSize(fSize);
//				res.setContentType(mimetype);
//			
//				//res.setHeader("Content-Disposition", "attachment; filename=\"" + org_file_nm + "\"");
//				res.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(org_file_nm, "utf-8") + ";");
//				res.setContentLength(fSize);
//	
//				FileCopyUtils.copy(in, res.getOutputStream());
//	
//				in.close();
//				res.getOutputStream().flush();
//				res.getOutputStream().close();
//			}catch(Exception e){
//				System.out.println("error==>"+ e.getMessage());
//			}
//		} else {
////			//setContentType??? ???????????? ????????? ????????? ??????
////			res.setContentType("application/x-msdownload;charset=utf-8");
////			PrintWriter printwriter = res.getWriter();
////			printwriter.println("<html>");
////			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + org_file_nm + "</h2>");
////			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
////			printwriter.println("<br><br><br>&copy; webAccess");
////			printwriter.println("</html>");
////			printwriter.flush();
////			printwriter.close();
//			System.out.println("Unused");
//		}
//		
//	}
//	
//	
//	
	
}}

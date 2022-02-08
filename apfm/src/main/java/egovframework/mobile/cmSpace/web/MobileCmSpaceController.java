package egovframework.mobile.cmSpace.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.mobile.cmSpace.service.BbsVO;
import egovframework.mobile.cmSpace.service.MobileCmSpaceService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller

public class MobileCmSpaceController {
	
	/** MobileCmSpaceService */
	@Resource(name = "mobileCmSpaceService")
	private MobileCmSpaceService mobileCmSpaceService;
	
	@RequestMapping(value = "/noticeList.do")
	public String noticeList(BbsVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		// 센터뉴스 목록
		List<EgovMap> centerNewsList = mobileCmSpaceService.getCenterNewsList(vo);
		model.addAttribute("centerNewsList", centerNewsList);
		// 공지사항 목록
		List<EgovMap> noticeList = mobileCmSpaceService.getNoticeList(vo);
		model.addAttribute("noticeList", noticeList);
		
		return "mobile/bbs/noticeList";
	}

	@RequestMapping(value = "/noticeView.do")
	public String noticeView(BbsVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		model.addAttribute("save", save);
		System.out.println("게시판 값 : "+vo.getNum()+"@@@"+vo.getPrevYn());
		
		List<EgovMap> file = null;
		
		// 센터소식 상세
		EgovMap centerNewsDtl = null;
		
		// 공지사항 상세
		EgovMap noticeDtl = null;
		
		if(save.equals("A")) {
			if(num !=""){
				int intNum = Integer.parseInt(num);

				centerNewsDtl = mobileCmSpaceService.getCenterNewsDtl(vo);
				file = mobileCmSpaceService.getCenterNewsFileDtl(vo);
				
				model.addAttribute("detail", centerNewsDtl);
				model.addAttribute("file", file);
				
				/*String answerYn = (String)noticeA.get("answerYn");
				if(answerYn.equals("Y")) {
					replyDtl = mobileCmSpaceService.getSuperVisionReplyDtl(intNum);
				}*/
			}
		} else if(save.equals("B")) {
			if(num !=""){
				int intNum = Integer.parseInt(num);
			
				noticeDtl = mobileCmSpaceService.getNoticeDtl(vo);
				file = mobileCmSpaceService.getNoticeFileDtl(vo);
				
				model.addAttribute("detail", noticeDtl);
				model.addAttribute("file", file);
				
				/*String answerYn = (String)noticeA.get("answerYn");
				if(answerYn.equals("Y")) {
					replyDtl = mobileCmSpaceService.getSuperVisionReplyDtl(intNum);
				}*/
			}
		}
		
		return "mobile/bbs/noticeView";
	}
	
	
	@RequestMapping(value = "/freeBbsList.do")
	public String freeBbsList(BbsVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		// 문서자료실 목록
		List<EgovMap> crLibraryList = mobileCmSpaceService.getCrLibraryList(vo);
		model.addAttribute("crLibraryList", crLibraryList);
		// 자유게시판 목록
		List<EgovMap> freeBbsList = mobileCmSpaceService.getFreeBbsList(vo);
		model.addAttribute("freeBbsList", freeBbsList);
		
		return "mobile/bbs/freeBbsList";
	}

	@RequestMapping(value = "/freeBbsView.do")
	public String freeBbsView(BbsVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		model.addAttribute("save", save);
		System.out.println("게시판 값 : "+vo.getNum()+"@@@"+vo.getPrevYn());
		
		List<EgovMap> file = null;
		
		// 문서자료실 상세
		EgovMap crLibraryDtl = null;
		
		// 자유게시판 상세
		EgovMap freeBbsDtl = null;
		
		if(save.equals("A")) {
			if(num !=""){
				int intNum = Integer.parseInt(num);

				crLibraryDtl = mobileCmSpaceService.getCareLibraryDtl(vo);
				file = mobileCmSpaceService.getCareLibraryFileDtl(vo);
				
				model.addAttribute("detail", crLibraryDtl);
				model.addAttribute("file", file);
				
				/*String answerYn = (String)noticeA.get("answerYn");
				if(answerYn.equals("Y")) {
					replyDtl = mobileCmSpaceService.getSuperVisionReplyDtl(intNum);
				}*/
			}
		} else if(save.equals("B")) {
			if(num !=""){
				int intNum = Integer.parseInt(num);

				freeBbsDtl = mobileCmSpaceService.getFreeBbsDtl(vo);
				file = mobileCmSpaceService.getFreeBbsFileDtl(vo);
				
				model.addAttribute("detail", freeBbsDtl);
				model.addAttribute("file", file);
				
				/*String answerYn = (String)noticeA.get("answerYn");
				if(answerYn.equals("Y")) {
					replyDtl = mobileCmSpaceService.getSuperVisionReplyDtl(intNum);
				}*/
			}
		}
		
		return "mobile/bbs/freeBbsView";
	}
	
	
	@RequestMapping(value = "/freeBbsReg.do")
	public String freeBbsReg(BbsVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		vo.setRegId((String)map.get("userId"));
		vo.setWriter((String)map.get("userNm"));
		
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		if(save.equals("B")) {
			// 게시판 등록(자유게시판)
			mobileCmSpaceService.insertFreeBbsBReg(vo);	
		}
		
		return "redirect:/mgnoincoun/freeBbsList.do";
	}

	@RequestMapping(value = "/freeBbsInsert.do")
	public String freeBbsInsert(BbsVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		String save = request.getParameter("save") == null ? "" : request.getParameter("save");
		model.addAttribute("save", save);
		return "mobile/bbs/freeBbsInsert";
	}
	
	
	/*@RequestMapping(value="fileDown.do")
    public void fileDown(BbsVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // String path = utility.function.DefaultPath + "\\images\\";
		FileInputStream fis = null;
		OutputStream os = null;

        response.setContentType("application/octet-stream");
        // 파일명 지정
        String header = request.getHeader("User-Agent");
        String fileNm = "";
        if (header.contains("MSIE") || header.contains("Trident")) {
            fileNm = URLEncoder.encode(vo.getFileNm(),"UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileNm+ ";");
        } else {
            fileNm = new String(vo.getFileNm().getBytes("UTF-8"), "ISO-8859-1");
           response.setHeader("Content-Disposition", "attachment; filename=" + fileNm + ";");
        }
//        response.setHeader("Content-Disposition", "attachment; filename=" + vo.getFileNm());
       
        try{
	        os = response.getOutputStream();
	
	        // String path = servletContext.getRealPath("/resources");
	
	        // d:/upload 폴더를 생성한다.
	
	        // server에 clean을 하면 resources 경로의 것이 다 지워지기 때문에
	
	        // 다른 경로로 잡는다(실제 서버에서는 위의 방식으로)
	
	        //FileInputStream fis = new FileInputStream(path + File.separator + newname);
	        fis = new FileInputStream(vo.getFilePath() + "/" + vo.getSysFileNm());
	        int n = 0;
	
	        byte[] b = new byte[512];
	
	        while((n = fis.read(b)) != -1 ) {
	            os.write(b, 0, n);
	        }
        }catch (Exception e) {
        	System.out.println(e.getMessage());
        	//utility.func.Logging(this.getClass().getName(), e);
		}finally {
			fis.close();
	        os.close();
		}      
    }*/
	
	@RequestMapping(value="/fileDown.do")
    public void fileDown(BbsVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
		
		String FileName = vo.getSysFileNm();
		String FilePathName = utility.func.filePath;
		System.out.println("FilePathName : " + FilePathName);
		File file = new File(FilenameUtils.getFullPath(FilePathName), FilenameUtils.getName(FileName));
		System.out.println("파일 객체의 값 : " + file);

		
		if (file.exists() && file.isFile()) {
			System.out.println("File Exists : " + utility.func.filePath + "/" + FileName);
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int) file.length());
			String browser = getBrowser(request);
			String disposition = getDisposition(vo.getFileNm(), browser);
			response.setHeader("Content-Disposition", disposition);
			response.setHeader("Content-Transfer-Encoding", "binary");
			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			if (fis != null)
				fis.close();
			out.flush();
			out.close();
			System.out.println("File Donwload Complete");
		}
    }
	
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1)
			return "MSIE";
		else if (header.indexOf("Chrome") > -1)
			return "Chrome";
		else if (header.indexOf("Opera") > -1)
			return "Opera";
		return "Firefox";
	}
	private String getDisposition(String filename, String browser) throws UnsupportedEncodingException {
		String dispositionPrefix = "attachment;filename=";
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		}
		return dispositionPrefix + encodedFilename;
	}
	
	
}
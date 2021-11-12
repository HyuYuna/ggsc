package ggsc.hpgmng.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ams.cmm.AES256Crypto;
import ams.cmm.AMSComm;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.hpgmng.service.EduAppVO;
import ggsc.hpgmng.service.FreeBrdVO;
import ggsc.hpgmng.service.HnoticeVO;
import ggsc.hpgmng.service.HomepageMngService;
import ggsc.hpgmng.service.LibraryVO;
import ggsc.hpgmng.service.NewsVO;
import ggsc.hpgmng.service.OnlineAskVO;
import ggsc.hpgmng.service.PopupVO;

@Service("hpgmngService")
public class HomepageMngServiceImpl extends EgovAbstractServiceImpl implements HomepageMngService {
	
	@Resource(name="hpgmngDao")
    private HomepageMngDAO hpgmngDao;
	
	// 공지사항 목록
	@Override
	public List<EgovMap> getNoticeList(HnoticeVO vo) {
		return hpgmngDao.getNoticeList(vo);
	}
	
	// 공지사항 갯수
	@Override
	public int getNoticeListTotCnt(HnoticeVO vo) {
		return hpgmngDao.getNoticeListTotCnt(vo);
	}
	
	// 공지사항 등록
	@Override
	public void insertNotice(HnoticeVO vo) {
		hpgmngDao.insertNotice(vo);
		
		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "notice");
			fMap.put("regId", vo.getRegId());
			fMap.put("writer", vo.getWriter());
			
			// 첨부파일이 있으면 업로드
			hpgmngDao.insertNoticeUpload(fMap);			
		}
	}
	
	// 공지사항 수정
	@Override
	public void updateNotice(HnoticeVO vo) {
		hpgmngDao.updateNotice(vo);
	}
	
	// 공지사항 상세
	@Override
	public EgovMap getNoticeDtl(int num) {
		return hpgmngDao.getNoticeDtl(num);
	}
	
	// 게시판관리 목록
	@Override
	public List<EgovMap> getFreeBoardList(FreeBrdVO vo) {
		return hpgmngDao.getFreeBoardList(vo);
	}
	
	// 게시판관리 갯수
	@Override
	public int getFreeBoardListTotCnt(FreeBrdVO vo) {
		return hpgmngDao.getFreeBoardListTotCnt(vo);
	}
	
	// 게시판관리 등록
	@Override
	public void insertFreeBoard(FreeBrdVO vo) {
		hpgmngDao.insertFreeBoard(vo);
		
		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "freeboard");
			fMap.put("regId", vo.getRegId());
			fMap.put("writer", vo.getWriter());
			
			// 첨부파일이 있으면 업로드
			hpgmngDao.insertFreeBoardUpload(fMap);			
		}
	}
	
	// 게시판관리 수정
	@Override
	public void updateFreeBoard(FreeBrdVO vo) {
		hpgmngDao.updateFreeBoard(vo);
	}
	
	// 게시판관리 상세
	@Override
	public EgovMap getFreeBoardDtl(int num) {
		return hpgmngDao.getFreeBoardDtl(num);
	}
	
	// 문서자료실 목록
	@Override
	public List<EgovMap> getLibraryList(LibraryVO vo) {
		return hpgmngDao.getLibraryList(vo);
	}
	
	// 문서자료실 갯수
	@Override
	public int getLibraryListTotCnt(LibraryVO vo) {
		return hpgmngDao.getLibraryListTotCnt(vo);
	}
	
	// 문서자료실 등록
	@Override
	public void insertLibrary(LibraryVO vo) {
		hpgmngDao.insertLibrary(vo);
		
		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "library");
			fMap.put("regId", vo.getRegId());
			fMap.put("writer", vo.getWriter());
			
			// 첨부파일이 있으면 업로드
			hpgmngDao.insertLibraryUpload(fMap);			
		}
	}
	
	// 문서자료실 수정
	@Override
	public void updateLibrary(LibraryVO vo) {
		hpgmngDao.updateLibrary(vo);
	}
	
	// 문서자료실 상세
	@Override
	public EgovMap getLibraryDtl(int num) {
		return hpgmngDao.getLibraryDtl(num);
	}
	
	// 센터소식 목록
	@Override
	public List<EgovMap> getCenterNewsList(NewsVO vo) {
		return hpgmngDao.getCenterNewsList(vo);
	}
	
	// 센터소식 갯수
	@Override
	public int getCenterNewsListTotCnt(NewsVO vo) {
		return hpgmngDao.getCenterNewsListTotCnt(vo);
	}
	
	// 센터소식 등록
	@Override
	public void insertCenterNews(NewsVO vo) {
		hpgmngDao.insertCenterNews(vo);
		
		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "centerNews");
			fMap.put("regId", vo.getRegId());
			fMap.put("writer", vo.getWriter());
			hpgmngDao.insertCenterNewsUpload(fMap);		
		}
	}
	
	// 센터소식 수정
	@Override
	public void updateCenterNews(NewsVO vo) {
		hpgmngDao.updateCenterNews(vo);
	}
	
	// 센터소식 상세
	@Override
	public EgovMap getCenterNewsDtl(int num) {
		return hpgmngDao.getCenterNewsDtl(num);
	}
	
	// 온라인상담 목록
	@Override
	public List<EgovMap> getOnlineAskList(OnlineAskVO vo) {
		return hpgmngDao.getOnlineAskList(vo);
	}
	
	// 온라인상담 갯수
	@Override
	public int getOnlineAskListTotCnt(OnlineAskVO vo) {
		return hpgmngDao.getOnlineAskListTotCnt(vo);
	}
	
	// 온라인상담 등록
	@Override
	public void insertOnlineAsk(OnlineAskVO vo) {
		hpgmngDao.insertOnlineAsk(vo);
	}
	
	// 온라인상담 수정
	@Override
	public void updateOnlineAsk(OnlineAskVO vo) {
		hpgmngDao.updateOnlineAsk(vo);
	}
	
	// 온라인상담 상세
	@Override
	public EgovMap getOnlineAskDtl(int num) {
		return hpgmngDao.getOnlineAskDtl(num);
	}
	
	// 교육신청 목록
	@Override
	public List<EgovMap> getEduAppList(EduAppVO vo) {
		return hpgmngDao.getEduAppList(vo);
	}
	
	// 교육신청 갯수
	@Override
	public int getEduAppListTotCnt(EduAppVO vo) {
		return hpgmngDao.getEduAppListTotCnt(vo);
	}
	
	// 교육신청 상세
	@Override
	public EgovMap getEduAppDtl(int num) {
		return hpgmngDao.getEduAppDtl(num);
	}
	
	// 교육신청 수정
	@Override
	public void updateEduApp(EduAppVO vo) {
		hpgmngDao.updateEduApp(vo);
	}
	
	// 팝업 목록
	@Override
	public List<EgovMap> getPopupList(PopupVO vo) {
		return hpgmngDao.getPopupList(vo);
	}
	
	// 팝업 갯수
	@Override
	public int getPopupListTotCnt(PopupVO vo) {
		return hpgmngDao.getPopupListTotCnt(vo);
	}
	
	// 팝업 상세
	@Override
	public EgovMap getPopupDtl(int num) {
		return hpgmngDao.getPopupDtl(num);
	}
	
	// 팝업 등록
	@Override
	public void insertPopup(PopupVO vo) {
		hpgmngDao.insertPopup(vo);
		
		if(vo.getFile().getSize() != 0) {
			String RealFileName = "";
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "popup");
			fMap.put("regId", vo.getRegId());
			fMap.put("writer", vo.getWriter());
			
			vo.setFileNm(fMap.get("fileNm").toString());
			vo.setFilePath(fMap.get("filePath").toString());
			vo.setSysFileNm(fMap.get("sysFileNm").toString());
			try {
				RealFileName = AES256Crypto.getInstance().AESDecode(vo.getSysFileNm());
			} catch (InvalidKeyException e) {
				RealFileName = vo.getSysFileNm();
				utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Invalid Key Exception");
			} catch (NoSuchAlgorithmException e) {
				RealFileName = vo.getSysFileNm();
				utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : No Such AlgorithmException");
			} catch (NoSuchPaddingException e) {
				RealFileName = vo.getSysFileNm();
				utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : No Such Padding Exception");
			} catch (InvalidAlgorithmParameterException e) {
				RealFileName = vo.getSysFileNm();
				utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Invaild Algorithm Parameter Exception");
			} catch (IllegalBlockSizeException e) {
				RealFileName = vo.getSysFileNm();
				utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Illegal Block Size Exception");
			} catch (BadPaddingException e) {
				RealFileName = vo.getSysFileNm();
				utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Bad Padding Exception");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			vo.setRealFileNm(RealFileName);
			
			// 첨부파일이 있으면 업로드
			hpgmngDao.insertPopupUpload(vo);			
		}
	}
	
	// 팝업 수정
	@Override
	public void updatePopup(PopupVO vo) {
		hpgmngDao.updatePopup(vo);
		
		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "popup");
			vo.setFileNm((String)fMap.get("fileNm"));
			vo.setSysFileNm((String)fMap.get("sysFileNm"));
			vo.setFilePath((String)fMap.get("filePath"));
			// 첨부파일이 있으면 업로드
			hpgmngDao.updatePopupUpload(vo);			
		} 
	}
	
	// 팝업 수정
	@Override
	public void deletePopup(PopupVO vo) {
		hpgmngDao.deletePopup(vo);
		hpgmngDao.deletePopupUpload(vo);			
	}
	
//	// FAQ 목록
//	@Override
//	public List<EgovMap> getFaqList(FaqVO vo) {
//		return supportDao.getFaqList(vo);
//	}
//	
//	// FAQ 갯수
//	@Override
//	public int getFaqListTotCnt(FaqVO vo) {
//		return supportDao.getFaqListTotCnt(vo);
//	}
//	
//	// FAQ 등록
//	@Override
//	public void insertFaq(FaqVO vo) {
//		supportDao.insertFaq(vo);
//	}
//	
//	// FAQ 상세
//	@Override
//	public EgovMap getFaqDetail(int num) {
//		return supportDao.getFaqDetail(num);
//	}
//	
//	// FAQ 수정
//	@Override
//	public void updateFaq(FaqVO vo) {
//		supportDao.updateFaq(vo);
//	}
//	

}

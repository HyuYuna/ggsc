package ggsc.support.service.impl;
 
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.daou.ppurio.mmsVO;

import ams.cmm.AMSComm;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.support.service.FaqVO;
import ggsc.support.service.MailVO;
import ggsc.support.service.PdfVO;
import ggsc.support.service.RescRoomVO;
import ggsc.support.service.SignVO;
import ggsc.support.service.SupportService;
import ggsc.support.service.SurveyMngVO;
import ggsc.support.service.UserManualVO;
import ggsc.support.web.MyAuthentication;

@Service("supportService")
public class SupportServiceImpl extends EgovAbstractServiceImpl implements SupportService {
	
	@Resource(name="supportDao")
    private SupportDAO supportDao;
	
	
	@Override 
	public EgovMap PDFDownload(PdfVO vo, String sqlName) {
		return supportDao.PDFDownload(vo, sqlName); 
	}
	
	// FAQ 목록
	@Override
	public List<EgovMap> getFaqList(FaqVO vo) {
		return supportDao.getFaqList(vo);
	}
	
	// FAQ 갯수
	@Override
	public int getFaqListTotCnt(FaqVO vo) {
		return supportDao.getFaqListTotCnt(vo);
	}
	
	// FAQ 등록
	@Override
	public void insertFaq(FaqVO vo) {
		supportDao.insertFaq(vo);
	}
	
	// FAQ 상세
	@Override
	public EgovMap getFaqDetail(int num) {
		return supportDao.getFaqDetail(num);
	}
	
	// FAQ 수정
	@Override
	public void updateFaq(FaqVO vo) {
		supportDao.updateFaq(vo);
	}
	
	// 자료실 목록
	@Override
	public List<EgovMap> getRescRoomList(RescRoomVO vo) {
		return supportDao.getRescRoomList(vo);
	}
	
	// 자료실 갯수
	@Override
	public int getRescRoomListTotCnt(RescRoomVO vo) {
		return supportDao.getRescRoomListTotCnt(vo);
	}
	
	// 자료실 등록
	@Override
	public void insertRescRoom(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception {
		
		int rescRoomNum = 0;
		rescRoomNum = supportDao.insertRescRoom(map);
		
		List<EgovMap> list = AMSComm.parseInsertFileInfo(map,request);
		for(int i=0; i<list.size(); i++) {
			list.get(i).put("fileNum",rescRoomNum);
			list.get(i).put("regId",map.get("regId"));
			list.get(i).put("writer",map.get("writer"));
			supportDao.insertRescRoomUpload(list.get(i));
		}
	}
	
	// 자료실 수정
	@Override
	public void updateRescRoom(Map<String,Object> map, MultipartHttpServletRequest request) throws Exception {
		supportDao.updateRescRoom(map);
		
		supportDao.deleteRescRoomUploadGbY(map);
		List<EgovMap> list = AMSComm.parseInsertFileInfo(map,request);
		EgovMap fileMap = null;
		for(int i=0; i<list.size(); i++) {
			fileMap = list.get(i);
			fileMap.put("fileNum",map.get("fileNum"));
			fileMap.put("regId",map.get("regId"));
			fileMap.put("writer",map.get("writer"));
			if (fileMap.get("delGb").equals("Y")) {
				supportDao.insertRescRoomUpload(fileMap);
			} else {
				supportDao.deleteRescRoomUploadGbN(fileMap);
			}
		}
	}
	
	// 자료실 삭제
	@Override
	public void deleteRescRoom(int rescRoomNum) {
		supportDao.deleteRescRoom(rescRoomNum);
		supportDao.deleteRescRoomUpload(rescRoomNum);
	}
	
	// 자료실 상세
	@Override
	public EgovMap getRescRoomDtl(int num) {
		return supportDao.getRescRoomDtl(num);
	}
	
	// 자료실 상세 파일 목록
	@Override
	public List<EgovMap> getRescRoomFileDtl(int num) {
		return supportDao.getRescRoomFileDtl(num);
	}
	
	// 사용자메뉴얼 목록
	@Override
	public List<EgovMap> getUserManualList(UserManualVO vo) {
		return supportDao.getUserManualList(vo);
	}
	
	// 사용자메뉴얼 갯수
	@Override
	public int getUserManualListTotCnt(UserManualVO vo) {
		return supportDao.getUserManualListTotCnt(vo);
	}
	
	// 사용자메뉴얼 상세
	@Override
	public EgovMap getUserManualDetail(int num) {
		return supportDao.getUserManualDetail(num);
	}
	
	// 사용자메뉴얼 등록
	@Override
	public void insertUserManual(UserManualVO vo) {
		
		supportDao.insertUserManual(vo);
		
		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "manual");
			vo.setFileNm((String)fMap.get("fileNm"));
			vo.setSysFileNm((String)fMap.get("sysFileNm"));
			vo.setFilePath((String)fMap.get("filePath"));
			// 첨부파팔이 있으면 업로드
			supportDao.insertUserManualUpload(vo);			
		}
	}
		
	// 사용자메뉴얼 수정
	@Override
	public void updateUserManual(UserManualVO vo) {
		
		supportDao.updateUserManual(vo);
		
		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "manual");
			vo.setFileNm((String)fMap.get("fileNm"));
			vo.setSysFileNm((String)fMap.get("sysFileNm"));
			vo.setFilePath((String)fMap.get("filePath"));
			// 첨부파팔이 있으면 업로드
			supportDao.updateUserManualUpload(vo);
		}
	}
	
	// 설문관리 목록
	@Override
	public List<EgovMap> getSurveyMngList(SurveyMngVO vo) {
		return supportDao.getSurveyMngList(vo);
	}
	
	// 설문관리 갯수
	@Override
	public int getSurveyMngListTotCnt(SurveyMngVO vo) {
		return supportDao.getSurveyMngListTotCnt(vo);
	}
	
	// 설문관리 상세
	@Override
	public EgovMap getSurveyMngDetail(int num) {
		return supportDao.getSurveyMngDetail(num);
	}
	
	// 설문관리 등록
	@Override
	public void insertSurveyMng(SurveyMngVO vo) {
		supportDao.insertSurveyMng(vo);
	}
		
	// 설문관리 수정
	@Override
	public void updateSurveyMng(SurveyMngVO vo) {
		supportDao.updateSurveyMng(vo);
	}
	
	// 서명관리 목록
	@Override
	public List<EgovMap> getSignList(SignVO vo) {
		return supportDao.getSignList(vo);
	}
	
	// 서명관리 갯수
	@Override
	public int getSignListTotCnt(SignVO vo) {
		return supportDao.getSignListTotCnt(vo);
	}
	
	// 서명관리 등록
	@Override
	public void insertSign(SignVO vo) {
		supportDao.insertSign(vo);
		
//		if(vo.getFile().getSize() != 0) {
//			MultipartFile file = vo.getFile();
//			EgovMap fMap = AMSComm.fileUpload(file);
//			vo.setFileNm((String)fMap.get("fileNm"));
//			vo.setSysFileNm((String)fMap.get("sysFileNm"));
//			vo.setFilePath((String)fMap.get("filePath"));
//			// 첨부파팔이 있으면 업로드
//			supportDao.insertSignUpload(vo);			
//		}
		
	}
	
	// 서명관리 상세
	@Override
	public EgovMap getSignDetail(SignVO vo) {
		return supportDao.getSignDetail(vo);
	}
	
	// 서명관리 수정
	@Override
	public void updateSign(SignVO vo) {
		supportDao.updateSign(vo);
		
//		if(vo.getFile().getSize() != 0) {
//			MultipartFile file = vo.getFile();
//			EgovMap fMap = AMSComm.fileUpload(file);
//			vo.setFileNm((String)fMap.get("fileNm"));
//			vo.setSysFileNm((String)fMap.get("sysFileNm"));
//			vo.setFilePath((String)fMap.get("filePath"));
//			// 첨부파팔이 있으면 업로드
//			supportDao.updateRescRoomUpload(vo);			
//		}
		
	}
	
	// 서명관리 등록
	@Override
	public void insertMail(MailVO vo) {
		sendMail(vo);
		//supportDao.insertSign(vo);
		
//		if(vo.getFile().getSize() != 0) {
//			MultipartFile file = vo.getFile();
//			EgovMap fMap = AMSComm.fileUpload(file);
//			vo.setFileNm((String)fMap.get("fileNm"));
//			vo.setSysFileNm((String)fMap.get("sysFileNm"));
//			vo.setFilePath((String)fMap.get("filePath"));
//			// 첨부파팔이 있으면 업로드
//			supportDao.insertSignUpload(vo);			
//		}
		
	}
	
	
	// 문자 발송
	@Override
	public void insertMms(mmsVO vo) {
		supportDao.insertMms(vo);
	}
	
	// 문자 발송내역 상세
	@Override
	public EgovMap selectMms(mmsVO vo) {
		return supportDao.selectMms(vo);
	}
	
	// 문자 발송내역 조회
	@Override
	public List<EgovMap> listMms(mmsVO vo) {
		return supportDao.listMms(vo);
	}
	
	// 문자 발송내역 갯수
	@Override
	public int countMms(mmsVO vo) {
		return supportDao.countMms(vo);
	}
	
	
	public void sendMail(MailVO vo){

//		String title = request.getParameter("mTitle") == null ? "" : request.getParameter("mTitle");
//		String content = request.getParameter("mContent") == null ? "" : request.getParameter("mContent");
//		String filePath = request.getParameter("filePath") == null ? "" : request.getParameter("filePath");
		
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); 	// gmail은 무조건 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com");		// smtp 서버 주소
		p.put("mail.smtp.auth","true");    				// gmail은 무조건 true 고정
		p.put("mail.smtp.port", "587"); 				// gmail 포트
		  
		Authenticator auth = new MyAuthentication();
		
		//session 생성 및  MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
//		Session session = Session.getInstance(p, new javax.mail.Authenticator() {
//        protected PasswordAuthentication getPasswordAuthentication() {
//            return new PasswordAuthentication("test.test.910514@gmail.com", "dldudfhr!234");
//        }
//
//        });
		MimeMessage msg = new MimeMessage(session);
		
		try{
			//편지보낸시간
			msg.setSentDate(new Date());
			
			InternetAddress from = new InternetAddress() ;
			
			
			from = new InternetAddress("abbgnogergerg@gmail.com");
//			from = new InternetAddress(vo.getEmail());
			
			// 이메일 발신자
			msg.setFrom(from);
			
			
			// 이메일 수신자
			InternetAddress to = new InternetAddress("gongbba@naver.com");
//			InternetAddress to = new InternetAddress(vo.getRcpt());
			msg.setRecipient(Message.RecipientType.TO, to);
			
			// 이메일 제목
			//msg.setSubject(title, "UTF-8");
			msg.setSubject(vo.getTitle(), "UTF-8");
			
			/*
			MimeMultipart multipart=new MimeMultipart();
			

			// part1에 본문을 설정

			MimeBodyPart bodyPart1=new MimeBodyPart();

			bodyPart1.setText("이 메일에는 이미지 파일이 첨부되어 있습니다.", "UTF-8");

			multipart.addBodyPart(bodyPart1); // Multi-part에 part1을 추가


			// part2에 이미지 파일을 설정

			MimeBodyPart bodyPart2=new MimeBodyPart();

			DataSource dataSource=new FileDataSource("D:\\proj\\ggsc\\src\\main\\webapp\\images\\ams_w.png");

			DataHandler dataHandler=new DataHandler(dataSource);

			bodyPart2.setDataHandler(dataHandler);

			multipart.addBodyPart(bodyPart2); // Multi-part에 part2를 추가


			// 메일에 Multi-part를 설정

			msg.setContent(multipart);
			 */		
			
			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();
			String htmlText = vo.getCntn();
			messageBodyPart.setContent(htmlText, "text/html; charset=UTF-8");
			
			multipart.addBodyPart(messageBodyPart);
			
//			messageBodyPart = new MimeBodyPart();
//			//System.out.println(request.getSession().getServletContext().getRealPath("/images/sign/0fd8e1fb-8649-43ef-bb07-6de2e3663d91_img.png"));
//			//DataSource fds = new FileDataSource(request.getSession().getServletContext().getRealPath("/images/down.png"));	
//			DataSource fds = new FileDataSource("C:\\Users\\gong\\Desktop\\test.jpg");	
//			
//			messageBodyPart.setDataHandler(new DataHandler(fds));
//			messageBodyPart.setHeader("Content-ID", "<image>");
//			
//			multipart.addBodyPart(messageBodyPart);
			
			msg.setContent(multipart);
			// 이메일 내용 
			//msg.setContent(multi);
			//msg.setContent(content, "UTF-8");
			//msg.setText("<img src='http://192.168.0.54:8080/sign/0fd8e1fb-8649-43ef-bb07-6de2e3663d91_img.png' />");
			//msg.setContent("<img src='http://192.168.0.54:8080/sign/0fd8e1fb-8649-43ef-bb07-6de2e3663d91_img.png' /><br><p style='font: bold;'>테스트테스트</p>", "text/html; UTF-8");
			// 이메일 헤더 
			//msg.setHeader("content-Type", "text/html");
			
			//메일보내기
			javax.mail.Transport.send(msg);
			
		}catch (AddressException addr_e) {
			utility.func.Logging("sendMail", addr_e);
		}catch (MessagingException msg_e) {
			utility.func.Logging("sendMail", msg_e);
		}
	}
}

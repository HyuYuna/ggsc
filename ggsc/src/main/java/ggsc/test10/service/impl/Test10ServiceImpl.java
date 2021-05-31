package ggsc.test10.service.impl;

import java.util.Date;

import java.util.List;
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

import com.daou.ppurio.mmsVO;

import ams.cmm.AMSComm;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.support.service.NoticeVO;
import ggsc.test10.service.Test10VO;
import ggsc.support.service.SupportService;
import ggsc.support.service.impl.SupportDAO;
import ggsc.support.web.MyAuthentication;
import ggsc.test10.service.Test10Service;
import ggsc.test10.service.Test10VO;

@Service("test10Service")
public class Test10ServiceImpl extends EgovAbstractServiceImpl implements Test10Service {
	
	@Resource(name="test10Dao")
    private Test10DAO test10Dao;
	
	// 목록
	@Override
	public List<EgovMap> getTest10List(Test10VO vo) {
		return test10Dao.getTest10List(vo);
	}
	
	// 갯수
	@Override
	public int getTest10ListTotCnt(Test10VO vo) {
		return test10Dao.getTest10ListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest10(Test10VO vo) {
		test10Dao.insertTest10(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest10Detail(Test10VO vo) {
		return test10Dao.getTest10Detail(vo);
	}
	
	// 수정
	@Override
	public void updateTest10(Test10VO vo) {
		test10Dao.updateTest10(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest10(Test10VO vo) {
		test10Dao.deleteTest10(vo);
	}
	
	
	
}









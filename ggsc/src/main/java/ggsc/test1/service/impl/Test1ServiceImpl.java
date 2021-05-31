package ggsc.test1.service.impl;

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
import ggsc.test1.service.Test1VO;
import ggsc.support.service.SupportService;
import ggsc.support.service.impl.SupportDAO;
import ggsc.support.web.MyAuthentication;
import ggsc.test1.service.Test1Service;
import ggsc.test1.service.Test1VO;

@Service("test1Service")
public class Test1ServiceImpl extends EgovAbstractServiceImpl implements Test1Service {
	
	@Resource(name="test1Dao")
    private Test1DAO test1Dao;
	
	// 목록(select)
	@Override
	public List<EgovMap> getTest1SelectList(Test1VO vo) {
		return test1Dao.getTest1SelectList(vo);
	}
	
	// 목록
	@Override
	public List<EgovMap> getTest1List(Test1VO vo) {
		return test1Dao.getTest1List(vo);
	}
	
	// 갯수
	@Override
	public int getTest1ListTotCnt(Test1VO vo) {
		return test1Dao.getTest1ListTotCnt(vo);
	}
	
	// 등록
	@Override
	public void insertTest1(Test1VO vo) {
		test1Dao.insertTest1(vo);
	}
	
	// 상세
	@Override
	public EgovMap getTest1Detail(int num) {
		return test1Dao.getTest1Detail(num);
	}
	
	// 수정
	@Override
	public void updateTest1(Test1VO vo) {
		test1Dao.updateTest1(vo);
	}
	
	// 삭제
	@Override
	public void deleteTest1(Test1VO vo) {
		test1Dao.deleteTest1(vo);
	}
	
	
	
}









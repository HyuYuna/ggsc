package egovframework.mobile.cnsAsk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.mobile.cnsAsk.service.CnsAskVO;
import egovframework.mobile.cnsAsk.service.MobileCnsAskService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mobileCnsAskService")
public class MobileCnsAskServiceImpl extends EgovAbstractServiceImpl implements MobileCnsAskService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MobileCnsAskServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "mobileCnsAskMapper")
	private MobileCnsAskMapper mobileCnsAskMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 상담문의하기
	public List<EgovMap> getCnsAskList(CnsAskVO vo) {
		return mobileCnsAskMapper.getCnsAskList(vo);
	}
	
	// 상담문의 등록
	public void getCnsAskReg(CnsAskVO vo) {
		mobileCnsAskMapper.getCnsAskReg(vo);
	}
	
	
}
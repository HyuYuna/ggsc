package egovframework.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.cmm.service.FileService;
import egovframework.cmm.service.FileVO;
import egovframework.cmm.util.EditorTmpFileVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;


	
@Service("fileService")
public class FileServiceImpl extends EgovAbstractServiceImpl implements FileService {

	private static final Logger LOGGER = LoggerFactory.getLogger(FileServiceImpl.class);	

	
	@Resource(name = "fileMapper")
	private FileMapper fileMapper;
	
	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	
    
	@Override
	public EgovMap getFileInfo(FileVO vo) throws Exception {
		return fileMapper.getFileInfo(vo);
	}

	@Override
	public int getMaxTmpEditorFile(EditorTmpFileVO vo) throws Exception {
		int ret = 0;
		try{
			ret = fileMapper.getMaxTmpEditorFile(vo);
		}catch(Exception e){
			utility.func.Logging(this.getClass().getName(), e);
		}
		return ret;
	}

	@Override
	public void insertTmpEditorFile(EditorTmpFileVO vo) throws Exception {
		fileMapper.insertTmpEditorFile(vo);
	}

	@Override
	public List<EditorTmpFileVO> selectTmpEditorFileList(EditorTmpFileVO vo){
		try {
			return fileMapper.selectTmpEditorFileList(vo);
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
			return null;
		}
	}

	@Override
	public int getMaxTmpEditorFileIdx(EditorTmpFileVO vo) throws Exception {
		return fileMapper.getMaxTmpEditorFileIdx(vo);
	}

	@Override
	public void updateSetUpCdByTmpFileIdx(EditorTmpFileVO vo){
		try {
			fileMapper.updateSetUpCdByTmpFileIdx(vo);
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);
		}
	}

}

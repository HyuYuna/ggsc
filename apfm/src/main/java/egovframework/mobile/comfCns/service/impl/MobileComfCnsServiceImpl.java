package egovframework.mobile.comfCns.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.mobile.comfCns.service.AddComfCnsVO;
import egovframework.mobile.comfCns.service.ComfCnsVO;
import egovframework.mobile.comfCns.service.MobileComfCnsService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mobileComfCnsService")
public class MobileComfCnsServiceImpl extends EgovAbstractServiceImpl implements MobileComfCnsService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MobileComfCnsServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "mobileComfCnsMapper")
	private MobileComfCnsMapper mobileComfCnsMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 상담신청 등록
	public void insertComfCnsReg(ComfCnsVO vo) throws Exception {
		try {
			mobileComfCnsMapper.insertComfCnsReg(vo);
		} catch (Exception e) {
			utility.func.Logging(this.getClass().getName(), e);

		}
		/*MultipartFile file = vo.getFile();
		EgovMap fMap = fileUpload(file, vo);
		// 상담신청 파일업로드
		if(vo.getFile().getSize() != 0) {
			mobileComfCnsMapper.insertComfCnsFileUpload(vo);
		}*/
	}
	
	// 상담신청 등록(추가자료입력)
	public void insertAddComfCnsReg(AddComfCnsVO vo) {
		mobileComfCnsMapper.insertAddComfCnsReg(vo);
	}
	
	// 파일 업로드
	/*public static EgovMap fileUpload(MultipartFile file, ComfCnsVO vo) throws Exception {
		
		EgovMap map = new EgovMap();	
		// 로컬 File Path
		String FILE_PATH = "C:/Users/BeadNet/eclipse-workspace/ggsc/src/main/webapp/images/upload/req/";
		// 경기도청 File Path
		// String FILE_PATH = "/software/tomcat/webapps/files/";
		String orgfilename = "";
		String sysfilename = "";
		Long size;
		String saveFileName = "";
		
		 파일업로드 Start 
		
		// 파일 정보
		orgfilename = file.getOriginalFilename();
		System.out.println("orgfilename =============   "+ orgfilename);
		if(orgfilename.length() > 0){
			sysfilename = orgfilename.substring(orgfilename.lastIndexOf("."), orgfilename.length());
			size = file.getSize();
			
			
			System.out.println("sysfilename =============   "+ sysfilename);
			System.out.println("size =============   "+ size);
			
			// 서버에서 저장 할 시스템 파일 이름
			saveFileName = genSaveFileName(sysfilename);
			
			
			System.out.println("saveFileName : " + saveFileName);
			
			//writeFile(file, saveFileName);
			//url = PREFIX_URL + saveFileName;
			boolean result = false;

			byte[] data = file.getBytes();
			FileOutputStream fos = new FileOutputStream(FILE_PATH + "/" + saveFileName);
			fos.write(data);
			fos.close();
			
			// data type long => int 변경
			vo.setFileSize((int) file.getSize());
			vo.setFileNm(orgfilename);
			vo.setSysFileNm(saveFileName);
			vo.setFilePath(FILE_PATH);
			
		}else{
			
		}
		return map;
	}*/
	
	public static EgovMap fileUpload(MultipartFile file,ComfCnsVO  vo) throws IOException {
		EgovMap map = new EgovMap();
		if (file.getSize() > 0) {
			String fileRoot = utility.func.filePath;
			String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			// 랜덤 UUID+확장자로 저장될 savedFileName
			String savedFileName = UUID.randomUUID() + extension;
			
		
			map.put("fileNm", originalFileName);
			map.put("fileSize", file.getSize());

			String[] exts = new String[] { "jpg", "jpeg", "bmp", "png", "psd", "doc", "docx", "xls", "xlsx", "ppt",
					"pptx", "zip", "txt" };

			boolean uploadOK = false;
			for (String a : exts) {
				if (a.equals(extension.substring(1, extension.length()).toLowerCase())) {
					uploadOK = true;
					break;
				}
			}

			System.out.println("file extension : " + extension);

			if (!uploadOK) {
				System.out.println("file upload false");
				map.put("fileNm", "");
				map.put("sysFileNm", "");
				map.put("filePath", "");
				map.put("fileSize", 0);
				System.out.println("file upload false return > " + map.toString());
				return map;
			}

			File Folder = new File(fileRoot);
			if (!Folder.exists()) {
				try {
					Folder.mkdir(); // 폴더 생성합니다.
					Folder.setWritable(true); // 쓰기가능설정
					Folder.setReadable(true); // 읽기가능설정
				} catch (NullPointerException e) {
					utility.func.Logging("AMSComm.fileUpload", "Folder Null");
				}
			}

			File targetFile = new File(fileRoot + savedFileName);
			try {				
				byte[] data = file.getBytes();
				FileOutputStream fos = new FileOutputStream(fileRoot + savedFileName);
				fos.write(data);
				fos.close();
				
				// data type long => int 변경
				vo.setFileSize((int) file.getSize());
				vo.setFileNm(originalFileName);
				vo.setSysFileNm(savedFileName);
				vo.setFilePath("");
				
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile); // 실패시 저장된 파일 삭제
				utility.func.Logging("AMSComm.fileUpload", "IO");
			}

		} else {
			map.put("fileNm", "");
			map.put("sysFileNm", "");
			map.put("filePath", "");
			map.put("fileSize", 0);
		}
		return map;
	}
	
	/**
	 * 파일 name 추출
	 * @param extName
	 * @return
	 */
	private static String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
}
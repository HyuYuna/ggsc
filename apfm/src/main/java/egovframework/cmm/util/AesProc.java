package egovframework.cmm.util;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import egovframework.cmm.util.AES256Util;

public class AesProc {
	private static String key = "aes256-key-apf";
	static String rtn = "";

	public static String aesProc(String str){
		
		try {
			AES256Util aes256 = new AES256Util(key);
			
			String encText = aes256.aesEncode(str);
			String decText = aes256.aesDecode(encText);
			
			System.out.println("str ================= "+str);
			System.out.println("encText ================= "+encText);
			System.out.println("decText ================= "+decText);
			
			return rtn;
		} catch (InvalidKeyException e) {
			
			return null;
			
		} catch (UnsupportedEncodingException e) {
			return null;
			
		} catch (NoSuchAlgorithmException e) {
			return null;
			
		} catch (NoSuchPaddingException e) {
			return null;
			
		} catch (InvalidAlgorithmParameterException e) {
			return null;
			
		} catch (IllegalBlockSizeException e) {
			return null;
			
		} catch (BadPaddingException e) {
			return null;
			
		}
		
	}
}


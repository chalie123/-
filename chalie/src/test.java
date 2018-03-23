import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import security.AES256Service;
import security.SHA256Service;

public class test {
	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		SHA256Service SHA256 = new SHA256Service();
		AES256Service AES256 = new AES256Service();
		
		String key="1234567890123456";
		
		String a="asdfasdf";
		
//		for(int i=0;i<10;i++) {
//			System.out.println("SHA256 : "+SHA256.encrypt(a));
//		}
//		for(int i=0;i<10;i++) {
//			System.out.println("AES256 : "+AES256.encrypt(a,key));
//		}
		
		// 암호화 테스트
		String str1="";
		
		System.out.println("AES256 : "+str1+" → "+AES256.encrypt(str1, key));
		System.out.println("SHA256 : "+str1+" → "+SHA256.encrypt(str1));
		// 복호화 테스트
		String str2="";
		
		System.out.println("AES256 : "+AES256.decrypt(str2, key)+" ← "+str2);
				
		
	}
}

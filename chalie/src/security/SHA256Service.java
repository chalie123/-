package security;

import java.security.MessageDigest;

import org.springframework.stereotype.Service;

@Service
public class SHA256Service {

	public String encrypt(String text) {

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(text.getBytes());
			byte byteData[] = md.digest();

			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			StringBuffer sb1 = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					sb1.append('0');
				}
				sb1.append(hex);
			}

			return sb1.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}

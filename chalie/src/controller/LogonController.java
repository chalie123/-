package controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Service.AES256Service;
import Service.LogonService;
import Service.SHA256Service;

@Controller
public class LogonController {
	@Autowired
	LogonService logonService;
	@Autowired
	SHA256Service SHA256;
	@Autowired
	AES256Service AES256;

	@RequestMapping("/logon")
	public String LogHandle(@RequestParam Map<String, String> param) {
		// Map map =logonService.logonService(param);
		// System.out.println(map.size()==1);
		return "logon";
	}

	@RequestMapping("/logon2")
	public String Log2Handle(@RequestParam Map<String, String> param)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
//		String key=(String) session.getAttribute("key");
		String key="1234567890123456";
		AES256=new AES256Service(key);
		param.put("email", AES256.encrypt(param.get("email")));
		param.put("pass", SHA256.encrypt(param.get("pass")));
		boolean rst = logonService.logonService(param);
		if (rst) {
			return "/index";
		} else {
			return "/create";

		}
	}

}

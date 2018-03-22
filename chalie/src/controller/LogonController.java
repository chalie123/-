package controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String Log2Handle(HttpServletRequest application, HttpSession session,
			@RequestParam Map<String, String> param)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// String key=(String) application.getAttribute("key");
		// 암호화 키는 16자리 숫자 영문 String
		String key = "1234567890123456";
		param.put("email", AES256.encrypt(param.get("email"), key));
		param.put("pass", SHA256.encrypt(param.get("pass")));
		String rst = logonService.logonService(param);
		if (rst.length()!=0) {
			application.setAttribute("logons", rst);
			session.setAttribute("logon", rst);
			return "/index";
		} else {
			return "/create";

		}
	}

}

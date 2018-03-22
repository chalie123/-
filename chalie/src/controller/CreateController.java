package controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Service.AES256Service;
import Service.CreateService;
import Service.SHA256Service;

@Controller
public class CreateController {
	@Autowired
	CreateService createService;
	@Autowired
	SHA256Service SHA256;
	@Autowired
	AES256Service AES256;

	@RequestMapping("/create")
	public String CreateHandle() {

		return "/create";
	}

	@RequestMapping("/create2")
	public String Create2Handle(HttpServletRequest application, @RequestParam Map<String, String> param)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// String key=(String) application.getAttribute("key");
		// 암호화 키는 16자리 숫자 영문 String
		String key = "1234567890123456";
		param.put("email", AES256.encrypt(param.get("email"),key));
		param.put("pass", SHA256.encrypt(param.get("pass")));
		param.put("phone", AES256.encrypt(param.get("phone"),key));
		param.put("address", AES256.encrypt(param.get("address"),key));
		if (param.get("card") != null)
			param.put("card", AES256.encrypt(param.get("card"),key));
		if (param.get("carddate") != null)
			param.put("carddate", AES256.encrypt(param.get("carddate"),key));
		if (param.get("cardname") != null)
			param.put("cardname", AES256.encrypt(param.get("cardname"),key));
		if (param.get("cvc") != null)
			param.put("cvc", AES256.encrypt(param.get("cvc"),key));
		boolean rst = createService.createService(param);
		if (rst) {
			return "/logon";
		} else {
			return "/create";
		}
	}
}

package controller;



import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public String CreateHandle(){
		
			return "/create";
	}
	@RequestMapping("/create2")
	public String Create2Handle(HttpSession session, @RequestParam Map<String,String> param) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException{
//		String key=(String) session.getAttribute("key");
		String key="1234567890123456";
		AES256=new AES256Service(key);
		param.put("pass", SHA256.encrypt(param.get("pass")));
		param.put("email", AES256.encrypt(param.get("email")));
		param.put("address", AES256.encrypt(param.get("address")));
		param.put("phone", AES256.encrypt(param.get("phone")));
		param.put("card", AES256.encrypt(param.get("card")));
		param.put("carddate", AES256.encrypt(param.get("carddate")));
		param.put("cardname", AES256.encrypt(param.get("cardname")));
		param.put("cvc", AES256.encrypt(param.get("cvc")));
		boolean rst = createService.createService(param);
		if(rst) {
			return "/logon";
		}else {
			return "/create";
		}
	}
}

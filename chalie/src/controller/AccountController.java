package controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Service.AES256Service;
import Service.AccountService;
import Service.SHA256Service;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired
	SHA256Service SHA256;
	@Autowired
	AES256Service AES256;
	@Autowired
	AccountService AccountService;

	@RequestMapping("/create")
	public String createHandle(HttpServletRequest application, @RequestParam Map<String, String> param)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// String key=(String) application.getAttribute("key");
		// 암호화 키는 16자리 숫자 영문 String
		String key = "1234567890123456";
		param.put("serial", UUID.randomUUID().toString());
		param.put("email", AES256.encrypt(param.get("email"), key));
		param.put("pass", SHA256.encrypt(param.get("pass")));
		param.put("phone", AES256.encrypt(param.get("phone"), key));
		param.put("address", AES256.encrypt(param.get("address"), key));
		if (param.get("card") != null)
			param.put("card", AES256.encrypt(param.get("card"), key));
		if (param.get("carddate") != null)
			param.put("carddate", AES256.encrypt(param.get("carddate"), key));
		if (param.get("cardname") != null)
			param.put("cardname", AES256.encrypt(param.get("cardname"), key));
		if (param.get("cvc") != null)
			param.put("cvc", AES256.encrypt(param.get("cvc"), key));
		String rst = AccountService.create(param);
		if (rst.length() != 0) {
			return "/logon";
		} else {
			return "/create";
		}
	}

	@RequestMapping("/modify")
	public String modifyHandle(HttpSession session, @RequestParam Map<String,String>param) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// String key=(String) application.getAttribute("key");
		// 암호화 키는 16자리 숫자 영문 String
		String key = "1234567890123456";
		param.put("pass", SHA256.encrypt(param.get("pass")));
		if(param.get("phone")!=null)
			param.put("phone", AES256.encrypt(param.get("phone"), key));
		if(param.get("address")!=null)
			param.put("address", AES256.encrypt(param.get("address"), key));
		if(param.get("card")!=null) {
			param.put("card", AES256.encrypt(param.get("card"), key));
			param.put("cardname", AES256.encrypt(param.get("cardname"), key));
			param.put("carddate", AES256.encrypt(param.get("carddate"), key));
			param.put("cvc", AES256.encrypt(param.get("cvc"), key));
		}
		String rst=AccountService.modify(session, param);
		if(rst.length()!=0) {
			return "";
		}else {
			return "";
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("login")
	public String loginHandle(HttpServletRequest application, HttpSession session,
			@RequestParam Map<String, String> param)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// String key=(String) application.getAttribute("key");
		// 암호화 키는 16자리 숫자 영문 String
		String key = "1234567890123456";
		param.put("email", AES256.encrypt(param.get("email"), key));
		param.put("pass", SHA256.encrypt(param.get("pass")));
		String rst = AccountService.login(param);
		if (rst.length() != 0) {
			if(application.getAttribute("logons")!=null) {
				List<String> logons=new ArrayList<>();
				application.setAttribute("logons", logons.add(rst));
			}else {
				List<String> logons=new ArrayList<>();
				logons=(List<String>) application.getAttribute("logons");
				logons.add(rst);
				application.setAttribute("logons", logons);
			}
			session.setAttribute("logon", rst);
			return "/index";
		} else {
			return "/create";

		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("logout")
	public String logoutHandle(HttpServletRequest application,HttpSession session) {
		List<String> logons=new ArrayList<>();
		logons=(List<String>) application.getAttribute("logons");
		logons.remove(session.getAttribute("logon"));
		application.setAttribute("logons", logons);
		session.removeAttribute("logon");
		return "index";
	}
	
	@RequestMapping("delete")
	public String deleteHandle(HttpSession session) {
		Map name=new HashMap();
		name.put("name", session.getAttribute("logon"));
		AccountService.delete(name);
		
		return "";
	}
}
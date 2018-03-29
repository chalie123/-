package controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Service.AES256Service;
import Service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	
	AES256Service AES256;
	
	@RequestMapping("/member")
	public String memberHandle(HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String key = "1234567890123456";
		AES256=new AES256Service();
		List<Map<String,String>> list = new ArrayList<>();
		list=adminService.memberService();
		List<Map<String,String>> list2 = new ArrayList<>();
		for(Map map : list) {
			map.put("EMAIL", AES256.decrypt((String) map.get("EMAIL"), key)); 
			map.put("PHONE", AES256.decrypt((String) map.get("PHONE"), key)); 
			map.put("ADDRESS", AES256.decrypt((String) map.get("ADDRESS"), key)); 
			list2.add(map);
		}
		session.setAttribute("memberResult", list2);
		
		return"/adminmember";
	}
	@RequestMapping("/form")
	public String memberForm() {
		
		
		return"/FormView";
	}
	
	
}

package controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import Service.AES256Service;
import Service.AccountService;
import Service.MailService;
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
	@Autowired
	MailService MailService;

	@RequestMapping("/reset")
	public String resetMailSender(@RequestParam String email)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String key = "1234567890123456";
		Map map = new HashMap();
		map.put("email", AES256.encrypt(email, key));
		Map rst = AccountService.query(map);
		MailService.sendPasswordRecoveryMail(email, (String) rst.get("SERIAL"));
		return "redirect:/account/loginView";
	}

	@RequestMapping("/recovery/{serial}")
	public String recoveryHandle(HttpSession session, @PathVariable String serial,
			@RequestParam(required = false, name = "pass") String pass) {
		if (pass == null) {
			session.setAttribute("serial", serial);
			return "redirect:/account/recoveryView";
		} else {
			Map map = new HashMap();
			map.put("serial", serial);
			Map rst = AccountService.query(map);
			map.clear();
			map.put("name", rst.get("NAME"));
			map.put("pass", SHA256.encrypt(pass));
			AccountService.modify(map);
			session.removeAttribute("serial");
			return "redirect:/account/loginView";
		}
	}

	@RequestMapping("/verify/{serial}")
	public String verifyHandle(@PathVariable String serial) {
		boolean rst = AccountService.verify(serial);
		if (rst) {
			return "redirect:/index";
		} else {
			return "redirect:/index";
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(path = "/overlapCheck", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String overlapCheckHandle(@RequestParam Map<String, String> param)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String key = "1234567890123456";
		if (param.get("email") != null)
			param.put("email", AES256.encrypt(param.get("email"), key));
		boolean rst = AccountService.overlapCheck(param);
		if (rst) {
			Map map = new HashMap();
			map.put("overlapCheck", true);
			return new Gson().toJson(map);
		} else {
			Map map = new HashMap();
			map.put("overlapCheck", false);
			return new Gson().toJson(map);
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/create")
	public String createHandle(HttpServletRequest request, HttpSession session, @RequestParam Map<String, String> param)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// String key=(String) request.getServletContext().getAttribute("key");
		// ��ȣȭ Ű�� 16�ڸ� ���� ���� String
		String key = "1234567890123456";
		String email = param.get("email");
		String phone = param.get("phone");
		String address = param.get("address");
		String serial = UUID.randomUUID().toString();
		param.put("serial", serial);
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
		if (request.getServletContext().getAttribute("logons") == null) {
			Set logons = new HashSet();
			logons.add(rst);
			request.getServletContext().setAttribute("logons", logons);
		} else {
			Set logons = (Set) request.getServletContext().getAttribute("logons");
			logons.add(rst);
			request.getServletContext().setAttribute("logons", logons);
		}
		session.setAttribute("logon", rst);
		session.setAttribute("email", email);
		session.setAttribute("phone", phone);
		session.setAttribute("address", address);
		session.setAttribute("rank", "0");

		MailService.sendVerifyMail(email, serial);
		if (rst.length() != 0) {
			return "redirect:/index";
		} else {
			return "redirect:/index";
		}
	}

	@RequestMapping("/modify")
	public String modifyHandle(HttpSession session, @RequestParam Map<String, String> param)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// String key=(String) request.getServletContext().getAttribute("key");
		// ��ȣȭ Ű�� 16�ڸ� ���� ���� String
		String key = "1234567890123456";
		if (param.get("pass") != null) {
			param.put("pass", SHA256.encrypt(param.get("pass")));
		}
		if (param.get("phone") != null) {
			session.setAttribute("phone", param.get("phone"));
			param.put("phone", AES256.encrypt(param.get("phone"), key));
		}
		if (param.get("address") != null) {
			session.setAttribute("address", param.get("address"));
			param.put("address", AES256.encrypt(param.get("address"), key));
		}
		if (param.get("card") != null) {
			param.put("card", AES256.encrypt(param.get("card"), key));
			param.put("cardname", AES256.encrypt(param.get("cardname"), key));
			param.put("carddate", AES256.encrypt(param.get("carddate"), key));
			param.put("cvc", AES256.encrypt(param.get("cvc"), key));
		}
		param.put("name", (String) session.getAttribute("logon"));
		String rst = AccountService.modify(param);
		if (rst.length() != 0) {
			return "redirect:/account/modifyView";
		} else {
			return "redirect:/account/modifyView";
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/login")
	public String loginHandle(HttpServletRequest request, HttpSession session, @RequestParam Map<String, String> param)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		// String key=(String) request.getServletContext().getAttribute("key");
		// ��ȣȭ Ű�� 16�ڸ� ���� ���� String
		String key = "1234567890123456";
		param.put("emailRaw", param.get("email"));
		param.put("email", AES256.encrypt(param.get("email"), key));
		param.put("pass", SHA256.encrypt(param.get("pass")));
		List<Map> rst = AccountService.login(param);
		if (rst.size() != 0) {
			if (request.getServletContext().getAttribute("logons") == null) {
				Set logons = new HashSet();
				logons.add(rst.get(0).get("NAME"));
				request.getServletContext().setAttribute("logons", logons);
			} else {
				Set logons = new HashSet();
				logons = (Set) request.getServletContext().getAttribute("logons");
				logons.add(rst.get(0).get("NAME"));
				request.getServletContext().setAttribute("logons", logons);
			}
			session.setAttribute("logon", rst.get(0).get("NAME"));
			session.setAttribute("email", AES256.decrypt((String) rst.get(0).get("EMAIL"), key));
			session.setAttribute("phone", AES256.decrypt((String) rst.get(0).get("PHONE"), key));
			session.setAttribute("address", AES256.decrypt((String) rst.get(0).get("ADDRESS"), key));
			session.setAttribute("rank", rst.get(0).get("VERIFY_EMAIL"));
			return "redirect:/index";

		} else {
			return "redirect:/account/loginfailView";
		}
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping("/logout")
	public String logoutHandle(HttpServletRequest request, HttpSession session) {
		try {
			Set logons = (Set) request.getServletContext().getAttribute("logons");
			logons.remove((String) session.getAttribute("logon"));
			request.getServletContext().setAttribute("logons", logons);
			AccountService.logout((String) session.getAttribute("logon"));
			session.invalidate();
			return "redirect:/index";
		} catch (NullPointerException e) {
			e.printStackTrace();
			return "redirect:/index";
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/delete")
	public String deleteHandle(HttpSession session) {
		Map name = new HashMap();
		name.put("name", session.getAttribute("logon"));
		AccountService.delete(name);

		return "redirect:/account/logout";
	}
}
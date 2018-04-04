package Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {
	@Autowired
	SqlSessionTemplate template;

	public boolean verify(String email) {
		boolean b=template.update("lib_account.verify", email)==1;
		Map map=new HashMap();
		List<Map> list=template.selectList("lib_account.login", map);
		String name=(String) list.get(0).get("NAME");
		System.out.println("[SYSTEM]<Account> : "+name+" verified email.");
		return b;
	}
	
	public boolean overlapCheck(Map<String, String> param) {
		Map map=new HashMap();
		map=template.selectOne("lib_account.overlapCheck", param);
		if(map==null) {
			return true; 
		}else {
			return false;
		}
	}
	
	public String create(Map<String, String> param) {
		int rst = template.insert("lib_account.create", param);
		if (rst != 1) {
			System.out.println("[SYSTEM]<Account> : Account creation with name = " + param.get("name") + " failed.");
			
			return "";
		} else {
			System.out.println("[SYSTEM]<Account> : Account created with name = " + param.get("name") + ".");

			return param.get("name");
		}
	}

	public List login(Map<String, String> param) {
		List<Map> list = template.selectList("lib_account.login", param);
		if (list.size() == 1) {
			System.out.println("[SYSTEM]<Account> : " + list.get(0).get("NAME") + " Logged In.");
			return list;
		} else {
			System.out.println("[SYSTEM]<Account> : Login attempt with email = " + param.get("emailRaw") + " failed.");
			return list;
		}
	}
	
	public void logout(String name) {
		System.out.println("[SYSTEM]<Account> : "+name+" logged out.");
	}

	public String modify(HttpSession session, Map<String, String> param) {
		param.put("name", (String) session.getAttribute("name"));
		int rst=template.update("lib_account.modify", param);
		System.out.println("[SYSTEM]<Account> : " + param.get("name") + " modified account datail.");
		return rst==1?param.get("name"):"";
	}
	
	public void delete(Map<String, String> param) {
		String rename=UUID.randomUUID().toString().substring(0, 8);
		rename="DA"+rename;
		param.put("rename", rename);
		template.delete("lib_account.delete", param);
		System.out.println("[SYSTEM]<Account> : "+param.get("name")+" deleted account. name changed to "+rename+".");
	}
}

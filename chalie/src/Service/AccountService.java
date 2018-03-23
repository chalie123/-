package Service;

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

	public boolean overlapCheck(Map<String, String> param) {
		Map map=template.selectOne("lib_account.overlapCheck", param);
		map.size();
		if(map.size()!=0) {
			return false; 
		}else {
			return true;
		}
	}
	
	public String create(Map<String, String> param) {
		int rst = template.insert("lib_account.create", param);
		if (rst != 1) {
			System.out.println("[SYSTEM]<Account> : Account creation with name = " + param.get("name") + " failed.");
			return param.get("name");
		} else {
			System.out.println("[SYSTEM]<Account> : Account created with name = " + param.get("name") + ".");
			return "";
		}
	}

	public String login(Map<String, String> param) {
		List<Map> list = template.selectList("lib_account.login", param);
		if (list.size() == 1) {
			System.out.println("[SYSTEM]<Account> : " + list.get(0).get("NAME") + " Logged In.");
			return (String) list.get(0).get("NAME");
		} else {
			System.out.println("[SYSTEM]<Account> : Login attempt with name = " + param.get("name") + " failed.");
			return "";
		}
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

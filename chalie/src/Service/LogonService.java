package Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogonService {
	
	@Autowired
	SqlSessionTemplate template;
	
	public String logonService(Map<String,String> param) {
		List<Map> list= template.selectList("lib_account.logon", param);
		System.out.println(list.toString());
		return (String) list.get(0).get("NAME");
	}
}

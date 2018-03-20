package Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogonService {
	
	@Autowired
	SqlSessionTemplate template;
	
	public boolean createservice(Map<String,String> param) {
		System.out.println(param.toString());
		List map= template.selectList("log.logon", param);
		System.out.println(map.toString());
		return map.size()==1;
	}
}

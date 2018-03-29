package Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class AdminService {

	@Autowired
	SqlSessionTemplate template;
	
	public List<Map<String,String>> memberService() {
		List<Map<String, String>> list=template.selectList("lib_account.memberResult");
		return list;
		
		
		
		
	}
}

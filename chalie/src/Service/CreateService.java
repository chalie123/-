package Service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CreateService {
	@Autowired
	SqlSessionTemplate template;
	public boolean createService(Map<String,String> param){
		return template.insert("lib_account.create", param)==1;
	}
}

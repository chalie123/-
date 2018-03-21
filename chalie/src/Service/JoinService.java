package Service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService {
	@Autowired
	SqlSessionTemplate template;
	public boolean joinService(Map<String,String> param){
		return template.insert("lib_account.addAccount", param)==1;
	}
}

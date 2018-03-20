package Service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogonService {
	@Autowired
	SqlSessionTemplate template;
	public boolean logonService(Map<String,String> param){
		return template.insert("log.addAccount", param)==1;
	}
}

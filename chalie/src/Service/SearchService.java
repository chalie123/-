package Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchService {
	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> search(String arg){
		
		return template.selectList("books.search", "%"+arg+"%");
	}
}

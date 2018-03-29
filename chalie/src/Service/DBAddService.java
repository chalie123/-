package Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DBAddService {

	@Autowired
	SqlSessionTemplate template;

	@SuppressWarnings("rawtypes")
	public boolean add(Map map) {

		return template.insert("books.add", map)==1;
	}
}

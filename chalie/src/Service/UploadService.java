package Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UploadService {
	@Autowired
	SqlSessionTemplate template;
	public boolean uploadService(Map<String, String> param) {
		return template.insert("upload.insert",param) ==1;
	}
	public List<Map> uploadSelectService(Map<String, String> param) {
		return template.selectList("upload.select",param);
	}
	public boolean uploadDeleteService(Map<String, String> param) {
		return template.delete("upload.delete",param)==1;
	}
}

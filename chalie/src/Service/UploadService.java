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
	//한 게시물의 전체 업로드 파일 삭제
	public boolean uploadDeleteService(Map<String, String> param) {
		return template.delete("upload.delete",param)==1;
	}
	//한 게시물의 한 업로드 파일 삭제
	public boolean uploadDeleteOneService(Map<String, String> param) {
		return template.delete("upload.deleteOne",param)==1;
	}
}

package Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardService {
	@Autowired
	SqlSessionTemplate template;

	// 전부 불러오거나 파라미터가 있다면 검색으로 간주하여 해당 파라미터를 만족하는 값을 불러옴.
	public List<Map> freeBoardService(Map<String, String> param) {
		if (param.containsKey("key")) {
			//검색시
			String key =param.get("key")+"%";
			param.remove("key");
			param.put("key",key);
			return template.selectList("free.selectSearch", param);
		} else if (param.containsKey("UUID")) {
			//글 읽으려고 할 시
			freeBoardUpdateService(param);
			return template.selectList("free.selectText", param);
		} else if(param.containsKey("board")) {
			return template.selectList("free.selectBoard", param);
		}else {
			//삭제할 부분
			return template.selectList("free.selectAll");
		}
	}
	public List<Map> BoardService(Map<String, String> param) {
		if (param.containsKey("key")) {
			String key =param.get("key")+"%";
			param.remove("key");
			param.put("key",key);
			return template.selectList("free.selectSearch", param);
		} 
		if(param.containsKey("id")) {
			return template.selectList("free.selectIdSearch", param);
		}
		return template.selectList("free.selectBoard", param);
	}
	public boolean freeBoardUpdateService(Map<String, String> param) {
		return template.update("free.updateViews", param)==1;
	}
	public boolean freeBoardRegisterService(Map<String, String> param) {
		return template.update("free.registerContent", param)==1;
	}
	public boolean freeBoardUpdateContentService(Map<String, String> param) {
		return template.update("free.updateContent", param)==1;
	}
	public boolean freeBoardDeleteService(Map<String, String> param) {
		return template.delete("free.deleteContent",param)==1;
	}
}

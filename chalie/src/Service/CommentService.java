package Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired 
	SqlSessionTemplate template;
	//댓글 불러오기
	public List<Map> commentService(Map<String, String> param) {
		return template.selectList("comment.selectComments", param);
	}
	//댓글 등록
	public List<Map> commentRegisterService(Map<String, String> param) {
		return template.selectList("comment.registerComments", param);
	}
	//하나의 게시물에 달린 댓글 전체 삭제
	public boolean commentDeleteService(Map<String, String> param) {
		return template.delete("comment.deleteComments", param)==1;
	}
	//하나의 댓글 삭제
	public boolean oneCommentDeleteService(Map<String, String> param) {
		return template.delete("comment.deleteOneComment", param)==1;
	}
}

package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Service.CommentService;
import Service.FreeBoardService;
import Service.UploadService;

@Controller
public class BoardController {
	@Autowired
	FreeBoardService freeBoardService;
	@Autowired
	CommentService commentService;
	@Autowired
	UploadService uploadService;

	// 게시물 목록에 세팅 처리 메서드
	@RequestMapping("/contentIndex")
	public String indexViewController(@RequestParam(required = false, name = "key") String key,
			@RequestParam("board") String board, @RequestParam(required = false, name = "index") Integer index,
			Model mav, @RequestParam("link") String link) {
		Map param = new HashMap<String, String>();
		if (key != null)
			param.put("key", key);
		if (index == null)
			index = 0;

		param.put("board", board);
		List<Map> freeBoardList = freeBoardService.BoardService(param);
		// 20개만 페이지에 넘김.
		// 파라미터 값에 따라 다르게 출력
		// 디폴트 파라미터는 0
		// 파라미터 있으면 그 항목으로 없으면 0로
		int maxIndex = freeBoardList.size() / 20 + 1;
		if (freeBoardList.size() % 20 == 0) {
			maxIndex = freeBoardList.size() / 20;
		}
		List<Map> list = new LinkedList<>();

		for (int i = index * 20; i < (index + 1) * 20; i++) {
			if (freeBoardList.size() - 1 < i) {
				break;
			}
			list.add(freeBoardList.get(i));
		}
		mav.addAttribute("link", link);
		mav.addAttribute("board", board);
		mav.addAttribute("list", list);
		mav.addAttribute("index", index);
		mav.addAttribute("maxIndex", maxIndex);
		return link + "View";
	}

	// 게시물 본문 보기 처리 메서드
	@RequestMapping("/contentView")
	public String textViewController(@RequestParam Map<String, String> param, Model mav,
			@RequestParam("link") String link,@RequestParam("board") String board) {
		mav.addAttribute("text", freeBoardService.freeBoardService(param).get(0));
		mav.addAttribute("comments", commentService.commentService(param));
		mav.addAttribute("files", uploadService.uploadSelectService(param));
		mav.addAttribute("link", link);
		mav.addAttribute("board", board);
		return link + "ContentView";
	}

	// 댓글 달기 처리 메서드
	@RequestMapping("/commentRegister")
	public String commentRegisterController(@RequestParam Map<String, String> param, HttpSession session, Model mav,
			@RequestParam("link") String link,@RequestParam("board") String board) {
		// 아이디 비로그인시 등록 x
		if (session.getAttribute("id") == null) {
			// 로그인 안됐으니 로그인 창으로 보넨다.
			return "";
		} else {
			String[] array = UUID.randomUUID().toString().split("-");
			String uuid = array[0] + "-" + array[1];
			param.put("comments_UUID", uuid);
			param.put("user_id", (String) session.getAttribute("id"));
			commentService.commentRegisterService(param);
		}
		String contentUUID = param.get("UUID");
		Map<String, String> UUIDMap = new HashMap<>();
		UUIDMap.put("UUID", contentUUID);
		mav.addAttribute("text", freeBoardService.freeBoardService(UUIDMap).get(0));
		mav.addAttribute("comments", commentService.commentService(UUIDMap));
		mav.addAttribute("files", uploadService.uploadSelectService(UUIDMap));
		mav.addAttribute("link", link);
		mav.addAttribute("board", board);
		return link + "ContentView";
	}

	@RequestMapping("/contentWriteView")
	public String writeController(HttpSession session, Model mav, @RequestParam("link") String link,@RequestParam("board") String board) {
		if (session.getAttribute("id") == null) {
			// 로그인이 안됐으니 로그인 창으로 보넨다.
			return "";
		} else {
			mav.addAttribute("link", link);
			mav.addAttribute("board", board);
			return link + "WriteView";
		}
	}

	@RequestMapping("/contentWrite")
	public String tmpController(@RequestParam Map<String, String> param, HttpSession session, HttpServletRequest hsr,
			@RequestParam(name = "other") MultipartFile[] other, Model mav, @RequestParam("link") String link,
			@RequestParam("board") String board) {
		String uuid;
		if (session.getAttribute("id") == null) {
			// 로그인 안됐으니 로그인 창으로 보넨다.
			return "";
		} else {
			String[] array = UUID.randomUUID().toString().split("-");
			uuid = array[0] + "-" + array[1];
			param.put("board", board);
			param.put("UUID", uuid);
			param.put("user_id", (String) session.getAttribute("id"));
			freeBoardService.freeBoardRegisterService(param);
		}
		ServletContext ctx = hsr.getServletContext();
		for (MultipartFile file : other) {
			if (!file.isEmpty()) {
				String fileName = String.valueOf(System.currentTimeMillis());
				File dst = new File(ctx.getRealPath("/image"), fileName);
				try {
					file.transferTo(dst);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				Map<String, String> uploadParam = new HashMap<>();
				uploadParam.put("UUID", uuid);
				uploadParam.put("upload_File", "/image/" + fileName);
				// 중복이름 방지 추가
				uploadService.uploadService(uploadParam);
			}
		}
		String contentUUID = param.get("UUID");
		Map<String, String> UUIDMap = new HashMap<>();
		UUIDMap.put("UUID", contentUUID);
		mav.addAttribute("files", uploadService.uploadSelectService(UUIDMap));
		mav.addAttribute("comments", commentService.commentService(UUIDMap));
		mav.addAttribute("text", freeBoardService.freeBoardService(UUIDMap).get(0));
		mav.addAttribute("link", link);
		mav.addAttribute("board", board);
		return link + "ContentView";
	}

	// 작성글 삭제 혹은 수정 uri로 보넴
	@RequestMapping("/contentModify")
	public String modifyController(@RequestParam Map<String, String> param, Model mav,
			@RequestParam("link") String link, @RequestParam("board") String board) {
		if (param.get("delete") != null) {
			// 삭제 메서드 작동
			param.remove("delete");
			commentService.commentDeleteService(param);
			uploadService.uploadDeleteService(param);
			freeBoardService.freeBoardDeleteService(param);
			// 서버 컴퓨터에도 데이터 삭제 추가
			return "redirect:/contentIndex?link="+link+"&board="+board;
		}
		param.remove("modify");
		mav.addAttribute("board", board);
		mav.addAttribute("link", link);
		mav.addAttribute("text", freeBoardService.freeBoardService(param).get(0));
		if (uploadService.uploadSelectService(param) != null)
			mav.addAttribute("files", uploadService.uploadSelectService(param));
		return link + "ModifyView";
	}

	@RequestMapping("/contentRewrite")
	public String modifyContentController(@RequestParam Map<String, String> param, HttpSession session, Model mav,
			@RequestParam("board") String board, @RequestParam("link") String link, HttpServletRequest hsr,
			@RequestParam(name = "other") MultipartFile[] other,
			@RequestParam(name = "deleteFile", required = false) String[] deleteFile) {
		ServletContext ctx = hsr.getServletContext();
		// deleteFile 로 넘어오는 이름에 해당하는 파일들 삭제
		if (deleteFile != null) {
			for (int i = 0; i < deleteFile.length; i++) {
				// 1.디비에서 삭제
				Map<String, String> tmp = new HashMap<>();
				tmp.put("deleteFile", deleteFile[i]);
				uploadService.uploadDeleteOneService(tmp);
				tmp.remove("deleteFile");
				// 2.서버 컴퓨터에서 삭제
				String fileName = deleteFile[i].split("/")[(deleteFile[i].split("/").length) - 1];
				File tmpFile = new File(ctx.getRealPath("/image"), fileName);
				if (tmpFile.exists()) {
					tmpFile.delete();
				}
			}
		}
		for (MultipartFile file : other) {
			if (!file.isEmpty()) {
				String fileName = String.valueOf(System.currentTimeMillis());
				File dst = new File(ctx.getRealPath("/image"), fileName);
				try {
					file.transferTo(dst);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				Map<String, String> uploadParam = new HashMap<>();
				uploadParam.put("UUID", param.get("UUID"));
				uploadParam.put("upload_File", "/image/" + fileName);
				// 중복이름 방지 추가
				uploadService.uploadService(uploadParam);
			}
		}
		freeBoardService.freeBoardUpdateContentService(param);
		mav.addAttribute("text", freeBoardService.freeBoardService(param).get(0));
		mav.addAttribute("comments", commentService.commentService(param));
		mav.addAttribute("files", uploadService.uploadSelectService(param));
		mav.addAttribute("link", link);
		mav.addAttribute("board", board);
		return link + "ContentView";
	}

	// 댓글 삭제 컨트롤러
	@RequestMapping("/commentDelete")
	public String commentDeleteController(@RequestParam Map<String, String> param, Model mav,
			@RequestParam("link") String link, @RequestParam("board") String board) {
		// 댓글 삭제 메서드 작동
		commentService.oneCommentDeleteService(param);
		mav.addAttribute("text", freeBoardService.freeBoardService(param).get(0));
		mav.addAttribute("comments", commentService.commentService(param));
		mav.addAttribute("files", uploadService.uploadSelectService(param));
		mav.addAttribute("link", link);
		mav.addAttribute("board", board);
		return link + "ContentView";
	}

}

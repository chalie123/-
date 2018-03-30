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
	public ModelAndView indexViewController(@RequestParam Map<String, String> param) {
		int index = 0;
		if (param.containsKey("index")) {
			index = Integer.valueOf(param.get("index"));
		}
		if (param.containsKey("index")) {
			param.remove("index");
		}
		List<Map> freeBoardList = freeBoardService.freeBoardService(param);
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
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/contentIndex");
		mav.addObject("list", list);
		mav.addObject("index", index);
		mav.addObject("maxIndex", maxIndex);
		return mav;
	}

	// 게시물 본문 보기 처리 메서드
	@RequestMapping("/contentView")
	public ModelAndView textViewController(@RequestParam Map<String, String> param) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/contentView");
		mav.addObject("text", freeBoardService.freeBoardService(param).get(0));
		mav.addObject("comments", commentService.commentService(param));
		mav.addObject("files", uploadService.uploadSelectService(param));
		return mav;
	}

	// 댓글 달기 처리 메서드
	@RequestMapping("/commentRegister")
	public ModelAndView commentRegisterController(@RequestParam Map<String, String> param, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 아이디 비로그인시 등록 x
		if (session.getAttribute("id") == null) {
			// 로그인 안됐으니 로그인 창으로 보넨다.
			mav.setViewName("");
			return mav;
		} else {
			String[] array = UUID.randomUUID().toString().split("-");
			String uuid = array[0] + "-" + array[1];
			param.put("comments_UUID", uuid);
			param.put("user_id", (String) session.getAttribute("id"));
			commentService.commentRegisterService(param);
			mav.setViewName("/contentView");
		}
		String contentUUID = param.get("UUID");
		Map<String, String> UUIDMap = new HashMap<>();
		UUIDMap.put("UUID", contentUUID);
		mav.addObject("text", freeBoardService.freeBoardService(UUIDMap).get(0));
		mav.addObject("comments", commentService.commentService(UUIDMap));
		mav.addObject("files", uploadService.uploadSelectService(UUIDMap));
		return mav;
	}

	@RequestMapping("/contentWriteView")
	public String writeController(HttpSession session) {
		if (session.getAttribute("id") == null) {
			// 로그인이 안됐으니 로그인 창으로 보넨다.
			return "";
		} else {
			return "/contentWrite";
		}
	}

	@RequestMapping("/contentWrite")
	public ModelAndView tmpController(@RequestParam Map<String, String> param, HttpSession session,
			HttpServletRequest hsr, @RequestParam(name = "other") MultipartFile[] other) {
		ModelAndView mav = new ModelAndView();
		String uuid;
		if (session.getAttribute("id") == null) {
			// 로그인 안됐으니 로그인 창으로 보넨다.
			mav.setViewName("");
			return mav;
		} else {
			String[] array = UUID.randomUUID().toString().split("-");
			uuid = array[0] + "-" + array[1];
			param.put("UUID", uuid);
			param.put("user_id", (String) session.getAttribute("id"));
			freeBoardService.freeBoardRegisterService(param);
			mav.setViewName("/contentView");
		}
		ServletContext ctx = hsr.getServletContext();
		for (MultipartFile file : other) {
			if (!file.isEmpty()) {
				String fileName=String.valueOf(System.currentTimeMillis());
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
		mav.addObject("files", uploadService.uploadSelectService(UUIDMap));
		mav.addObject("comments", commentService.commentService(UUIDMap));
		mav.addObject("text", freeBoardService.freeBoardService(UUIDMap).get(0));
		return mav;
	}

	// 작성글 삭제 혹은 수정 uri로 보넴
	@RequestMapping("/contentModify")
	public ModelAndView modifyController(@RequestParam Map<String, String> param) {
		ModelAndView mav = new ModelAndView();
		if (param.get("delete") != null) {
			mav.setViewName("redirect:/contentIndex");
			// 삭제 메서드 작동
			param.remove("delete");
			commentService.commentDeleteService(param);
			uploadService.uploadDeleteService(param);
			freeBoardService.freeBoardDeleteService(param);
			// 서버 컴퓨터에도 데이터 삭제 추가
			return mav;
		}
		param.remove("modify");
		mav.setViewName("/contentModify");
		mav.addObject("text", freeBoardService.freeBoardService(param).get(0));
		if (uploadService.uploadSelectService(param) != null)
			mav.addObject("files", uploadService.uploadSelectService(param));
		return mav;
	}

	@RequestMapping("/contentRewrite")
	public ModelAndView modifyContentController(@RequestParam Map<String, String> param, HttpSession session,
			HttpServletRequest hsr, @RequestParam(name = "other") MultipartFile[] other,
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
				String fileName=String.valueOf(System.currentTimeMillis());
				File dst = new File(ctx.getRealPath("/image"),fileName);
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
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/contentView");
		mav.addObject("text", freeBoardService.freeBoardService(param).get(0));
		mav.addObject("comments", commentService.commentService(param));
		mav.addObject("files", uploadService.uploadSelectService(param));
		return mav;
	}

	// 댓글 삭제 컨트롤러
	@RequestMapping("/commentDelete")
	public ModelAndView commentDeleteController(@RequestParam Map<String, String> param) {
		// 댓글 삭제 메서드 작동
		System.out.println(param.toString());
		commentService.oneCommentDeleteService(param);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/contentView");
		mav.addObject("text", freeBoardService.freeBoardService(param).get(0));
		mav.addObject("comments", commentService.commentService(param));
		mav.addObject("files", uploadService.uploadSelectService(param));
		return mav;
	}

}

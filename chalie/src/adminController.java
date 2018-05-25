import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
//뷰, 타일즈 연동
@Controller
public class adminController {
	@RequestMapping("/adminContentModifyView")
	public String modifyContentViewController(@RequestParam Map<String, String> param, Model mav,
			@RequestParam(required = true, name = "link") String link,
			@RequestParam(required = true, name = "board") String board) {
		mav.addAttribute("board", board);
		mav.addAttribute("link", link);
		mav.addAttribute("files", param.get("files"));
		return "adminContentModify";
	}

	@RequestMapping("/adminContentModify")
	public String modifyContentController(@RequestParam Map<String, String> param, HttpSession session, Model mav,
			HttpServletRequest hsr, @RequestParam(name = "other") MultipartFile[] other,
			@RequestParam(name = "deleteFile", required = false) String[] deleteFile) {
		ServletContext ctx = hsr.getServletContext();
		// deleteFile 로 넘어오는 이름에 해당하는 파일들 삭제
		if (deleteFile != null) {
			for (int i = 0; i < deleteFile.length; i++) {
				// 서버 컴퓨터에서 삭제
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
			}
		}
		return "redirect:/index";
	}
}

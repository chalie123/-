package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/chat")
	public String testHandle() {
		
		return "chatView";
	}
	@RequestMapping("/main")
	public String mainHandle() {
		
		return "MainTemplate";
	}
	@RequestMapping("/t_menu1-1")
	public String tinHandle() {
		
		return "t_menu1-1";
	}
}

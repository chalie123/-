package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/chat")
	public String testHandle() {
		
		return "chatView";
	}
	@RequestMapping("/test/tiles/{path}")
	public String testHandle01(@PathVariable String path,Model model) {
		String side="side"+path.substring(0,1)+".jsp";
		String view="view"+path+".jsp";
		System.out.println(side);
		System.out.println(view);
		model.addAttribute("side",side);
		model.addAttribute("view",view);
		return "t_view"+path;
	}

}

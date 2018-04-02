package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WordReferenceController {
	
	@RequestMapping("/word")
	public String wordHandle() {
		return"word";
	}
}

package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogController {
	
	
	@RequestMapping("/log")
	public String LogHandle() {
		
		return"log";
	}
	
	
}

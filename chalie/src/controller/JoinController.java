package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Service.JoinService;

@Controller
public class JoinController {
	@Autowired 
	JoinService joinService;
	@RequestMapping("/newAccount")
	public String logonController(@RequestParam Map<String,String> param){
		boolean rst =joinService.joinService(param);
		
		return "index";
	}
}

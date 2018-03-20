package controller;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Service.CreateService;


@Controller
public class CreateController {
	@Autowired
	CreateService createService;

	@RequestMapping("/create")
	public String CreateHandle(){
		
			return "/create";
	}
	@RequestMapping("/create2")
	public String Create2Handle(@RequestParam Map<String,String> param){
		System.out.println("들어옵");
	boolean rst = createService.logonService(param);
		if(rst) {
			return "/logon";
		}else {
			return "/create";
		}
	}
}

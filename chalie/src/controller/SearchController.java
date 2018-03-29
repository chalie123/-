package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@RequestMapping("")
	public String SearchHandle(HttpSession session, @RequestParam("arg") String arg) {
		List<Map> list=new ArrayList<Map>(searchService.search(arg));
//		for(Map l : list) {
//			System.out.println(l.toString());
//		}
//		list.clear();
		session.setAttribute("searchResult", list);
		
		return "searchView";
	}
}

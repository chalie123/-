package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@RequestMapping("/{arg}")
	public String SearchHandle(HttpSession session, @PathVariable String path,@RequestParam("arg") String arg) {
		List<Map> list=new ArrayList<Map>();
		switch(path) {
		case "all":
			list=searchService.search(arg);
			break;
		case "common":
			list=searchService.search(arg);
			break;
		case "kid":
			list=searchService.search(arg);
			break;
		case "newcome":
			list=searchService.search(arg);
			break;
		case "recommend":
			list=searchService.search(arg);
			break;
		case "popular":
			list=searchService.search(arg);
		}
		session.setAttribute("searchResult", list);
		
//		for(Map l : list) {
//			System.out.println(l.toString());
//		}
//		list.clear();
		
		return "searchView";
	}
}

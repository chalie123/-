package controller;

import java.util.ArrayList;
import java.util.HashMap;
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
	public String SearchHandle(HttpSession session, @PathVariable String path, @RequestParam("arg") String arg) {
		if (session.getAttribute("s") == null)
			session.setAttribute("s", String.valueOf((int) (Math.random() * 100)));
		List<Map> list = new ArrayList<Map>();
		Map<String, String> param = new HashMap<>();
		param.put("arg", arg);
		switch (path) {
		case "all":
			list = searchService.search(param);
			break;
		case "common":
			param.put("subject", "1");
			list = searchService.search(param);
			break;
		case "kid":
			param.put("subject", "2");
			list = searchService.search(param);
			break;
		case "newcome":
			param.put("date", "");
			list = searchService.search(param);
			break;
		case "recommend":
			param.put("arg", (String) session.getAttribute("s"));
			list = searchService.search(param);
			break;
		case "popular":
			param.put("arg", (String) session.getAttribute("s"));
			list = searchService.search(param);
		}
		session.setAttribute("searchResult", list);

		return "searchResultView";
	}
}

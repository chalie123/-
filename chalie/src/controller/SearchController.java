package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import Service.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;

	@RequestMapping(path = "/search/Controller/{path}", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String SearchHandle(HttpServletRequest req, HttpSession session, @PathVariable String path) {
		if (session.getAttribute("s1") == null)
			session.setAttribute("s1", String.valueOf((int) (Math.random() * 100)+100));
		if (session.getAttribute("s2") == null)
			session.setAttribute("s2", String.valueOf((int) (Math.random() * 100)+100));
		String arg=req.getParameter("arg");
		List<Map> rst = new ArrayList<Map>();
		Map<String, String> param = new HashMap<>();
		param.put("arg", arg);
		switch (path) {
		case "all":
			rst = searchService.search(param);
			break;
		case "common":
			param.put("book", "true");
			rst = searchService.search(param);
			break;
		case "nonbook":
			param.put("nonbook", "true");
			rst=searchService.search(param);
		case "kid":
			param.put("subject", "3");
			rst = searchService.search(param);
			break;
		case "newcome":
			param.put("date", "desc");
			rst = searchService.search(param);
			break;
		case "recommend":
			param.put("arg", (String) session.getAttribute("s1"));
			rst = searchService.search(param);
			break;
		case "popular":
			param.put("arg", (String) session.getAttribute("s2"));
			rst = searchService.search(param);
		}
		if (rst.size()!=0) {
			return new Gson().toJson(rst);
		} else {
			Map map = new HashMap();
			map.put("result", false);
			return new Gson().toJson(map);
		}
	}
}

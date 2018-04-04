package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import Service.RentalService;

@Controller
@RequestMapping("/rental")
public class RentalController {

   @Autowired
   RentalService rentalService;
   
   @RequestMapping(path="/query", produces = "application/json;charset=UTF-8")
   @ResponseBody
   public String queryHandle(HttpSession session) {
      String name=(String) session.getAttribute("logon");
      List<Map> rst=rentalService.query(name);
      return new Gson().toJson(rst);
   }
   
   @RequestMapping(path="/rental", produces = "application/json;charset=UTF-8")
   @ResponseBody
   public String rentalHandle(HttpSession session, @RequestParam Map<String, String> param) {
      param.put("name", (String) session.getAttribute("logon"));
      boolean rst=rentalService.rental(param);
      Map map=new HashMap();
      map.put("result", rst);
      return new Gson().toJson(map);
   }
   
   @RequestMapping(path="/reservation", produces = "application/json;charset=UTF-8")
   @ResponseBody
   public String reservationHandle(HttpSession session, @RequestParam Map<String, String> param) {
      param.put("name", (String)session.getAttribute("logon"));
      boolean rst=rentalService.reservation(param);
      Map map=new HashMap();
      map.put("result", rst);
      return new Gson().toJson(map);
   }
   
   @RequestMapping(path="/cancel", produces = "application/json;charset=UTF-8")
   @ResponseBody
   public String cancelHandle(HttpSession session, @RequestParam Map<String, String> param) {
	  System.out.println(param.get("NO"));
      param.put("name", (String)session.getAttribute("logon"));
      boolean rst=rentalService.cancel(param);
      Map map=new HashMap();
      map.put("result", rst);
      return new Gson().toJson(map);
   }
}

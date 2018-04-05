package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

   @RequestMapping({"/index","/"})
   public String indexHandle() {
      return "t_index";
   }
   @RequestMapping("/search/{path}")
   public String searchHandle(@PathVariable String path) {
      String p="t_search_"+path;
      return p;
   }
   @RequestMapping("/account/{path}")
   public String accountHandle(@PathVariable String path) {
      String p="t_account_"+path;
      return p;
   }
   @RequestMapping("/elib/{path}")
   public String elibHandle(@PathVariable String path) {
      String p="t_elib_"+path;
      return p;
   }
   @RequestMapping("/community/{path}")
   public String communityHandle(@PathVariable String path) {
      String p="t_community_"+path;
      return p;
   }
   @RequestMapping("/guide/{path}")
   public String guideHandle(@PathVariable String path) {
      String p="t_guide_"+path;
      return p;
   }
   @RequestMapping("/info/{path}")
   public String infoHandle(@PathVariable String path) {
      String p="t_info_"+path;
      return p;
   }
}
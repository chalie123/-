package Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentalService {

   @Autowired
   SqlSessionTemplate template;

   public List<Map> query(String name) {

      return template.selectList("books.query", name);
   }

   public boolean rental(Map<String, String> param) {

      return template.update("books.rental", param) == 1;
   }

   public boolean reservation(Map<String, String> param) {

      return template.update("books.reservation", param) == 1;
   }

   public boolean cancel(Map<String, String> param) {

      return template.update("books.cancel", param) == 1;
   }
}
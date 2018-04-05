package Service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
   @Autowired
   JavaMailSender mailSender;

   public void sendVerifyMail(String email, String serial) {
      String ip="localhost";
      MimeMessage message = mailSender.createMimeMessage();
      try {
         message.setRecipient(RecipientType.TO, 
                        new InternetAddress(email));
         message.setFrom(new InternetAddress("admin@chalielibrary.org"));
         message.setSubject("[찰리도서관] 회원가입 인증");
         String content = "가입을 <b>축하</b>드립니다.\n사용에 불편하신점이 있으면 고객센터에 글을 남겨주세요.\n";
         content +="<a href=\"http://"+ip+"/account/verify/"+serial+"\">이메일 인증</a>";
         message.setContent(content, "text/html;charset=utf-8");
         
         mailSender.send(message);
         System.out.println("[SYSTEM]<Account> : Account verification mail sent to "+email+".");
      } catch (MessagingException e) {
         e.printStackTrace();
      }
   }
   public void sendPasswordRecoveryMail(String email, String serial) {
      String ip="localhost";
      MimeMessage message = mailSender.createMimeMessage();
      try {
         message.setRecipient(RecipientType.TO, 
                        new InternetAddress(email));
         message.setFrom(new InternetAddress("admin@chalielibrary.org"));
         message.setSubject("[찰리도서관] 비밀번호 재설정");
         String content ="<a href=\"http://"+ip+"/account/recovery/"+serial+"\">비밀번호 재설정</a>";
         message.setContent(content, "text/html;charset=utf-8");
         
         mailSender.send(message);
         System.out.println("[SYSTEM]<Account> : Password recovery mail sent to "+email+".");
      } catch (MessagingException e) {
         e.printStackTrace();
      }
   }

}
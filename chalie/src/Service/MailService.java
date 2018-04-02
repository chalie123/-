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

	public void sendVerifyMail(String email, String code) {
		String ip="localhost";
		MimeMessage message = mailSender.createMimeMessage();
		try {
			// 받을 사람 -
			message.setRecipient(RecipientType.TO, 
								new InternetAddress(email));
			// 보내는 사람 - google 서버같은 경우는 이 설정을 무시함.
			message.setFrom(new InternetAddress("admin@chalielibrary.org"));
			// 제목
			message.setSubject("[찰리도서관] 회원가입 인증");
			// 내용
			String content = "가입을 <b>축하</b>드립니다.\n사용에 불편하신점이 있으면 고객센터에 글을 남겨주세요.\n";
			content +="<a href=\"http://"+ip+"/account/verify/"+code+"\">이메일 인증</a>";
			message.setContent(content, "text/html;charset=utf-8");
				// content 설정을 text/html;charset=utf-8 이라고 보내면.. HTML로 보낼수도 있다.
			
			mailSender.send(message);
			System.out.println("[SYSTEM]<Account> : Account verification mail sent to "+email+".");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}

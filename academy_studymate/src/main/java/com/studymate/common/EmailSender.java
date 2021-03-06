package com.studymate.common;

import javax.inject.Named;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

@Named
public class EmailSender {
	@Autowired
    protected JavaMailSender  mailSender;
	
	 public void SendEmail(EmailDto email) throws Exception {
         
         MimeMessage msg = mailSender.createMimeMessage();
         try {
             msg.setSubject(email.getSubject(), "UTF-8");
             msg.setText(email.getContent(), "UTF-8", "html");
             msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
            
         } catch (MessagingException e) {
             System.out.println("MessagingException");
             e.printStackTrace();
         }
         try {
             mailSender.send(msg);
         } catch (MailException e) {
             System.out.println("MailException발생");
             e.printStackTrace();
         }
     }
}

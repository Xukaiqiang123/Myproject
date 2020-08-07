package com.wincom.controller;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
@Controller
@RequestMapping("mail")
public class SendMailController {
    @Resource
    private JavaMailSender javaMailSender;//在spring中配置的邮件发送的bean

    @RequestMapping(value="/send",method= RequestMethod.POST)
    public String sendMail03(HttpServletRequest request) {
        MimeMessage mMessage = javaMailSender.createMimeMessage();//创建邮件对象
        MimeMessageHelper mMessageHelper;
        String from = "1065917052@qq.com";
        String sendto = request.getParameter("sendto");
        System.out.println(sendto);
        String emailname = request.getParameter("emailname");
        String emailcontent = request.getParameter("emailcontent");
        try {
            System.out.println(from);
            mMessageHelper = new MimeMessageHelper(mMessage, true);
            mMessageHelper.setFrom(from);//发件人邮箱
            mMessageHelper.setTo(sendto);//收件人邮箱
            mMessageHelper.setSubject(emailname);//邮件的主题
            mMessageHelper.setText(emailcontent);//邮件的文本内容，true表示文本以html格式打开
            javaMailSender.send(mMessage);//发送邮件
        } catch (MessagingException e) {
            e.printStackTrace();
            return "senderror";
        }
        return "sendsuccess";
    }
}

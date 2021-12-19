package com.devpro.controller;


import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.Contact;
import com.devpro.repositories.ContactRepos;
import com.devpro.services.SendEmailService;

@Controller
public class ContactController extends BaseController{

	@Autowired
	ContactRepos contactRepos;
	
	@Autowired
	SendEmailService sendEmailService;
	
	/**
	 * 
	 * @param model:    trung gian trao đổi thông tin giữa Controller và View(Jsp)
	 * @param request:  Chứa các thông tin Trình Duyệt truy vấn thông qua mẫu:
	 *                  ?abc=xyz
	 * @param response: Dữ liệu trả về Trình Duyệt.
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		return "front-end/contact";
	}
	
	@PostMapping("/contact")
	public String saveContact(final HttpServletRequest request) {
		Contact con = new Contact();
		con.setName(request.getParameter("name"));
		con.setEmail(request.getParameter("email"));
		con.setMessage(request.getParameter("message"));
		con.setCreatedDate(LocalDate.now());
		contactRepos.save(con);
		
		sendEmailService.sendMail(request.getParameter("email"), "MonaWatch", "Dear "+request.getParameter("name")+",\nChúng tôi đã nhận được tin nhắn của bạn"
				+ "Chúng tôi rất xin lỗi về sự bất tiện này. Chúng tôi cảm ơn bạn và sẽ đưa ra giải pháp về vấn đề của bạn!"
				+ "\nBest guards");
		return "front-end/contact";
	}
	 
}

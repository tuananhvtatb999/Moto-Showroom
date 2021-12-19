package com.devpro.controller;

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

/**
 * 
 * @author admin
 *
 */
@Controller // -> tạo ra 1 bean tên webConf và được spring-container quản lí.
			// -> báo module web mapping request cho controller này.
public class IndexController extends BaseController{
	/**
	 * 
	 * @param model:    trung gian trao đổi thông tin giữa Controller và View(Jsp)
	 * @param request:  Chứa các thông tin Trình Duyệt truy vấn thông qua mẫu:
	 *                  ?abc=xyz
	 * @param response: Dữ liệu trả về Trình Duyệt.
	 * @return
	 * @throws Exception
	 */
	
	@Autowired
	ContactRepos contactRepos;
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("productsSale", productService.getListSale());
		return "front-end/trangchu";
	}
	@PostMapping(value = { "/" })
	public String subcribe(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		String email = request.getParameter("emailfield");
		Contact contact = new Contact();
		contact.setEmail(email);
		contact.setMessage("Tư vấn!");
		contact.setName("Một vị khách vô danh");
		contactRepos.save(contact);
		return "front-end/trangchu";
	}
	
	@RequestMapping(value = { "/gioithieu" }, method = RequestMethod.GET)
	public String gioithieu(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		return "front-end/gioithieu";
	}
	
	
	
	@RequestMapping(value = { "/blog" }, method = RequestMethod.GET)
	public String blog(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		return "front-end/blog";
	}
	
}

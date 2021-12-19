package com.devpro.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devpro.controller.BaseController;
import com.devpro.repositories.ContactRepos;

@Controller
public class AdminEmailController extends BaseController{
	
	@Autowired
	ContactRepos contactRepos;

	@RequestMapping(value = { "/admin/email" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("contacts", contactRepos.findAll());
		return "back-end/email";
	}
	
	@RequestMapping(value = { "/admin/email" }, method = RequestMethod.POST)
	public String indexz(@RequestParam Integer id,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		contactRepos.deleteById(id);
		return "redirect:/admin/email";
	}
}

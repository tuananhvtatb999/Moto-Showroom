package com.devpro.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.controller.BaseController;
import com.devpro.entities.Brand;
import com.devpro.entities.Product;
import com.devpro.repositories.BrandRepo;
import com.devpro.services.BrandService;

@Controller
public class AdminBrandController extends BaseController{
	
	@Autowired
	BrandRepo brandRepo;
	
	@Autowired
	BrandService brandService;
	
	@RequestMapping(value = { "/admin/brands" }, method = RequestMethod.GET)
	public String get(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("brands", brandService.getBrands());
		return "back-end/brand";
	}
	
	@RequestMapping(value = "/admin/brands", method = RequestMethod.POST)
	public String removeAd(@RequestParam("id") Integer id) {
	    Brand brand = brandRepo.getOne(id);
	    brand.setStatus(0);
	    brandRepo.save(brand);
	    return "redirect:/admin/brands";
	}
	
	@RequestMapping(value = { "/admin/add-brands" }, method = RequestMethod.GET)
	public String add(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("brand",new Brand());
		model.addAttribute("message", "");
		String messsage = request.getParameter("message");
		if(messsage != null && messsage.equalsIgnoreCase("success")) {
			model.addAttribute("message", "<div class=\"alert alert-success\">" + 
					"  <strong>Success!</strong> Thêm mới thành công." + 
					"</div>");
		}
		return "back-end/add-brand";
	}
	
	@RequestMapping(value = { "/admin/add-brands" }, method = RequestMethod.POST)
	public String addproduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
							  @ModelAttribute("brand") Brand brand)
			throws IOException {
		brand.setSeo("thuong-hieu-"+brand.getName());brand.setCreatedDate(LocalDate.now());
		brandRepo.save(brand);
		return "redirect:/admin/add-brands?message=success";
	}
}

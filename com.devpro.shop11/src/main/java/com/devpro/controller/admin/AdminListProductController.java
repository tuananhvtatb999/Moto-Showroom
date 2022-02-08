package com.devpro.controller.admin;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.controller.BaseController;
import com.devpro.entities.Product;
import com.devpro.model.AjaxResponse;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.ProductService;

@Controller
public class AdminListProductController extends BaseController{
	
	@Autowired
	private ProductRepo productRepo;
	
	@Autowired
	ProductService productService;
	
	// ADD Sản phẩm
	@RequestMapping(value = { "/admin/add-products" }, method = RequestMethod.GET)
	public String addProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("product") Product product)
			throws Exception {
		model.addAttribute("message", "");
		String messsage = request.getParameter("message");
		if(messsage != null && messsage.equalsIgnoreCase("success")) {
			model.addAttribute("message", "<div class=\"alert alert-success\">" + 
					"  <strong>Success!</strong> Thêm mới thành công." + 
					"</div>");
		}
		model.addAttribute("product", new Product());
		return "back-end/addproducts";
	}
	@RequestMapping(value = { "/admin/add-products" }, method = RequestMethod.POST)
	public String addproduct(@RequestParam("product_images") MultipartFile[] productImages,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
							  @ModelAttribute("product") Product product)
			throws IOException {
		productService.save(productImages, product);
		model.addAttribute("product", product);
		return "redirect:/admin/add-products?message=success";
	}
	
	
	
	//UPDATE Sản phẩm
	@RequestMapping(value = { "/admin/update-product/{id}" }, method = RequestMethod.GET)
	public String updateProduct(@PathVariable("id") Integer id,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		Product product = productRepo.getOne(id);
		if(product.getPriceSale() != null) {
			BigDecimal percent = product.getPrice().subtract(product.getPriceSale());
			BigDecimal percentFloat = (percent.divide(product.getPrice())).multiply(new BigDecimal(100));
			model.addAttribute("percentFloat", percentFloat);
		}
		model.addAttribute("product",product);
		return "back-end/update-product";
	}
	@RequestMapping(value = { "/admin/update-product" }, method = RequestMethod.POST)
	public String updateproduct(@RequestParam("product_images") MultipartFile[] productImages,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
							  @ModelAttribute("product") Product product)
			throws IOException {
		
		productService.save(productImages, product);
		return "redirect:/admin/list-products?message=success";
	}
	
	// Hiển thị danh sách sản phẩm
	@GetMapping("/admin/list-products")
	public String listProduct(final HttpServletRequest request, final HttpServletResponse respone , final ModelMap model) {
		HttpSession httpSession = request.getSession();
		List<Product> products = new ArrayList<>();
		if (httpSession.getAttribute("products") != null) {
			products = (List<Product>) httpSession.getAttribute("products");
		}
		else {
			products = productRepo.findAll();
		}
		model.addAttribute("products", products);
		String search = request.getParameter("search");
		if(search != null) {
			products.removeIf(product -> !product.getTitle().toLowerCase().contains(search.toLowerCase()));
			model.addAttribute("products", products);
		}
		model.addAttribute("message", "");
		String messsage = request.getParameter("message");
		if(messsage != null && messsage.equalsIgnoreCase("success")) {
			model.addAttribute("message", "<div class=\"alert alert-success\">" + 
					"  <strong>Success!</strong> Sửa thành công." + 
					"</div>");
		}
		httpSession.removeAttribute("products");
		return "back-end/list-products";
	}
	
	@RequestMapping(value = { "/delete-product" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> deleteProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody Integer id) {
		Product product = productRepo.getOne(id);
		product.setStatus(0);
		productRepo.save(product);
		return ResponseEntity.ok(new AjaxResponse(200,"Xoá thành công!"));
	}
	
}

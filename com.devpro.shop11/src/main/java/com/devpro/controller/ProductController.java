package com.devpro.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devpro.entities.Product;
import com.devpro.model.ProductSearch;
import com.devpro.services.ProductService;

@Controller
public class ProductController extends BaseController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = { "/donghonam" }, method = RequestMethod.GET)
	public String dongh(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		// Lấy sản phẩm theo trang
		ProductSearch productSearch = new ProductSearch();
		
		Integer currentPage = 1;
		
		String strCurrentPage = request.getParameter("page");
		if(strCurrentPage != null) currentPage = Integer.parseInt(strCurrentPage);
		
		productSearch.setCurrentPage(currentPage);
		List<Product> products = productService.search(productSearch);
		model.addAttribute("products", products);
		
		HttpSession session = request.getSession();
		session.setAttribute("currentPage", currentPage);
		return "front-end/donghonam";
	}
	

	@GetMapping("/donghonam/{id}")
	public String donghoCate(@PathVariable Integer id, final ModelMap model) {
		model.addAttribute("products", productService.searchByIdBrand(id));
		return "front-end/donghonam";
	}

	@RequestMapping(value = { "/product-detail/{seo}" }, method = RequestMethod.GET)
	public String productdetail(@PathVariable("seo") String seo,final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		
		ProductSearch productSearch = new ProductSearch();
		productSearch.setSeoProduct(seo);
		List<Product> products = productService.search(productSearch);
		model.addAttribute("products", products);
		
		return "front-end/product-detail";
	}
	
	@GetMapping("/donghonam/sort_asc")
	public String productsort(final ModelMap model) {
		List<Product> products = productService.productsSortAsc();
		model.addAttribute("products", products);
		return"redirect:/donghonam";
	}
	
	@RequestMapping(value = { "/brand/{seo}" }, method = RequestMethod.GET)
	public String getFromCategoryId(@PathVariable("seo") String seo,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		ProductSearch productSearch = new ProductSearch();
		productSearch.setSeoCategoty(seo);
		List<Product> products = productService.search(productSearch);
		model.addAttribute("products", products);
		
		HttpSession session = request.getSession();
		session.setAttribute("currentSeo", seo);
		return "front-end/donghonam";
	}
	
	@PostMapping(value = {"/donghonam"})
	public String search(final HttpServletRequest request, final ModelMap model, @RequestParam("search-product") String name) {
		ProductSearch productSearch = new ProductSearch();
		productSearch.setName(name);
		List<Product> products = productService.search(productSearch);
		if(products.size() == 0) {
			model.addAttribute("message", "Không có sản phẩm phù hợp");
		}else {
			model.addAttribute("products", products);
		}
		
		return "front-end/donghonam";
	}
}

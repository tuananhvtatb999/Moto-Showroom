package com.devpro.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.entities.Blog;
import com.devpro.entities.Brand;
import com.devpro.entities.Category;
import com.devpro.entities.Product;
import com.devpro.entities.SaleOrder;
import com.devpro.repositories.BlogRepo;
import com.devpro.repositories.BrandRepo;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;
import com.devpro.services.BlogService;
import com.devpro.services.BrandService;
import com.devpro.services.ProductService;

@Controller
public abstract class BaseController {
	
	@Autowired
	CategoryRepo categoryrepo;
	@Autowired
	ProductRepo productRepo;
	@Autowired
	BrandRepo brandRepo;
	@Autowired
	BlogRepo blogRepo;
	@Autowired
	SaleOrderRepo saleOderRepo;
	@Autowired
	ProductService productService;
	@Autowired
	BrandService brandService;
	
	@Autowired
	protected
	BlogService blogService;
	
	@ModelAttribute("orders")
	public List<SaleOrder> getOrders(){
		return saleOderRepo.findAll();
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return categoryrepo.findAll();
	}
	
	@ModelAttribute("products")
	public List<Product> getProduct(){
		return productRepo.findAllByStatus(1);
	}
	
	@ModelAttribute("brands")
	public List<Brand> getBrand(){
		return brandService.getBrands();
	}
	
	@ModelAttribute("pagesss")
	public Integer getAmountPages(final ModelMap model){
		List<Product> list = productRepo.findAll();
		Integer pagess = list.size()/12;
		if(list.size()% 2 != 0) {
			pagess+=1;
		}
		return pagess;
	}
	
	@ModelAttribute("blogs")
	public List<Blog> getBlog(){
		return blogRepo.findAll();
	}
	
}

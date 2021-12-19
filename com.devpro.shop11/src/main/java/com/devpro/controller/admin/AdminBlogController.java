package com.devpro.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.controller.BaseController;
import com.devpro.entities.Blog;
import com.devpro.entities.Product;
import com.devpro.model.AjaxResponse;
import com.devpro.repositories.BlogRepo;

@Controller
public class AdminBlogController extends BaseController{
	
	@Autowired
	BlogRepo blogRepo;

	// ADD blogs
	@RequestMapping(value = { "/admin/add-blogs" }, method = RequestMethod.GET)
	public String get(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		
		model.addAttribute("message", "");
		String messsage = request.getParameter("message");
		if(messsage != null && messsage.equalsIgnoreCase("success")) {
			model.addAttribute("message", "<div class=\"alert alert-success\">" + 
					"  <strong>Success!</strong> Thêm mới thành công." + 
					"</div>");
		}
		model.addAttribute("blog", new Blog());
		
		return "back-end/blog";
	}
	
	@RequestMapping(value = { "/admin/add-blogs" }, method = RequestMethod.POST)
	public String addBlog(@RequestParam("blog_image") MultipartFile blogImage,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
							  @ModelAttribute("blog") Blog blog)
			throws IOException {
		blogService.save(blogImage, blog);
		model.addAttribute("blog", blog);
		return "redirect:/admin/add-blogs?message=success";
	}

	@GetMapping(value = "/admin/update-blog/{id}")
	public String updateBlog(@PathVariable Integer id, final ModelMap model){

		return "back-end/blog";
	}
	
	// hiển thị danh sách
	@GetMapping("/admin/list-blogs")
	public String listProduct(final HttpServletRequest request, final HttpServletResponse respone , final ModelMap model) {
		model.addAttribute("message", "");
		String messsage = request.getParameter("message");
		if(messsage != null && messsage.equalsIgnoreCase("success")) {
			model.addAttribute("message", "<div class=\"alert alert-success\">" + 
					"  <strong>Success!</strong> Sửa thành công." + 
					"</div>");
		}
		return "back-end/list-blogs";
	}
	
	//xóa blog
	@RequestMapping(value = { "/delete-blog" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> deleteProduct(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody Integer id) {
		Blog blog = blogRepo.getOne(id);
		blog.setStatus(0);
		blogRepo.save(blog);
		return ResponseEntity.ok(new AjaxResponse(200,"Xoá thành công!"));
	}
}

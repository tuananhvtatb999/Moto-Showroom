package com.devpro.controller;

import com.devpro.entities.Blog;
import com.devpro.repositories.BlogRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blogs")
public class BlogController extends BaseController{

    @Autowired
    private BlogRepo blogRepo;

    @GetMapping("/detail/{id}")
    public String index(final ModelMap model, @PathVariable Integer id){
        Blog blog = blogRepo.getOne(id);
        model.addAttribute("blog",blog);
        return "front-end/detail-blog";
    }
}

package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.entities.Blog;

public interface BlogRepo extends JpaRepository<Blog, Integer>{

}

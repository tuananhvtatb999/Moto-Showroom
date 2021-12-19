package com.devpro.services;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.entities.Blog;
import com.devpro.repositories.BlogRepo;

@Service
@Transactional
public class BlogService {
	
	@PersistenceContext
	protected EntityManager entityManager;
	@Autowired
	private BlogRepo blogRepo;

	private static final String ROOT_PATH = "D:\\Template\\Java_Web_DevPro\\com.devpro.shop11\\upload\\";
	
	@SuppressWarnings("unused")
	private boolean isEmptyUploadFile(MultipartFile image) {
		if (image == null) return true;
		return false;
	}

	public void save(MultipartFile blogImage, Blog blog) throws IllegalStateException, IOException {

		if (blog.getId() != null) { // chỉnh sửa
			// lấy dữ liệu cũ của sản phẩm
			Blog blogInDB = blogRepo.findById(blog.getId()).get();

			blog.setCreatedDate(LocalDate.now());
			blog.setUpdatedDate(LocalDate.now());
			if (!isEmptyUploadFile(blogImage)) { // nếu admin sửa ảnh sản phẩm
				// xoá ảnh trên database
				blog.setImage(blogImage.getOriginalFilename());

			} else { // ảnh phải giữ nguyên
				blog.setImage(blogInDB.getImage());
			}

		} else {
			blog.setCreatedDate(LocalDate.now());
		}

		if (!isEmptyUploadFile(blogImage)) { // có upload ảnh lên.
				// lưu vật lí
				blogImage.transferTo(new File(
						ROOT_PATH + blogImage.getOriginalFilename()));
				blog.setImage(blogImage.getOriginalFilename());
		}
		// Sản phẩm có giá sale
		blogRepo.save(blog);
	}

}

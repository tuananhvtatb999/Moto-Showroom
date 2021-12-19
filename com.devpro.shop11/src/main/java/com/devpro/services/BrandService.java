package com.devpro.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devpro.entities.Brand;
import com.devpro.entities.Product;
import com.devpro.repositories.BrandRepo;

@Service
public class BrandService {
	
	@PersistenceContext
	protected EntityManager entityManager;
	
	@Autowired
	BrandRepo brandRepo;
	
	@SuppressWarnings("unchecked")
	public List<Brand> getBrands(){
		String sql = "select * from tbl_brand where status = 1";
		Query query = entityManager.createNativeQuery(sql, Brand.class);
		return query.getResultList();
	}
}

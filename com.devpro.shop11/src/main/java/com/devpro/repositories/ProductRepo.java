package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devpro.entities.Product;

import java.util.List;

@Repository
public interface ProductRepo extends JpaRepository<Product, Integer>{

    @Query(value = "select * from tbl_products p where p.status = ?1", nativeQuery = true)
    List<Product> findAllByStatus(Integer status);
}

package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.Brand;

@Repository
public interface BrandRepo extends JpaRepository<Brand, Integer>{

}

package com.csmtech.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.csmtech.entity.ProductDetailes;

@Repository
public interface ProductRepo extends JpaRepository<ProductDetailes, Integer> {

}

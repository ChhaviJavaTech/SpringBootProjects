package com.csmtech.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.csmtech.entity.CustomerDetails;

@Repository
public interface CustomerRepo extends JpaRepository<CustomerDetails, String> {

}

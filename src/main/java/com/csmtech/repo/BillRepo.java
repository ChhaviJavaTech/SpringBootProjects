package com.csmtech.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.transaction.annotation.Transactional;

import com.csmtech.entity.BillDetails;

public interface BillRepo extends JpaRepository<BillDetails, Integer> {
	
	

}

package com.csmtech.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.csmtech.entity.CustomerDetails;
import com.csmtech.entity.ProductDetailes;
import com.csmtech.repo.CustomerRepo;
import com.csmtech.repo.ProductRepo;

@RestController
public class MyRestController {
	@Autowired
	private CustomerRepo crepo;
	
	@Autowired
	private ProductRepo prepo;
	
	
	
	@GetMapping("/getCustDetaile")
	public CustomerDetails getCustDetaileByMobNo(@RequestParam("mob") String mob) {
		 CustomerDetails cd = crepo.findById(mob).orElse(null) ;
		return cd;
	}
	
	@GetMapping("/getProduct")
	public ProductDetailes getProductById(@RequestParam("pId") String pid) {
		if(pid!=null && !pid.isBlank() && !pid.isEmpty()) {
			 ProductDetailes pd = prepo.findById(Integer.parseInt(pid)).orElse(null);
			return pd;
		}
		return null;
		
	}
	
	


}

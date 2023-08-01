package com.csmtech.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csmtech.entity.BillDetails;
import com.csmtech.entity.CustomerDetails;
import com.csmtech.entity.ProductDetailes;
import com.csmtech.repo.BillRepo;
import com.csmtech.repo.CustomerRepo;
import com.csmtech.repo.ProductRepo;

@Service
public class BillService {
	
	@Autowired
	private BillRepo brepo;
	
	@Autowired
	private CustomerRepo crepo;
	@Autowired
	private ProductRepo prepo;
	
	public void saveBill(String billNo,String pd,CustomerDetails cust) {
		
		
		BillDetails bill =new BillDetails();
		bill.setBillNo(billNo);
		bill.setPurchaseDate(new Date());
		String[] pds= pd.split("-");
		bill.setPrchaseQnty(Integer.parseInt(pds[1]));
		ProductDetailes prod= prepo.findById(Integer.parseInt(pds[0])).get() ;
		bill.setProduct(prod);
		prod.setQuantity(prod.getQuantity()-bill.getPrchaseQnty());
		
		CustomerDetails cust1 = crepo.findById(cust.getMobileNo()).orElse(cust);
		bill.setCustm(cust1);
		brepo.save(bill);
		prepo.save(prod);
		
		
		
	}

	
}

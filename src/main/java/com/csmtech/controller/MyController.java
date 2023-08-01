package com.csmtech.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csmtech.entity.BillDetails;
import com.csmtech.entity.CustomerDetails;
import com.csmtech.repo.BillDao;
import com.csmtech.repo.BillRepo;
import com.csmtech.repo.CustomerRepo;
import com.csmtech.service.BillService;

@Controller
public class MyController {
	@Autowired
	private BillDao brepo;
	
	@Autowired
	private BillService bserv;
	
	@GetMapping("/")
	public String getHomePage() {
		return "ShopApp";
	}
	
	@PostMapping("/save")
	public String saveDtl(@RequestParam("pids") List<String> pids,CustomerDetails cust,RedirectAttributes rdirect) {
		String msg="";
		String billno=brepo.generateBillNumber();
		try {
		for(String pid:pids) {
			System.out.println(pid);
		bserv.saveBill(billno, pid, cust);
		}
		msg="saved succes fully";
		}catch(Exception e) {
			msg=e.getLocalizedMessage();
			e.printStackTrace();
		}
		System.out.println(pids);
//		System.out.println(qtys);
		System.out.println(cust);
		rdirect.addFlashAttribute("msg",msg);
		rdirect.addFlashAttribute("bno",billno);
		return "redirect:/";
	}
	
	
	
	
	
	
}

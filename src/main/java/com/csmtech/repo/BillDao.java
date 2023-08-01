package com.csmtech.repo;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class BillDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public String generateBillNumber(){
		String outputParameterValue = (String)em.createStoredProcedureQuery("GenerateBillNumber").registerStoredProcedureParameter(1, String.class, ParameterMode.OUT).getOutputParameterValue(1);
			return outputParameterValue;
	}

}

package com.csmtech.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "t_customer_details")
public class CustomerDetails implements Serializable {

	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "mobile_no",length = 12)
	private String mobileNo;
	
	@Column(name = "customer_name",length = 45)
	private String customerName;
	
	@Column(length = 200)
	private String address;
	
	
}

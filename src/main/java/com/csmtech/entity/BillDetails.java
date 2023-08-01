package com.csmtech.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "t_bill_details")
public class BillDetails implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sl_no")
	private Integer slNo;
	
	@Column(name = "bill_no",length = 12)
	private String billNo;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private ProductDetailes product;
	
	@Column(name = "purchase_qnty")
	private Integer prchaseQnty;
	
	@ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name="mobile_no")
	private CustomerDetails custm;
	
	@Column(name = "purchase_date")
	private Date purchaseDate;
	

}

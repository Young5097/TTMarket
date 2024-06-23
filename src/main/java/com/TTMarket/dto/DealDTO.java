package com.TTMarket.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("DealDTO")
public class DealDTO {
	private int deal_num;
	private int product_num;
	private String seller_nick;
	private String buyer_nick;
	private String select_buyer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date requestDealDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date completeDealDate;
	private boolean seller_check;
	private boolean buyer_check;
	private boolean IsCheckedDeal;
	
	private String pName;
	
	public DealDTO() {}

	public DealDTO(int deal_num, int product_num, String seller_nick, String buyer_nick, boolean isCheckedDeal,
			Date requestDealDate, boolean seller_check, boolean buyer_check, String select_buyer,
			String pName) {
		this.deal_num = deal_num;
		this.product_num = product_num;
		this.seller_nick = seller_nick;
		this.buyer_nick = buyer_nick;
		this.IsCheckedDeal = isCheckedDeal;
		this.requestDealDate = requestDealDate;
		this.seller_check = seller_check;
		this.buyer_check = buyer_check;
		this.select_buyer = select_buyer;
		this.pName = pName;
	}

	public int getDeal_num() {
		return deal_num;
	}

	public void setDeal_num(int deal_num) {
		this.deal_num = deal_num;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getSeller_nick() {
		return seller_nick;
	}

	public void setSeller_nick(String seller_nick) {
		this.seller_nick = seller_nick;
	}

	public String getBuyer_nick() {
		return buyer_nick;
	}

	public void setBuyer_nick(String buyer_nick) {
		this.buyer_nick = buyer_nick;
	}

	public boolean isIsCheckedDeal() {
		return IsCheckedDeal;
	}

	public void setIsCheckedDeal(boolean isCheckedDeal) {
		IsCheckedDeal = isCheckedDeal;
	}
	
	public Date getRequestDealDate() {
		return requestDealDate;
	}

	public void setRequestDealDate(Date requestDealDate) {
		this.requestDealDate = requestDealDate;
	}
	
	public boolean isSeller_check() {
		return seller_check;
	}

	public void setSeller_check(boolean seller_check) {
		this.seller_check = seller_check;
	}

	public boolean isBuyer_check() {
		return buyer_check;
	}

	public void setBuyer_check(boolean buyer_check) {
		this.buyer_check = buyer_check;
	}
	
	public String getSelect_buyer() {
		return select_buyer;
	}

	public void setSelect_buyer(String select_buyer) {
		this.select_buyer = select_buyer;
	}
	
	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	@Override
	public String toString() {
		return "DealDTO [deal_num=" + deal_num + ", product_num=" + product_num + ", seller_nick=" + seller_nick
				+ ", buyer_nick=" + buyer_nick + ", select_buyer=" + select_buyer + ", requestDealDate="
				+ requestDealDate + ", seller_check=" + seller_check
				+ ", buyer_check=" + buyer_check + ", IsCheckedDeal=" + IsCheckedDeal + ", pName=" + pName + "]";
	}

	
}

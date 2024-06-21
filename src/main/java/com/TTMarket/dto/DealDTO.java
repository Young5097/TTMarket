package com.TTMarket.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("DealDTO")
public class DealDTO {
	private int deal_num;
	private int product_num;
	private String seller_nick;
	private String buyer_nick;
	private boolean IsCheckedDeal;
	private Date requestDealDate;
	private Date completeDealDate;
	private boolean seller_check;
	private boolean buyer_check;
	
	public DealDTO() {}

	public DealDTO(int deal_num, int product_num, String seller_nick, String buyer_nick, boolean isCheckedDeal,
			Date requestDealDate, Date completeDealDate, boolean seller_check, boolean buyer_check) {
		this.deal_num = deal_num;
		this.product_num = product_num;
		this.seller_nick = seller_nick;
		this.buyer_nick = buyer_nick;
		this.IsCheckedDeal = isCheckedDeal;
		this.requestDealDate = requestDealDate;
		this.completeDealDate = completeDealDate;
		this.seller_check = seller_check;
		this.buyer_check = buyer_check;
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

	public Date getCompleteDealDate() {
		return completeDealDate;
	}

	public void setCompleteDealDate(Date completeDealDate) {
		this.completeDealDate = completeDealDate;
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

	@Override
	public String toString() {
		return "DealDTO [deal_num=" + deal_num + ", product_num=" + product_num + ", seller_nick=" + seller_nick
				+ ", buyer_nick=" + buyer_nick + ", IsCheckedDeal=" + IsCheckedDeal + ", requestDealDate="
				+ requestDealDate + ", completeDealDate=" + completeDealDate + "]";
	}
}

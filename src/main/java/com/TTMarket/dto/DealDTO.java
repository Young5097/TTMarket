package com.TTMarket.dto;

import org.apache.ibatis.type.Alias;

@Alias("DealDTO")
public class DealDTO {
	private int deal_num;
	private int product_num;
	private String seller_nick;
	private String buyer_nick;
	private boolean IsCheckedDeal;
	
	public DealDTO() {}

	public DealDTO(int deal_num, int product_num, String seller_nick, String buyer_nick, boolean isCheckedDeal) {
		super();
		this.deal_num = deal_num;
		this.product_num = product_num;
		this.seller_nick = seller_nick;
		this.buyer_nick = buyer_nick;
		IsCheckedDeal = isCheckedDeal;
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

	@Override
	public String toString() {
		return "DealDTO [deal_num=" + deal_num + ", product_num=" + product_num + ", seller_nick=" + seller_nick
				+ ", buyer_nick=" + buyer_nick + ", IsCheckedDeal=" + IsCheckedDeal + "]";
	}
}

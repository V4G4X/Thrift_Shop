package com.Thrift_Shop;

public class Query_ViewCart {
	String title[];
	float price[];
	int quantity[];
	float partial_amount[];
	int n;
	int i;
	Query_ViewCart(int n)
	{
		this.n=n;
		title = new String[n];
		price = new float[n];
		quantity =new int [n];
		partial_amount = new float[n];
		i=0;
				
	}
	public void appendRow(String title, float price,int quantity,float partial_amount) {
		this.title[i] = new String(title);
		this.price[i] = price;
		this.quantity[i] = quantity;
		this.partial_amount[i]=partial_amount;
		i++;

	}
	public int getN() {
		return n;
	}
	public String getTitle(int i1) {
		return title[i1];
	}
	public float getPrice(int i1) {
		return price[i1];
	}
	public int getQuantity(int i1) {
		return quantity[i1];
	}
	public float getPartial_amount(int i1)
	{
		return partial_amount[i1];
	}
	

}

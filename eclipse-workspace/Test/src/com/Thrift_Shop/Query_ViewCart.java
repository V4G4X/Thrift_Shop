package com.Thrift_Shop;

public class Query_ViewCart {
	String title[];
	float price[];
	int i_id[];
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
		i_id = new int[n];
		i=0;
				
	}
	public void appendRow(String title, float price,int quantity,float partial_amount,int i_id) {
		this.title[i] = new String(title);
		this.price[i] = price;
		this.quantity[i] = quantity;
		this.partial_amount[i]=partial_amount;
		this.i_id[i] = i_id;
		i++;

	}
	public int getN() {
		return n;
	}
	public String getTitle(int i1) {
		return title[i1];
	}
	public int getiid(int i1) {
		return i_id[i1];
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

package com.Thrift_Shop;

import java.sql.Timestamp;

public class Query_Item {
	private int i_id[];
	private String title[];
	private float partial_amount[];
	private int qty[];
	private Timestamp time[];
	private int u_id[];
	int n;
	int i;
	Query_Item(int n)
	{
		this.n = n;
		i_id=new int[n];
		title = new String[n];
		qty =new int [n];
		partial_amount = new float[n];
		time=new Timestamp[n];
		u_id=new int [n];
		i=0;
	}
	public void appendRow(int i_id,String title,float partial_amount,int qty,Timestamp time,int u_id) {
		this.title[i] = new String(title);
		this.qty[i] = qty;
		this.partial_amount[i]=partial_amount;
		this.i_id[i] = i_id;
		this.time[i]=time;
		this.u_id[i]=u_id;
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

	public int getQty(int i1) {
		return qty[i1];
	}
	public float getPartial_amount(int i1)
	{
		return partial_amount[i1];
	}
	
	public int getuid(int i1) {
		return u_id[i1];
	}
	
	public Timestamp getTime(int i1)
	{
		return time[i1];
	}
	

	
	
	
}

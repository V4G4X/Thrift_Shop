package com.Thrift_Shop;

import java.sql.Timestamp;

public class Query_OrderDetails {

	private int n;
	private int i;
	private int o_id[];
	private Timestamp time[];
	private Query_Item itemList[];
	
	Query_OrderDetails(int n)
	{
		this.n = n;
		i = 0;
		o_id = new int[n];
		time = new Timestamp[n];
		itemList = new Query_Item[n];
	}
	
	public void appendRow(int o_id, Timestamp time,Query_Item q) {
		this.o_id[i] = o_id;
		this.itemList[i] = q;
		this.time[i] = time;
		i++;
	}
	public int getN() {
		return n;
	}
	public int getOid(int i1) {
		return o_id[i1];
	}
	public Timestamp gettime(int i1) {
		return time[i];
	}
	/*public float getItems(int i1) {
		return itemList[i1];
	}
	public int getQuantity(int i1) {
		return quantity[i1];
	}
	public float getPartial_amount(int i1)
	{
		return partial_amount[i1];
	}*/

	
	
	
}

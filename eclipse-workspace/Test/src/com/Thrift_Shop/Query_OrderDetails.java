package com.Thrift_Shop;

import java.sql.Timestamp;

public class Query_OrderDetails {

	private int n;
	private int i;
	private int o_id[];
	private Timestamp time[];
	private Query_Item itemList[];
	private float total[];
	private int item_count[];
	
	Query_OrderDetails(int n)
	{
		this.n = n;
		i = 0;
		o_id = new int[n];
		time = new Timestamp[n];
		total=new float[n];
		itemList = new Query_Item[n];
		item_count=new int[n];
	}
	
	public void appendRow(int o_id, Timestamp time,Query_Item q,float total,int item_count) {
		this.o_id[i] = o_id;
		this.itemList[i] = q;
		this.time[i] = time;
		this.total[i]=total;
		this.item_count[i]=item_count;
		i++;
	}
	public int getN() {
		return n;
	}
	public int getOid(int i1) {
		return o_id[i1];
	}
	public Timestamp gettime(int i1) {
		return time[i1];
	}
	public Query_Item getItems(int i1) {
		return itemList[i1];
	}
	public float getTotal(int i1)
	{
		return total[i1];
	}
	public int getItem_count(int i1) {
		return item_count[i1];
	}
	/*public int getQuantity(int i1) {
		return quantity[i1];
	}
	public float getPartial_amount(int i1)
	{
		return partial_amount[i1];
	}*/

	
	
	
}

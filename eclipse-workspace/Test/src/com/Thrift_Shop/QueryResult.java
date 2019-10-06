package com.Thrift_Shop;

public class QueryResult {
	private int n;
	private int i;
	private String title[];
	private String author[];
	private String desc[];
	private int cond[];
	private float price[];
	private int i_id[];
	

	public QueryResult() {
	}

	QueryResult(int n) {
		this.n = n;
		title = new String[n];
		author = new String[n];
		desc = new String[n];
		i_id = new int[n];
		cond = new int[n];
		price = new float[n];
	}

	public void appendRow(int i_id, String title, String author,String desc, int cond, float price) {
		this.title[i] = new String(title);
		this.author[i] = new String(author);
		this.desc[i] = new String(desc);
		this.i_id[i] = i_id;
		this.price[i] = price;
		this.cond[i++] = cond;
	}

	public int getN() {
		return n;
	}

	public String getTitle(int i) {
		return title[i];
	}

	public String getAuthor(int i) {
		return author[i];
	}
	
	public String getDescription(int i) {
		return desc[i];
	}

	public int getI_id(int i) {
		return i_id[i];
	}

	public int getI() {
		return i;
	}

	public String[] getTitle() {
		return title;
	}

	public String[] getAuthor() {
		return author;
	}

	public String[] getDescription() {
		return desc;
	}
	
	public int[] getI_id() {
		return i_id;
	}

	public float[] getPrice() {
		return price;
	}

	public float getPrice(int i) {
		return price[i];
	}
	
	public int[] getCondition() {
		return cond;
	}
	
	public float getCondition(int i) {
		return cond[i];
	}


}

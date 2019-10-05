package com.Thrift_Shop;

public class QueryResult {
	private int n;
	private int i;
	private String title[];
	private String author[];
	private int i_id[];
	private float price[];

	public QueryResult() {
	}

	QueryResult(int n) {
		this.n = n;
		title = new String[n];
		author = new String[n];
		i_id = new int[n];
		price = new float[n];
	}

	public void appendRow(int i_id, String title, String author,  float price) {
		this.title[i] = new String(title);
		this.author[i] = new String(author);
		this.i_id[i] = i_id;
		this.price[i++] = price;
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

	public int[] getI_id() {
		return i_id;
	}

	public float[] getPrice() {
		return price;
	}

	public float getPrice(int i) {
		return price[i];
	}

}

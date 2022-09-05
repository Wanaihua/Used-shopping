package com.gx.domain;

public class Goods {
	private int useid;
	public int getUseid() {
		return useid;
	}
	public void setUseid(int useid) {
		this.useid = useid;
	}
	public static final int PAGE_SIZE = 7;
	public static int getPageSize() {
		return PAGE_SIZE;
	}
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNname() {
		return nname;
	}
	public void setNname(String nname) {
		this.nname = nname;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	private String nname;
	private double price;
	private String classify;
	private String ddescribe;
	public String getDdescribe() {
		return ddescribe;
	}
	public void setDdescribe(String ddescribe) {
		this.ddescribe = ddescribe;
	}
}

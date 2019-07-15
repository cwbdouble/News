package com.mxl.models;
/**
 * 类别
 * @author administrator
 *
 */
public class Category {
    private int id;//自动编号
    private String name;//类别名称
    private int topId;//上级类别编号
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTopId() {
		return topId;
	}
	public void setTopId(int topId) {
		this.topId = topId;
	}
}

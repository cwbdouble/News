package com.mxl.models;
import java.util.Date;
/**
 * 新闻发布类
 * @author administrator
 *
 */
public class News {
	private int id;//编号
	private String title;//标题
	private String content;//内容
	private Date createTime;//发布时间
	private Category category;//新闻类型
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
}

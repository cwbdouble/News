package com.mxl.models;
import java.util.Date;

/**
 * 信息公告、焦点导读类
 * @author administrator
 *
 */
public class AFNews {
	 private int id;//编号
	 private String title;//标题
	 private String content;//内容
	 private Date createTime;//发布时间
	 private int sign;//标识是公告还是焦点导读
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setSign(int sign) {
		this.sign = sign;
	}
	public int getSign() {
		return sign;
	}
	

}

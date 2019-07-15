package com.mxl.actions;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.mxl.dao.AFDao;
import com.mxl.models.AFNews;
import com.opensymphony.xwork2.ActionSupport;
public class AFAction extends ActionSupport {
	private AFNews affiche;
	private AFDao ad=new AFDao();
	private List<AFNews> affiches;//集合对象，存储所有公告信息
	private int sign;

	public List<AFNews> getAffiches() {
		return affiches;
	}
	public void setAffiches(List<AFNews> affiches) {
		this.affiches = affiches;
	}
	private String signStr="";//是否为编辑
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		affiches = ad.selectAllList(sign);
		System.out.println(affiches.size());
		request.getSession().setAttribute("sign", sign);//sign为1则是公告信息，2则是焦点导读
		return "main";
	}
	//查看详细信息
	public String getAfficheById(){
		affiche = ad.selectAf(affiche.getId());//根据编号获取具体的公告信息
		if (!signStr.equals("")&&signStr!=null) {//表示为编辑
			return "update";	
		}
		else {
			return "details";
		}
	}
	//打开发布公告界面
	public String inputAffiche(){
		return "addInput";
	}
	//发布公告
	public String addAffiche(){
		affiche.setCreateTime(new Date());//将发布日期赋值为当前日期
		ad.insertAffiche(affiche);//执行插入操作
		return SUCCESS;
	}
	//更新公告
	public String updateAffiche(){
		affiche.setCreateTime(new Date());
		ad.updateAffiche(affiche);//更新操作
		return SUCCESS;
	}
	//删除公告
	public String delAffiche(){
		ad.deleteAffiche(affiche.getId());//删除操作
		return SUCCESS;
	}
	public AFNews getAffiche() {
		return affiche;
	}
	public void setAffiche(AFNews affiche) {
		this.affiche = affiche;
	}
	
	
	public void setSignStr(String signStr) {
		this.signStr = signStr;
	}
	public String getSignStr() {
		return signStr;
	}
	public void setSign(int sign) {
		this.sign = sign;
	}
	public int getSign() {
		return sign;
	}
	
	

}

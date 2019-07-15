package com.mxl.actions;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.mxl.dao.CategoryDao;
import com.mxl.models.Category;
import com.opensymphony.xwork2.ActionSupport;

public class CategoryAction extends ActionSupport {
	private Category category;//实例化category
	private CategoryDao cd = new CategoryDao();//实例化CategoryDao类

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Category> cList = cd.selectListByTopId(category.getTopId());//根据一级类别查询二级列别
		request.setAttribute("clist", cList);
		return "clist";
	}
	//打开添加类别界面
	public String inputCategory(){
		return "addInput";
	}
	//添加类别
	public String addCategory(){
		cd.insertCategory(category);
		return SUCCESS;
	}
	//打开更新类别界面
	public String updateInput(){
		category = cd.selectCategory(category.getId());
		return "updateInput";
	}
	//更新类别
	public String updateCategory(){
		cd.updateCategory(category);
		return SUCCESS;
	}
	public String delCategory() {
		cd.deleteCategory(category.getId());
		return SUCCESS;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}

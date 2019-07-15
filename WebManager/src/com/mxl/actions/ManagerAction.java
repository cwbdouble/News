package com.mxl.actions;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.mxl.dao.ManagerDao;
import com.mxl.models.Manager;
import com.opensymphony.xwork2.ActionSupport;

public class ManagerAction extends ActionSupport {
	private Manager manager;
	private ManagerDao md = new ManagerDao();
	private String signStr="";
	private List<Manager> managers;

	@Override
	public String execute() throws Exception {
		managers = md.selectAllList();//管理员队列
		return "userList";
	}
	//登录处理
	public String login(){
		manager = md.getLogin(manager.getAccount(), manager.getPassword());//获取登录用户
		if (manager==null) {
			return INPUT;
		}else {
			md.addManagerNumber(manager.getId());//登录次数+1
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().setAttribute("login", manager);//将登录用户存储至Session中	
			return "main";
		}
	}

	//更新密码
	public String updateLogin(){
		HttpServletRequest request = ServletActionContext.getRequest();
		md.updateManager(manager);
		if (signStr.equals("")||signStr==null) {
			((Manager)request.getSession().getAttribute("login")).setPassword(manager.getPassword());//更改密码为更新后的密码
		}
		else {
			((Manager)request.getSession().getAttribute("login")).setAccount(manager.getAccount());
			((Manager)request.getSession().getAttribute("login")).setName(manager.getName());
		}
		return "showLogin";
	}
	//打开用户录入界面
	public String inputManager(){
		return "addInput";
	}
	//添加用户
	public String addManager(){
		md.insertManager(manager);
		return SUCCESS;
	}
	//获取用户信息
	public String getManagerById(){
		manager=md.getManager(manager.getId());
		return "updateInput";
	}
	//更新用户信息
	public String updateManager(){
		md.updateManager(manager);
		return SUCCESS;
	}
	//删除用户
	public String delManager(){
		md.deleteManager(manager.getId());//删除用户
		return SUCCESS;
	}
	//用户退出
	public String exit(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().removeAttribute("login");
		request.getSession().invalidate();
		return "login";
		
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public Manager getManager() {
		return manager;
	}
	public void setSignStr(String signStr) {
		this.signStr = signStr;
	}
	public String getSignStr() {
		return signStr;
	}
	public void setManagers(List<Manager> managers) {
		this.managers = managers;
	}
	public List<Manager> getManagers() {
		return managers;
	}
	
	

}

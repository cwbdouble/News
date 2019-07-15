package com.mxl.actions;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.mxl.dao.CategoryDao;
import com.mxl.dao.NewsDao;
import com.mxl.models.Category;
import com.mxl.models.News;
import com.opensymphony.xwork2.ActionSupport;
public class NewsAction extends ActionSupport {
	private News news;
	private String categoryName;//存储新闻类型名称 
	private NewsDao nd=new NewsDao();//实例化NewsDao类
	private CategoryDao cd = new CategoryDao();
	private List<News> newsList;//集合对象
	private String signStr="";//标识字符串
	private int topId;//一级类别
	private int cid;//类别编号
	private int pageNo = 1;//页码
	private int pageSize=10;//每页显示的条数
	private int pageCount;//总页数
	//根据一级类别查询新闻信息
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		pageCount = nd.getPageCount(topId,pageSize);
		if (pageNo<1) {
			pageNo=1;
		}else if(pageNo > pageCount){
			pageNo = pageCount;
		}
		newsList = nd.selectListByTopId(topId,pageNo,pageSize);//调用NewsDao中的方法，根据类型Id查找新闻	
		categoryName = cd.selectName(topId);
		request.getSession().setAttribute("topId", topId);//将一级类别存放到Session中
		request.getSession().setAttribute("topName", categoryName);//将一级类别名称放到Session中
		return "main";
		
	}
	//获取具体的新闻信息
	public String getNewsById(){
		news = nd.selectNews(news.getId());//根据编号获取新闻
		if (!signStr.equals("")&&signStr!=null) {
			HttpServletRequest request=ServletActionContext.getRequest();
			List<Category> cList = cd.selectListByTopId(topId);
			request.setAttribute("cList", cList);
			System.out.println(cList.size());
			return "update";
		}
		else {
			return "details";
		}
	}
	//更新新闻信息
	public String updateNews(){
		news.setCreateTime(new Date());//将日期更新为今天的日期
		news.setCategory(cd.selectCategory(cid));
		nd.updateNews(news);//更新新闻信息
		return SUCCESS;
	}
	//删除新闻信息
	public String delNews(){
		nd.deleteNews(news.getId());//执行删除操作
		return SUCCESS;
	}
	//打开添加页面
	public String addInputNews(){
		HttpServletRequest request=ServletActionContext.getRequest();
		List<Category> cList = cd.selectListByTopId(topId);//根据一级类别查找二级类别
		request.setAttribute("cList", cList);
		return "addInput";
	}
	//添加新闻
	public String addNews(){
		news.setCategory(cd.selectCategory(cid));
		news.setCreateTime(new Date());
		nd.insertNews(news);//执行添加操作
		return SUCCESS;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public List<News> getNewsList() {
		return newsList;
	}


	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSignStr() {
		return signStr;
	}
	public void setSignStr(String signStr) {
		this.signStr = signStr;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getTopId() {
		return topId;
	}
	public void setTopId(int topId) {
		this.topId = topId;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
}

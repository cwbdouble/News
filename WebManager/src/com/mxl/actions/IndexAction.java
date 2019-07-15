package com.mxl.actions;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.mxl.dao.AFDao;
import com.mxl.dao.CategoryDao;
import com.mxl.dao.NewsDao;
import com.mxl.models.AFNews;
import com.mxl.models.News;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport {
	private NewsDao nd=new NewsDao();
	private AFDao afd = new AFDao();
	private CategoryDao cd = new CategoryDao();
	private AFDao afDao=new AFDao();
	private List<News> news1;//存储时政要闻
	private List<News> news2;//存储经济动向
	private List<News> news3;//存储科学教育
	private List<News> news4;//存储法制教育
	private List<News> news5;//存储社会现象
	private List<News> news6;//存储娱乐天地
	private List<AFNews> news7;//存储公告信息
	private List<AFNews> news8;//存储焦点新闻
	private List<News> cnews;//存储不同类别下的新闻
	private int cid;//类别编号
	private int topId;//一级类别
	private News news;
	private AFNews af;
	private int pageNo=1;//页码
	private int pageSize=10;//每页显示的数量
	private int pageCount;//总页码
	private List<News> allnews;//存储不同类别下的全部新闻
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	@Override
	public String execute() throws Exception {
		news1 = nd.selectTopList(1);
		news2 = nd.selectTopList(2);
		news3 = nd.selectTopList(3);
		news4 = nd.selectTopList(4);
		news5 = nd.selectTopList(5);
		news6 = nd.selectTopList(6);
		news7 = afd.selectTopList(1);
		news8 = afd.selectTopList(2);
		return "index";
	}
	//根据类别查询新闻
	public String getNewsByCid(){
		HttpServletRequest request=ServletActionContext.getRequest();
		cnews = nd.selectNewsByCid(cid);
		String cname=cd.selectName(cid);//获取二级名称
		String topName=cd.selectName(topId);//获取一级类别名称
		request.getSession().setAttribute("cname", cname);
		request.getSession().setAttribute("topName", topName);
		request.getSession().setAttribute("topId", topId);
		request.getSession().setAttribute("cid", cid);
		return "index_newsList";
	}
	//获取特定的新闻
	public String getNewsById(){
		HttpServletRequest request = ServletActionContext.getRequest();
		news=nd.selectNews(news.getId());
		String topName=cd.selectName(topId);//获取一级类别名称
		String cname=news.getCategory().getName();//获取二级名称
		request.getSession().setAttribute("topName", topName);
		request.getSession().setAttribute("cname", cname);
		request.getSession().setAttribute("topId", topId);
		request.getSession().setAttribute("cid", news.getCategory().getId());
		return "index_news";
	}
	//获取具体的公告、焦点新闻
	public String getafNews(){
		HttpServletRequest request = ServletActionContext.getRequest();
		af = afDao.selectAf(af.getId());
		request.getSession().setAttribute("sign", af.getSign());//将sign值存入Session中
		return "index_af";
	}
	//查看更多新闻
	public String getNewsList(){
		HttpServletRequest request = ServletActionContext.getRequest();
		pageCount = nd.getPageCount(topId,pageSize);
		if (pageNo<1) {
			pageNo=1;
		}else if(pageNo > pageCount){
			pageNo = pageCount;
		}
		allnews = nd.selectListByTopId(topId,pageNo,pageSize);//调用NewsDao中的方法，根据类型Id查找新闻
		String topName=cd.selectName(topId);//获取一级类别名称
		request.getSession().setAttribute("topId", topId);
		request.getSession().setAttribute("topName", topName);
		return "more";
	}
	
	public List<News> getNews1() {
		return news1;
	}

	public void setNews1(List<News> news1) {
		this.news1 = news1;
	}

	public List<News> getNews2() {
		return news2;
	}

	public void setNews2(List<News> news2) {
		this.news2 = news2;
	}

	public List<News> getNews3() {
		return news3;
	}

	public void setNews3(List<News> news3) {
		this.news3 = news3;
	}

	public List<News> getNews4() {
		return news4;
	}

	public void setNews4(List<News> news4) {
		this.news4 = news4;
	}

	public List<News> getNews5() {
		return news5;
	}

	public void setNews5(List<News> news5) {
		this.news5 = news5;
	}

	public List<News> getNews6() {
		return news6;
	}

	public void setNews6(List<News> news6) {
		this.news6 = news6;
	}

	public void setNews8(List<AFNews> news8) {
		this.news8 = news8;
	}

	public List<AFNews> getNews8() {
		return news8;
	}

	public void setNews7(List<AFNews> news7) {
		this.news7 = news7;
	}

	public List<AFNews> getNews7() {
		return news7;
	}
	public void setCnews(List<News> cnews) {
		this.cnews = cnews;
	}
	public List<News> getCnews() {
		return cnews;
	}
	public void setTopId(int topId) {
		this.topId = topId;
	}
	public int getTopId() {
		return topId;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public News getNews() {
		return news;
	}
	public void setAf(AFNews af) {
		this.af = af;
	}
	public AFNews getAf() {
		return af;
	}
	public void setAllnews(List<News> allnews) {
		this.allnews = allnews;
	}
	public List<News> getAllnews() {
		return allnews;
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

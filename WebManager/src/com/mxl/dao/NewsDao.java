package com.mxl.dao;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.hql.internal.ast.HqlASTFactory;

import com.mxl.connect.HibernateSessionFactory;
import com.mxl.models.News;
public class NewsDao {
	//对新闻的插入操作
	 public void insertNews(News news) { 
	        Session session = null;
	        Transaction tx = null;
	        try {
	        	session = HibernateSessionFactory.getSession();
	            tx = session.beginTransaction();
	            session.save(news);
	            tx.commit();
	        } catch (Exception e) {
	            System.out.println("插入数据出错：" + e);
	        } finally {
	            HibernateSessionFactory.closeSession();
	        }
	    }
	 //删除新闻
    public void deleteNews(int id) {
        Session session = null;
        Transaction tx = null;
        try {
        	session = HibernateSessionFactory.getSession();
            tx = session.beginTransaction();
            News news = (News) session.load(News.class, id);
            session.delete(news);
            tx.commit();
        } catch (Exception e) {
            System.out.println("删除数据出错：" + e);
        } finally {
            HibernateSessionFactory.closeSession();
        }
    }
    //修改新闻
    public void updateNews(News news) {
        Session session = null;
        Transaction tx = null;
        try {
        	session = HibernateSessionFactory.getSession();
            tx = session.beginTransaction();
            News newNews = new News();
            newNews.setId(news.getId());
            newNews.setTitle(news.getTitle());
            newNews.setContent(news.getContent());
            newNews.setCreateTime(news.getCreateTime());
            newNews.setCategory(news.getCategory());
            session.update(newNews);//修改新闻信息
            tx.commit();
        } catch (Exception e) {
        	e.printStackTrace();
            System.out.println("修改数据出错：" + e);
        } finally {
            HibernateSessionFactory.closeSession();
        }
    }
  //对新闻的查询
    public List<News> selectListByTopId(int topId,int pageNo,int pageSize) {
        Session session = null;
        List<News> list = null;
        String hql = "from News  where category.topId=" + topId +" order by createTime desc";
        try {
        	session = HibernateSessionFactory.getSession(); 
            Query query = session.createQuery(hql);
            query.setFirstResult((pageNo-1)*pageSize);//设置从哪一行记录开始读取
            query.setMaxResults(pageSize);//设置读取多少行记录
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        HibernateSessionFactory.closeSession();
        return list;
    }
    //前台对各个类别的新闻进行查询
    public List<News> selectTopList(int topId){
    	Session session = null;
    	List<News> news = null;
    	String hql="from News where category.topId ="+topId+" order by createTime desc";
    	try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			query.setFirstResult(0);
			query.setMaxResults(4);
			news = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return news;
    }
    
    //获取总页数
    public int getPageCount(int topId,int pageSize){
    	Session session = null;
    	String hql="select count(id) from News where category.topId="+topId;
    	int count=0;//总记录数
    	int pageCount=0;//总页数
    	try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			long temp=(Long)query.uniqueResult();
			count = (int)temp;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		HibernateSessionFactory.closeSession();
		if (count % pageSize == 0) {
			pageCount = count / pageSize;
		}
		else {
			pageCount = count/pageSize+1;
		}
		return pageCount;
    }
  //以编号为条件查询数据
    public News selectNews(int id) { 
    	Session session = null;
        String hql = "from News where id=" + id;
        News news = null;
        try {
        	session = HibernateSessionFactory.getSession();
            Query query = session.createQuery(hql);
            news = (News) query.uniqueResult();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
       HibernateSessionFactory.closeSession();
       return news;
    }
    //根据类别查询新闻
    public List<News> selectNewsByCid(int cid){
    	Session session = null;
    	List<News> news = null;
    	String hql="from News where category.id ="+cid+" order by createTime desc";
    	try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			query.setFirstResult(0);
			query.setMaxResults(5);
			news = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return news;
    }
}

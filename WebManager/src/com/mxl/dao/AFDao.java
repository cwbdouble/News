package com.mxl.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.mxl.connect.HibernateSessionFactory;
import com.mxl.models.AFNews;



public class AFDao {
	//对公告、焦点的插入操作
	public void insertAffiche(AFNews af) { 
        Session session = null;
        Transaction tx = null;
        try {
        	session=HibernateSessionFactory.getSession();//获取Session
            tx = session.beginTransaction();//开启事务
            session.save(af);
            tx.commit();
        } catch (Exception e) {
            System.out.println("插入数据出错：" + e);
        } finally {
            HibernateSessionFactory.closeSession();//关闭Session
        }
    }
	//公告、焦点导读信息的删除
    public void deleteAffiche(int id) {
        Session session = null;
        Transaction tx=null;
        try {
        	session=HibernateSessionFactory.getSession();
            tx = session.beginTransaction();
            AFNews af = (AFNews) session.load(AFNews.class, id);
            session.delete(af);//删除数据
            tx.commit();
        } catch (Exception e) {
            System.out.println("删除数据出错：" + e);
        } finally {
        	HibernateSessionFactory.closeSession();//关闭Session
        }
    }
    //对公告、焦点导读信息的修改
    public void updateAffiche(AFNews af) {
        Session session = null;
        Transaction tx=null;
        try {
        	session=HibernateSessionFactory.getSession();
            tx = session.beginTransaction();
            AFNews newAf=new AFNews();
            newAf.setId(af.getId());
            newAf.setTitle(af.getTitle());
            newAf.setContent(af.getContent());
            newAf.setCreateTime(af.getCreateTime());
            newAf.setSign(af.getSign());
            session.update(newAf);//执行修改操作
            tx.commit();
        } catch (Exception e) {
            System.out.println("修改数据出错：" + e);
        } finally {
        	HibernateSessionFactory.closeSession();//关闭Session
        }
    }
    //查询全部信息
    public List<AFNews> selectAllList(int sign) {
        Session session = null;
        String hql = "from AFNews where sign="+sign+" order by createTime desc";
        System.out.println(hql);
        List<AFNews> list = null;
        try {
        	session=HibernateSessionFactory.getSession();//获取Session
            Query query = session.createQuery(hql);
            list = query.list();
        } catch (Exception e) {
        	e.printStackTrace();
            System.out.println(e.getMessage());
        }
        HibernateSessionFactory.closeSession();//关闭Session
        return list;
    }
    //查询前5条新闻
    public List<AFNews> selectTopList(int sign) {
        Session session = null;
        String hql = "from AFNews where sign="+sign+" order by createTime desc limit 5";
        System.out.println(hql);
        List<AFNews> list = null;
        try {
        	session=HibernateSessionFactory.getSession();//获取Session
            Query query = session.createQuery(hql);
            list = query.list();
        } catch (Exception e) {
        	e.printStackTrace();
            System.out.println(e.getMessage());
        }
        HibernateSessionFactory.closeSession();//关闭Session
        return list;
    }
    //查询特定的信息
    public AFNews selectAf(int id) { 
          Session session = null;
          String hql = "from AFNews where id=" + id;
          AFNews affiche=null;
          try {
        	  session=HibernateSessionFactory.getSession();
              Query query = session.createQuery(hql);
              affiche=(AFNews)query.uniqueResult();//获取一条数据
          } catch (Exception e) {
              System.out.println(e.getMessage());
          }
          HibernateSessionFactory.closeSession();//关闭Session
          return affiche;
    }

}

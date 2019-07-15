package com.mxl.dao;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.Query;

import com.mxl.connect.HibernateSessionFactory;
import com.mxl.models.Manager;

import java.util.List;
public class ManagerDao {
	//对管理员的插入操作
	public void insertManager(Manager manager) {
	       Session session = null;
	       Transaction tx = null;
	       try {
	    	   session = HibernateSessionFactory.getSession();
	           tx = session.beginTransaction();
	           session.save(manager);
	           tx.commit();
	       } catch (Exception e) {
	           System.out.println("插入数据出错：" + e);
	       } finally {
	           HibernateSessionFactory.closeSession();//关闭Session
	       }
	   }
   //修改管理员信息
   public void updateManager(Manager manager) {
       Session session = null;
       Transaction tx = null;
       try {
    	   session=HibernateSessionFactory.getSession();
           tx = session.beginTransaction();
           Manager newManager=new Manager();
           newManager.setAccount(manager.getAccount());
           newManager.setPassword(manager.getPassword());
           newManager.setName(manager.getName());
           newManager.setNumber(manager.getNumber());
           session.update(manager);//修改数据
           tx.commit();
       } catch (Exception e) {
           System.err.println("修改管理员出错："+e);
       } finally {
           HibernateSessionFactory.closeSession();
       }
   }
   //删除管理员
   public void deleteManager(int id) {
      Session session = null;
      Transaction tx= null;
        try {
        	session=HibernateSessionFactory.getSession();
            tx = session.beginTransaction();
            Manager manager=(Manager)session.load(Manager.class,id);
            session.delete(manager);
            tx.commit();
        } catch (Exception e) {
            System.out.println("删除数据出错：" + e);
        } finally {
        	HibernateSessionFactory.closeSession();
        }
  }
 //管理员账号为条件查询数据
   public Manager getLogin(String account,String password) { 
      Session session = null;
      String hql = "from Manager where account='" + account + "' and password='"+password+"'";
      Manager manager = null;
      try {
    	  session = HibernateSessionFactory.getSession();
          Query query = session.createQuery(hql);
          manager = (Manager) query.uniqueResult();//返回查询的唯一结果，无结果则返回null
      } catch (Exception e) {
          System.out.println(e.getMessage());
      }
      HibernateSessionFactory.closeSession();
      return manager;
  }
   //查询所有的管理员
  public List selectAllList() {
    Session session = null;
    String hql = "from Manager order by id desc";
    List list = null;
    try {
    	session = HibernateSessionFactory.getSession();
        Query query = session.createQuery(hql);
        list = query.list();
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    HibernateSessionFactory.closeSession();
    return list;
  }
  //根据编号获取用户信息
  public Manager getManager(int id){
	  Session session = null;
	  Manager manager=null;
	  try {
		session = HibernateSessionFactory.getSession();
		manager = (Manager)session.get(Manager.class, id);//获取用户信息
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	HibernateSessionFactory.closeSession();
	return manager;
  }
  //每登录一次，访问次数加1
  public void addManagerNumber(int id) {
	  Session session = null;
	  Transaction tx = null;
	  try {
		  session=HibernateSessionFactory.getSession();
		  tx = session.beginTransaction();
		  Manager login=(Manager)session.load(Manager.class, id);//获取当前登录的管理员信息
		  login.setNumber(login.getNumber()+1);//使访问次数加1
		  session.update(login);//修改数据
		  tx.commit();
     } catch (Exception e) {
         System.out.println("更新数据出错：" + e);
     } finally {
         HibernateSessionFactory.closeSession();
     }
  }



}

package com.mxl.dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.mxl.connect.HibernateSessionFactory;
import com.mxl.models.Category;
public class CategoryDao {
	// 对新闻详细类别的插入操作
	public void insertCategory(Category category) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.save(category);
			tx.commit();
		} catch (Exception e) {
			System.out.println("插入数据出错：" + e);
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	// 修改新闻详细类别
	public void updateCategory(Category category) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Category newCategory = new Category();
			newCategory.setId(category.getId());
			newCategory.setName(category.getName());
			newCategory.setTopId(category.getTopId());
			session.update(newCategory);
			tx.commit();
		} catch (Exception e) {
			System.out.println("修改数据出错：" + e);
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	// 删除新闻详细类别的名称
	public void deleteCategory(int id) {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Category category = (Category) session.load(Category.class, id);
			session.delete(category);
			tx.commit();
		} catch (Exception e) {
			System.out.println("删除数据出错：" + e);
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	//根据上级类别对新闻类别进行查询操作
	public List<Category> selectListByTopId(int topId) { 
        Session session = null;
        String hql = "from Category where topId=" + topId + " order by id desc";
        List<Category> list = null;
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
	//根据类型编号获取类型名称
	public String selectName(int id){
		Session session = null;
		String hql="select name from Category where id = "+id;
		String name = "";
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			name = (String)query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		HibernateSessionFactory.closeSession();
		return name;
	}
	//根据编号获取特定的类别信息
	public Category selectCategory(int id){
		Session session = null;
		Category category = null;
		try {
			session = HibernateSessionFactory.getSession();
			category = (Category)session.get(Category.class, id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		HibernateSessionFactory.closeSession();
		return category;
	}
}

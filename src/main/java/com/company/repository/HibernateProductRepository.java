package com.company.repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.HibernateUtilities;
import com.company.model.Product;

@Repository
public class HibernateProductRepository implements ProductRepository {
	
//	@Autowired
//	private SessionFactory sessionFactory;

	private List<Product> productList= new ArrayList<Product>();

	@Override
	public List<Product> getProductList() {
		Session session = HibernateUtilities.getSessionFactory().openSession();
		session.beginTransaction();
		List<Product> productList = session.createQuery("from Product").list();
		return productList;
	}
	
	@Override
	public Product getOneProduct(int id) {
		Session session = HibernateUtilities.getSessionFactory().openSession();
		session.beginTransaction();
		List<Product> productList = session.createQuery("from Product where id=" +id).list();
		return productList.get(0);
	}

	@Override
	public void addProduct(Product prod)
	{
		Session session = HibernateUtilities.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(prod);
		session.getTransaction().commit();
		productList.add(prod);
	}
	
	@Override
	public void updateProduct(Product prod)
	{
		Session session = HibernateUtilities.getSessionFactory().openSession();
		session.beginTransaction();
		//List<Product> prodDatabaseList = session.createQuery("from Product").list();
		session.update(prod);
		session.getTransaction().commit();
		
//		for(Product prodLoop : productList) {
//			
//			if(prodLoop.getId()==prod.getId()) {
//				prodLoop.setName(prod.getName());
//				prodLoop.setInventory(prod.getInventory());
//				prodLoop.setPrice(prod.getPrice());
//			}
//		}	
	}		
	@Override
	public void deleteProduct(int id)
	{
		Session session = HibernateUtilities.getSessionFactory().openSession();
		session.beginTransaction();
		List<Product> prodDatabaseList = session.createQuery("from Product where id=" + id).list();
		session.delete(prodDatabaseList.get(0));
		session.getTransaction().commit();
		Iterator<Product> productIterator = productList.iterator();
		while(productIterator.hasNext())
		{
			if(productIterator.next().getId()==id)
				productIterator.remove();
		}
	}
}

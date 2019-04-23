package com.company;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
	 
public class HibernateUtilities {
    private static SessionFactory sessionFactory;
	 private static ServiceRegistry serviceRegistry;
	 static {
	        try {
	            // Create the SessionFactory from hibernate.cfg.xml
	            Configuration configuration= new Configuration().configure();
	            serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
	            sessionFactory= configuration.buildSessionFactory(serviceRegistry);
	        } catch (HibernateException ex) {
	            // Make sure you log the exception, as it might be swallowe
	            System.err.println("SessionFactory creation failed." + ex);
	            
	        }
	    }
	 
	    public static SessionFactory getSessionFactory() {
	        return sessionFactory;
	    }
	 
	    
	 
	}

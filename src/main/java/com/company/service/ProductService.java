package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.model.Product;
import com.company.repository.HibernateProductRepository;
import com.company.repository.ProductRepository;

@Service
public class ProductService implements ProductServiceInter {
	
	@Autowired
	ProductRepository productRepository;
	
	@Override
	public void addProduct(Product prod)
	{
		productRepository.addProduct(prod);
	}
	
	@Override
	public void updateProduct(Product prod)
	{
		productRepository.updateProduct(prod);
	}
	
	@Override
	public void deleteProduct(int id)
	{
		productRepository.deleteProduct(id);
	}
	
	@Override
	public List<Product> getAllProducts()
	{
		return productRepository.getProductList();
	}
	
	@Override
	public Product getOneProduct(int id)
	{
		return productRepository.getOneProduct(id);
	}
}

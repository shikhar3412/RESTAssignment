package com.company.service;

import java.util.List;

import com.company.model.Product;

public interface ProductServiceInter {

	void addProduct(Product prod);

	void updateProduct(Product prod);

	void deleteProduct(int id);

	List<Product> getAllProducts();
	
	Product getOneProduct(int id);

}
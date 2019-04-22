package com.company.repository;

import java.util.List;

import com.company.model.Product;

public interface ProductRepository {

	List<Product> getProductList();
	
	Product getOneProduct(int id);
	
	void addProduct(Product prod);

	void updateProduct(Product prod);

	void deleteProduct(int id);

}
package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.company.model.Product;
import com.company.service.ProductServiceInter;

@RestController
public class RESTProductController {

	@Autowired
	ProductServiceInter productService;
	
	@RequestMapping(value="/product")
	public List<Product> displayAllProducts()
	{
		return productService.getAllProducts();
	}
	
	@RequestMapping(value="/product/{id}")
	public Product displayOneProducts(Model model, @PathVariable (value = "id") int id)
	{
		model.addAttribute("productId",id );
		return productService.getOneProduct(id);
	}
}

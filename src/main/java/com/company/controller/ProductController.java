package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.model.Product;
import com.company.repository.HibernateProductRepository;
import com.company.service.ProductService;
import com.company.service.ProductServiceInter;

@Controller
public class ProductController {
	
	@Autowired
	ProductServiceInter productService;
	
	@RequestMapping(value="/product/add", method = RequestMethod.POST)
	public String addProduct(@RequestBody Product product) {
		
		System.out.println(product + " added");
		productService.addProduct(product);
		return "redirect:http://localhost:8080/RESTAssignment/";
		//return "redirect:http://localhost:8080/RESTAssignment/product/add";
	}
	@RequestMapping(value="/product/add", method = RequestMethod.GET)
	public String getAddProduct(@ModelAttribute(value = "product") Product product) {
		
		return "addProduct2";
	}
	
//	@RequestMapping(value= {"/addProduct", "/updateProduct","deleteProduct"}, method = RequestMethod.POST)
//	public String redirectProduct(@ModelAttribute(value = "product") Product product) {
//		
//		//System.out.println(product.getName()+ " added");
//		return "redirect:";
//	}
	
	
	@RequestMapping(value = "/product/update/{id}", method = RequestMethod.GET)
	public String updateProduct(@ModelAttribute(value = "product") Product product, @PathVariable (value = "id") int id, Model model)	{
		
		model.addAttribute("previous", productService.getOneProduct(id));
		product = productService.getOneProduct(id);
		System.out.println(product);
		return "updateProduct2";
	}
	
	@RequestMapping(value = "/product/update/{id}", method = RequestMethod.PUT)
	public String getUpdateProduct(@RequestBody Product product, @PathVariable (value = "id") int id)	{
		
		product.setId(id);
		productService.updateProduct(product);
		return "redirect:http://localhost:8080/RESTAssignment/product/add";
	}
	
	@RequestMapping(value="/product/display")
	public String displayAllProducts()
	{
		return "displayProducts";
	}
	
	@RequestMapping(value = "/product/delete", method = RequestMethod.GET)
	public String deleteProduct(@ModelAttribute (value = "product") Product product )	{
	
		return "deleteProduct";
		//return "redirect:http://localhost:8080/RESTAssignment/product/delete/" + id;
	}	
	
	@RequestMapping(value = "/product/delete", method = RequestMethod.POST)
	public String redirectDeleteProduct(@ModelAttribute (value = "product") Product product )	{
	
		return "redirect:http://localhost:8080/RESTAssignment/product/delete/" + product.getId();
	}	
	
	@RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
	public String deleteGivenProduct(@PathVariable (value = "id") int id )	{
	
		productService.deleteProduct(Integer.valueOf(id));
		return "redirect:http://localhost:8080/RESTAssignment/product/add";
	}	
	
	
}

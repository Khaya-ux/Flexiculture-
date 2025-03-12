package com.flexiculture.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import com.flexiculture.model.Product;

public interface ProductService {
    
    List<Product> getAllProducts();
    
    Optional<Product> getProductById(Long id);
    
    Product saveProduct(Product product);
    
    void deleteProduct(Long id);
    
    List<Product> getProductsByCategory(String category);
    
    List<Product> searchProducts(String keyword);
    
    List<Product> getProductsByPriceRange(BigDecimal minPrice, BigDecimal maxPrice);
    
    List<Product> getInStockProducts();
    
    List<Product> advancedSearch(String keyword, String category, BigDecimal minPrice, BigDecimal maxPrice);
}
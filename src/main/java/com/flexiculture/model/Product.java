package com.flexiculture.model;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "products")
@Data
public class Product {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String name;
    
    @Column(length = 1000)
    private String description;
    
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal price;
    
    private String imageUrl;
    
    private String category;
    
    private boolean inStock = true;
    
    @ElementCollection
    private Set<String> sizes = new HashSet<>();
    
    @ElementCollection
    private Set<String> colors = new HashSet<>();
    
    private String material;
}
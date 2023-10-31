package com.example.productmanager.repository;

import com.example.productmanager.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    void update(Product product);

    void remove(int id);

    List<Product> findByName(String name);

    Product findById(int id);
}

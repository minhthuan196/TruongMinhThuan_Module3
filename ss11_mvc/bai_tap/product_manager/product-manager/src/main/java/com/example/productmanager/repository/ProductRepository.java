package com.example.productmanager.repository;

import com.example.productmanager.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "coca", 10000, "khong duong", "Coca"));
        productList.add(new Product(2, "pepsi", 15000, "khong co ga", "pepsi"));
        productList.add(new Product(3, "revive", 20000, "khong mau", "revive"));
        productList.add(new Product(4, "sting", 5000, "xanh", "sting"));
        productList.add(new Product(5, "milo", 30000, "tang chieu cao", "milo"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public void update(Product product) {
        for (Product product1 : productList) {
            if (product1.getId() == product.getId()) {
                product1.setName(product.getName());
                product1.setPrice(product.getPrice());
                product1.setNote(product.getNote());
                product1.setManufacturer(product.getManufacturer());
                break;
            }
        }
    }

    @Override
    public void remove(int id) {
        for (Product product : productList) {
            if (product.getId() == id) {
                productList.remove(product);
                break;
            }
        }
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList1 = new ArrayList<>();
        for (Product product : productList) {
            if (product.getName().contains(name)) {
                productList1.add(product);
            }
        }
        return productList1;
    }

    @Override
    public Product findById(int id) {
        for (Product product : productList) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }
}

package com.example.productmanager.model;

public class Product {
    private int id;
    private String name;
    private int price;
    private String note;
    private String manufacturer;

    public Product() {
    }

    public Product(int id, String name, int price, String note, String manufacturer) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.note = note;
        this.manufacturer = manufacturer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
}

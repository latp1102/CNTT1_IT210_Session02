package org.example.session02.b3.model;

import java.util.Date;

public class Order {
    private String code;
    private String product;
    private double total;
    private Date date;

    public Order(String code, Date date, String product, double total) {
        this.code = code;
        this.date = date;
        this.product = product;
        this.total = total;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}

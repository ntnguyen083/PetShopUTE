package bean;

import javax.sound.sampled.Line;
import java.util.ArrayList;
import java.util.List;

public class CartBean {

    private int id;
    private int idProduct;
    private int amount;
    private int idBill;
    private int discount;
    private double price;

    public CartBean() { }
    public CartBean(int id, int idProduct, int amount, int idBill, int discount, double price)
    {
        this.id = id;
        this.idProduct = idProduct;
        this.amount = amount;
        this.idBill = idBill;
        this.discount = discount;
        this.price = price;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public void setIdBill(int idBill) {
        this.idBill = idBill;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public int getAmount() {
        return amount;
    }

    public int getIdBill() {
        return idBill;
    }

    public int getDiscount() {
        return discount;
    }

    public double getPrice() {
        return price;
    }


}

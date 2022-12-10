package bean;

import java.util.ArrayList;
import java.util.List;

public class BillBean {
    private int id;
    private int idUser;
    private int status;
    private double totalPrice;

    public BillBean() { }
    public BillBean(int id, int idUser, int status, double totalPrice)
    {
        this.id = id;
        this.idUser = idUser;
        this.status = status;
        this.totalPrice = totalPrice;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getId() {
        return id;
    }

    public int getIdUser() {
        return idUser;
    }

    public int getStatus() {
        return status;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

}

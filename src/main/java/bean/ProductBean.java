package bean;

public class ProductBean {
    private int id;
    private String name;
    private String description;
    private double price;
    private String brand;
    private int idCategory;
    private String urlImage;

    public void ProductBean() { }
    public void ProductBean(int id, String name, String description, double price, String brand, int idCategory, String urlImage)
    {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.brand = brand;
        this.urlImage = urlImage;
        this.idCategory = idCategory;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public String getBrand() {
        return brand;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public String getUrlImage() {
        return urlImage;
    }
}

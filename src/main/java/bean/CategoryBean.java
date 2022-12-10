package bean;

public class CategoryBean {
    private int idCategory;
    private String category;
    public CategoryBean() {}
    public CategoryBean(int id, String category)
    {
        this.idCategory = id;
        this.category = category;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public String getCategory() {
        return category;
    }
}

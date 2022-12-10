package bean;

public class UserBean {
    private int idUser;
    private String userName;
    private String email;

    private String address;
    private String phoneNumber;
    private String passWord;
    public UserBean() { }
    public UserBean(int idUser, String userName, String email, String passWord)
    {
        this.idUser = idUser;
        this.userName = userName;
        this.email = email;
        this.passWord = passWord;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getIdUser() {
        return idUser;
    }

    public String getUserName() {
        return userName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassWord() {
        return passWord;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}

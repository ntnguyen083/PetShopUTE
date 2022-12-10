package bean;

public class RegisterBean {
    private String username;
    private String email;
    private String password;
    private String re_pass;

    public String getUsername() {
        return username;
    }

    public String getEmail()
    {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRe_Password() {
        return re_pass;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRe_Password(String re_password) {
        this.re_pass = re_password;
    }
}

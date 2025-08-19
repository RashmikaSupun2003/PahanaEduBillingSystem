package com.system.model;

public class AddCashierModel {
    private int id;
    private String name;
    private String nic;
    private String phone;
    private String username;
    private String password;

    // Constructors
    public AddCashierModel() {}

    public AddCashierModel(String name, String nic, String phone, String username, String password) {
        this.name = name;
        this.nic = nic;
        this.phone = phone;
        this.username = username;
        this.password = password;
    }

    // Getters and Setters

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getNic() { return nic; }
    public void setNic(String nic) { this.nic = nic; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}

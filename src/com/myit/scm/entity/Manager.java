package com.myit.scm.entity;


public class Manager {

  private int managerId;
  private String username;
  private String password;
  private int permission;
  public int getManagerId() {
    return managerId;
  }
  public void setManagerId(int managerId) {
    this.managerId = managerId;
  }
  public String getUsername() {
    return username;
  }
  public void setUsername(String username) {
    this.username = username;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public int getPermission() {
    return permission;
  }
  public void setPermission(int permission) {
    this.permission = permission;
  }
  @Override
  public String toString() {
    return "{\"managerId\":\"" + managerId + "\",\"username\":\"" + username + "\",\"password\":\""
        + password + "\",\"permission\":\"" + permission + "\"} ";
  }
  
  
}

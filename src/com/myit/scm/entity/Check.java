package com.myit.scm.entity;

import java.io.File;
import java.util.Date;
import java.util.List;

public class Check {

  private int checkId;
  private int checkCarId;
  private String checkCarBrand;
  private String checkCarPerson;
  private int checkLink;
  private String checkInstruction;
  private Date checkDate;
  //private List<File> checkFiles;
  private boolean checkSolved;
  public int getCheckId() {
    return checkId;
  }
  public void setCheckId(int checkId) {
    this.checkId = checkId;
  }
  public int getCheckCarId() {
    return checkCarId;
  }
  public void setCheckCarId(int checkCarId) {
    this.checkCarId = checkCarId;
  }
  public String getCheckCarBrand() {
    return checkCarBrand;
  }
  public void setCheckCarBrand(String checkCarBrand) {
    this.checkCarBrand = checkCarBrand;
  }
  public String getCheckCarPerson() {
    return checkCarPerson;
  }
  public void setCheckCarPerson(String checkCarPerson) {
    this.checkCarPerson = checkCarPerson;
  }
  public int getCheckLink() {
    return checkLink;
  }
  public void setCheckLink(int checkLink) {
    this.checkLink = checkLink;
  }
  public String getCheckInstruction() {
    return checkInstruction;
  }
  public void setCheckInstruction(String checkInstruction) {
    this.checkInstruction = checkInstruction;
  }
  public Date getCheckDate() {
    return checkDate;
  }
  public void setCheckDate(Date checkDate) {
    this.checkDate = checkDate;
  }
 /* public List<File> getCheckFiles() {
    return checkFiles;
  }
  public void setCheckFiles(List<File> checkFiles) {
    this.checkFiles = checkFiles;
  }*/
  
  @Override
  public String toString() {
    return "{\"checkId\":\"" + checkId + "\",\"checkCarId\":\"" + checkCarId
        + "\",\"checkCarBrand\":\"" + checkCarBrand + "\",\"checkCarPerson\":\"" + checkCarPerson
        + "\",\"checkLink\":\"" + checkLink + "\",\"checkInstruction\":\"" + checkInstruction
        + "\",\"checkDate\":\"" + checkDate + "\"} ";
  }
  public boolean isCheckSolved() {
    return checkSolved;
  }
  public void setCheckSolved(boolean checkSolved) {
    this.checkSolved = checkSolved;
  }
  
  
}

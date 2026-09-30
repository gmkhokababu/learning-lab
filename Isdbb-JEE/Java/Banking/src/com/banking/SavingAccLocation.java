package com.banking;

import java.io.File;

public class SavingAccLocation extends FileLocation {
    
    
    int accnumber;
    String locationSInfo = location + "\\SavingAccount";
    File file1 = new File(locationSInfo);
    boolean sInfoDir = file1.mkdir();
    String sInfo = locationSInfo + "\\" + accnumber + ".txt";
    File info = new File(sInfo);
//---------------Conostractor-----------------------------
    public SavingAccLocation() {
    }

    public SavingAccLocation(int accnumber) {
        this.accnumber = accnumber;
    }
//-------------------------Geter & Seter--------------------------------
    public int getAccnumber() {
        return accnumber;
    }

    public void setAccnumber(int accnumber) {
        this.accnumber = accnumber;
    }

    public String getLocationSInfo() {
        return locationSInfo;
    }

    public void setLocationSInfo(String locationSInfo) {
        this.locationSInfo = locationSInfo;
    }

    public File getFile1() {
        return file1;
    }

    public void setFile1(File file1) {
        this.file1 = file1;
    }

    public boolean issInfoDir() {
        return sInfoDir;
    }

    public void setsInfoDir(boolean sInfoDir) {
        this.sInfoDir = sInfoDir;
    }

    public String getsInfo() {
        return sInfo;
    }

    public void setsInfo(String sInfo) {
        this.sInfo = sInfo;
    }

    public File getInfo() {
        return info;
    }

    public void setInfo(File info) {
        this.info = info;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }
    
    //---------------------------End Geter & Seter----------------------------
    
}

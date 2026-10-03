package com.banking;

import java.util.Scanner;

public class Nominee {

    Scanner input = new Scanner(System.in);
    String name;
    String fatherName;
    String motherName;
    int phoneNumber;
    String email;
    int NIDnumber;

    public void nomineeinfo() {
        System.out.println("Type your nominee name");
        name = input.nextLine();
        System.out.println("Type your nominee father name");
        fatherName = input.nextLine();
        System.out.println("Type your nominee mother name");
        motherName = input.nextLine();
        System.out.println("Type your nominee email");
        email = input.nextLine();
        System.out.println("Type your nominee phone Number (Must be 11 digit)");
        phoneNumber = input.nextInt();
        
        System.out.println("Type your NID Number (Must be 10 digit)");
        NIDnumber = input.nextInt();
        
    }

    //----------------constractor------------------------
    public Nominee() {
    }

    public Nominee(String name, String fatherName, String motherName, int phoneNumber, String email, int NIDnumber) {
        this.name = name;
        this.fatherName = fatherName;
        this.motherName = motherName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.NIDnumber = NIDnumber;
    }

    public Scanner getInput() {
        return input;
    }

    public void setInput(Scanner input) {
        this.input = input;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getNIDnumber() {
        return NIDnumber;
    }

    public void setNIDnumber(int NIDnumber) {
        this.NIDnumber = NIDnumber;
    }

}

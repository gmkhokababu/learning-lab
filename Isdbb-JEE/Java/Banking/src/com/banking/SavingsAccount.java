package com.banking;

import java.io.*;
import java.util.Scanner;

public class SavingsAccount extends Account {

    Nominee n = new Nominee();
    SavingAccLocation location = new SavingAccLocation();
    Scanner input = new Scanner(System.in);

    public void createAcc() {
        accountNumber = 100100100;
        location.accnumber = accountNumber;
        try {
            boolean createfile = location.info.createNewFile();
            int i = 0;
            while (createfile != true) {
                i++;
                accountNumber = accountNumber + i;
                createfile = location.info.createNewFile();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("Type your name");
        accountName = input.nextLine();
        System.out.println("Type your father name");
        fatherName = input.nextLine();
        System.out.println("Type your mother name");
        motherName = input.nextLine();
        System.out.println("Type your email");
        email = input.nextLine();
        System.out.println("Type your address");
        address = input.nextLine();
        System.out.println("Type your Date of Birth(dd.mm.yyyy)");
        dateOfBirth = input.nextInt();
        System.out.println("Type your phone Number (Must be 11 digit)");
        phoneNumber = input.nextInt();
        int length = String.valueOf(phoneNumber).length();
        if (length != 11) {
            while (length != 11) {
                System.out.println("Invalid mobile Number type valid number (Must be 11 digit)");
                phoneNumber = input.nextInt();
            }
        }
        System.out.println("Type your NID Number (Must be 10 digit)");
        NIDnumber = input.nextInt();
        length = String.valueOf(NIDnumber).length();
        if (length != 10) {
            while (length != 10) {
                System.out.println("Invalid NID Number type valid number (Must be 10 digit)");
                NIDnumber = input.nextInt();
            }
        }
        //-------------------------Nominee Information-----------------------
        n.nomineeinfo();

    }
}

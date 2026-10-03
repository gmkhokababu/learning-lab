package com.banking;



import java.io.*;

public class FileLocation {

    String location = "F:\\Study\\JEE\\Java\\Project";
    File file = new File(location);
    boolean ch=file.mkdir();
    String location2=location+"\\BankInfo";
    File file2 = new File(location2);
    boolean check=file2.mkdir();
    
    
    
   
}

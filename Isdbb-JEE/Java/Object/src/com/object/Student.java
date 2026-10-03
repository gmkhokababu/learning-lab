
package com.object;
import java.util.Scanner;

public class Student {
    public static Scanner sc=new Scanner(System.in);
     int n(){
        System.out.println("Input Number");
        int n=sc.nextInt();
        return n;
    }
    String name="Abu Hossain";
    int id=1279883;
    String email="gmabuhossain42@gmail.com";
    public static int m1(){
        int round=57;
        
       return round; 
    }
    public static String m2(){
        String add="Kazipur, Rajarhat, Sadar, Jashore-7400";
        return add;
    }
    public void m3(){
        
        System.out.println(n());
    }
}

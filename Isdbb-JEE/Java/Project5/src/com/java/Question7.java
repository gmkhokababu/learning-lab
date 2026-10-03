
package com.java;

import java.util.Scanner;
public class Question7 {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input Number");
        int x=a.nextInt();
        if(x>=80){
            System.out.println("Excillent");
        }else if(x>=60){
            System.out.println("Very Good");
        }else if(x>=40){
            System.out.println("Good");
        }else {
            System.out.println("Bad");
        }
    }
    
}

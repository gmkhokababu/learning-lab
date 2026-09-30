
package com.java;

import java.util.Scanner;
public class EvenOdd {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input Number");
        int x=a.nextInt();
        if(x%2==0){
            System.out.println("Even Number");
        }else{
            System.out.println("Odd Number");
        }
        
    }
    
}

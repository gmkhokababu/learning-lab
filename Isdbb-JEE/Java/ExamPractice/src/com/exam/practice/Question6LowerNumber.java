
package com.exam.practice;

import java.util.Scanner;


public class Question6LowerNumber {
    public static void main(String[] args){
        Scanner input=new Scanner(System.in);
        
        System.out.println("Input Number");
        int x=input.nextInt();
        System.out.println("Input Number");
        int y=input.nextInt();
        System.out.println("Input Number");
        int z=input.nextInt();
        
        if(x<y && x<z){
            System.out.println("The lower number is: "+x);
        }else if(y<x && y<z){
            System.out.println("The lower number is: "+y);
        }else{
            System.out.println("The lower number is: "+z);
        }
    }
}

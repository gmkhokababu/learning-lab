
package com.java;

import java.util.Scanner;


public class Question2 {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input Number 1");
        int x=a.nextInt();
        System.out.println("Input Number 2");
        int y=a.nextInt();
        System.out.println("Input Number 3");
        int z=a.nextInt();
        
        if(x<y && x<z){
            System.out.println("The Min number is "+x);
        }
        else if(y<x && y<z){
            System.out.println("The Min number is "+y);
        }else{
            System.out.println("The Min number is "+z);
        }
    }
}

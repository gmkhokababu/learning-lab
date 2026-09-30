
package com.java;

import java.util.Scanner;
public class Question5 {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        System.out.println("Input Number");
        int x=a.nextInt();
        if(x>=60){
            System.out.println("Pass");
        }else{
            System.out.println("Fail");
        }
    }
    
}


package com.exam.practice;

import java.util.Scanner;
public class Exception {
    public static void main(String[] args){
        Scanner input=new Scanner(System.in);
        System.out.println("Input Number");
        int x=input.nextInt();
        System.out.println("Input Number");
        int y=input.nextInt();
        try{
        int z=x/y;
        System.out.println(z);
        }catch(ArithmeticException F){
            System.out.println("Divide by zero error");
                    
        }finally{
            System.out.println("This is final");
        }
        
        
    }
}

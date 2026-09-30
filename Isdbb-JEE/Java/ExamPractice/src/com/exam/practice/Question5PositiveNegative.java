
package com.exam.practice;

import java.util.Scanner;


public class Question5PositiveNegative {
    public static void main(String[]args){
        Scanner input=new Scanner(System.in);
        
        System.out.println("Input number for check");
        double x=input.nextDouble();
        if(x>0){
            System.out.println(x+" is Possitive number");
        }else if(x<0){
            System.out.println(x+" is Negative number");
        }else{
            System.out.println(x+" is whole number");
        }
    }
}

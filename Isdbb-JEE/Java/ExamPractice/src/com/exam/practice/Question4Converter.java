
package com.exam.practice;

import java.util.Scanner; 
public class Question4Converter {
    public static void main(String[] args){
        Scanner input=new Scanner(System.in);
        
        System.out.println("Input Kilometer");
        double x=input.nextDouble();
        double con=x*0.621371;
        System.out.println("Converted mile is: "+con);
    }
}

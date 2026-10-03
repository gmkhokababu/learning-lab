
package com.exam.practice;

import java.util.Scanner;
public class Q2 {
    public static void main(String[] args){
        Scanner input=new Scanner(System.in);
        System.out.println("Input First salary");
        double person1=input.nextDouble();
        System.out.println("Input Second salary");
        double person2=input.nextDouble();
        System.out.println("Input Third salary");
        double person3=input.nextDouble();
        double sum=person1+person2+person3;
        double avg=sum/3;
        System.out.println("The average salary is: "+avg);
        
    }
}

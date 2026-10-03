
package com.exam.practice;

import java.util.Scanner;
public class Question2Average {
    public static void main(String[] args){
        Scanner input=new Scanner(System.in);
        System.out.println("Input Salary");
        double usersalary1=input.nextDouble();
        System.out.println("Input Salary");
        double usersalary2=input.nextDouble();
        System.out.println("Input Salary");
        double usersalary3=input.nextDouble();
        double sum=usersalary1+usersalary2+usersalary3;
        double avg=sum/3;
        System.out.println("Average Salary is: "+avg);
    }
}

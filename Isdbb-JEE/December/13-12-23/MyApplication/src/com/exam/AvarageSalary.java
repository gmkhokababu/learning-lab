/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.exam;

import java.util.Scanner;

/**
 *
 * @author Student
 */
public class AvarageSalary {
    //-------------- Avarage Salary
    
 public static void main(String[] args){
      Scanner sc = new Scanner(System.in);
       System.out.println("Enter Salary For first Employee");
       double firstSalary = sc.nextDouble();

      System.out.println("Enter Salary For Second Employee");
        double secondSalary = sc.nextDouble();
        
       System.out.println("Enter Salary For Third Employee");
        double thirdSalary = sc.nextDouble();

        double total = firstSalary + secondSalary + thirdSalary;
        System.out.println("Total Salary:");
      System.out.println(total);
        
        double avarage = total/3;
        System.out.println("Avarage Salary:");
       System.out.println(avarage);
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.exam;
import java.util.Scanner;


public class Result {
      
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter number for Bangla:");
        int bangla = sc.nextInt();
        System.out.println("Enter Number for English:");
        int english = sc.nextInt();
        System.out.println("Enter number for ICT:");
        int ict = sc.nextInt();
        System.out.println("Result:");
        int result = bangla + english + ict;
        
        System.out.println(result);
    }  
    
}

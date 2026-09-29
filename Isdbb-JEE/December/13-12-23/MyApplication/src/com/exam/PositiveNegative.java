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
public class PositiveNegative {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        
        System.out.println("Enter a number: ");
        double userInput = input.nextDouble();
        
        if(userInput > 0){
            System.out.println(userInput + " Is a Positive Number");
        }else if(userInput < 0){
            System.out.println(userInput + " Is a Negative Number");
        }else{
            System.out.println(userInput + " Is a Nutral Number");
        }
        
    }
    
    
}

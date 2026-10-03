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
public class KilometerToMile {
    public static void main(String[] args){
        Scanner kilometer = new Scanner(System.in);
        System.out.println("Enter Kilometer: ");
        double inputKilo = kilometer.nextInt();
        
        System.out.println(inputKilo * 0.621371 );
        
    }
    
    
}

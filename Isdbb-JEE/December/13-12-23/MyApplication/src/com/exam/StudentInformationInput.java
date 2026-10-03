
package com.exam;

import java.util.Scanner;



public class StudentInformationInput {
    //    ---------------------- Student INFORMATION
    public static void main(String[] args){
        Scanner studentDetails = new Scanner(System.in);
        
        System.out.println("Enter Your Name: ");
        String userName = studentDetails.nextLine();
        
        System.out.println("Enter Your Round: ");
        int round = studentDetails.nextInt();
        
        System.out.println("Enter your ID: ");
        int batch = studentDetails.nextInt();
        
        System.out.println("Enter Your MCQ Number: ");
        int mcqNumber = studentDetails.nextInt();
        
        System.out.println("Enter Your Evidence Number: ");
        int evidenceNumber = studentDetails.nextInt();
        
        double total = mcqNumber + evidenceNumber;
        double avg = total/2;
        
        System.out.println("Your Name is " + userName);
        System.out.println("Your Round is " + round);
        System.out.println("Your Batcht is " + batch);
        System.out.println("Your total Number is " + total);
        System.out.println("Your Avarage Number is " + avg );
    }
    
}

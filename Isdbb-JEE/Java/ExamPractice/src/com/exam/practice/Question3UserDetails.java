
package com.exam.practice;

import java.util.Scanner;
public class Question3UserDetails {
    public static void main(String[] args){
        Scanner input=new Scanner(System.in);
        System.out.println("Type your Name");
        String name=input.nextLine();
        System.out.println("Type your ID");
        int id=input.nextInt();
        System.out.println("Type your Round");
        int round=input.nextInt();
        System.out.println("Input your evedence mark");
        double evedance=input.nextDouble();
        System.out.println("Input your MCQ mark");
        double mcq=input.nextDouble();
        double sum=evedance+mcq;
        double avg=sum/2;
        
        System.out.println("ID: "+id);
        System.out.println("Name: "+name);
        System.out.println("Round: "+round);
        System.out.println("Total mark: "+sum);
        System.out.println("Average mark: "+avg);
        
    }
}

package com.exam.practice;

import java.util.Scanner;

public class Question7MultiCalculation {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("Input Number");
        int x = input.nextInt();
        System.out.println("Input Number");
        int y = input.nextInt();
        int sum = x + y;
        int sub = x - y;
        int mul = x * y;
        int div = x / y;

        System.out.println("The summation of "+x + " and " + y + " is " + sum);
        System.out.println("The substraction of "+x + " and " + y + " is " + sub);
        System.out.println("The multiplication of "+x + " and " + y + " is " + mul);
        System.out.println("The division of "+x + " and " + y + " is " + div);
    }
}

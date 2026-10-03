
package com.exam;
import java.util.Scanner;

public class ProductCal {
    public static void main(String[] args){
        Scanner inputNumber = new Scanner(System.in);
        
        System.out.println("Input the price of First Product: ");
        int firstProduct = inputNumber.nextInt();
        
        System.out.println("Enter the price of Second Product: ");
        int secondProduct = inputNumber.nextInt();
        
        System.out.println("Enter the price of Third Product: ");
        int thirdProduct = inputNumber.nextInt();
        
        System.out.println("Enter the price of fourth Product: ");
        int fourthProduct = inputNumber.nextInt();
        
        double total = firstProduct + secondProduct + thirdProduct + fourthProduct;
        
        
        
        double discount;
        
        if(total > 5000){
            discount = total * .15;
        }else if(total > 2000){
            discount = total * .10;
        }else if(total > 1000){
            discount = total * .05;
        }else{
            discount = total;
        }
        
        double netPrice = total - discount;
        
        System.out.println("Total is : " + total);
        System.out.println("Discount: " + discount);
        System.out.printf("Net Price: %.2f" , netPrice);
    }
}

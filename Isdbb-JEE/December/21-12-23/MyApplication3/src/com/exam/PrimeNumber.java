
package com.exam;
import java.util.Scanner;

public class PrimeNumber {
    public static void main(String[] args) {
        Scanner userInput = new Scanner(System.in);
        int count = 0;
        
        System.out.print("Enter a number: ");
        int primeCheck = userInput.nextInt();
        
        for(int i = 1; i <= primeCheck; i++){
            if(primeCheck % i == 0){
                count++;
            }
        }
        
//        System.out.println(count);
        if(count == 2){
            System.out.println( primeCheck + " is a prime number");
        }else{
            System.out.println(primeCheck + " is not a prime numebr");
        }
        
        
        
    }
}

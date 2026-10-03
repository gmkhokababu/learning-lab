
package com.exam;
import java.util.Scanner;

public class Factorial {
    public static void main(String[] args){
        Scanner userInput = new Scanner(System.in);
        
        System.out.print("Enter a number: ");
        int numForFactorial = userInput.nextInt();
        int fac = 1;
        
        if(numForFactorial <= 1){
            System.out.println("The Factorial is " + fac);
        }else{
            for(int i = 2; i <= numForFactorial; i++){
                fac = fac * i;
            }
            
            System.out.println("The factorial is " + fac);
        }
        
        
        
        
        
        
    }
}

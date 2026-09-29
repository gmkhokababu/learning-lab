
package com.exam;
import java.util.Scanner;

public class SumUntilMinus1 {
    public static void main(String[] args) {
        Scanner userInput = new Scanner(System.in);
        
        System.out.print("Enter a number: ");
        int inputForSum = userInput.nextInt();
        int sum = 0;
        
        while(inputForSum != -1){
            sum = sum + inputForSum;
            System.out.print("Enter a number: ");
            inputForSum = userInput.nextInt();
        }
        System.out.println(sum);   
    }
}

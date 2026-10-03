
package myapplication2;
import java.util.Scanner;

public class EvenOrOdd {
    public static void main(String[] args){
        Scanner inputNumber = new Scanner(System.in);
        
        System.out.println("Enter a Number: ");
        int evenOrOdd = inputNumber.nextInt();
        
        if(evenOrOdd % 2 == 0){
            System.out.println("This is a even number");
        }else{
            System.out.println("This is an odd number");
        }
        
    }
    
}

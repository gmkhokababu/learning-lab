
package pkg2darrays;

import java.util.Scanner;


public class Main {

    
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner sc = new Scanner(System.in);
        System.out.println("Input row number");
        int rows= sc.nextInt();
        System.out.println("Input Column number");
        int cols= sc.nextInt();
        
        
        int numbers[][]=new int [rows][cols];
        System.out.println("Input cell number");
        for(int i=0; i<rows;i++){
            for(int j=0; j<cols; j++){
                numbers[i][j]=sc.nextInt();
            }
        }
        System.out.println("Result");
        for(int i=0; i<rows; i++){
            for(int j=0; j<cols;j++){
                System.out.print(numbers[i][j]+" ");
            }
            System.out.println("");
        }
    }
    
}

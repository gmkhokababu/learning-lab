
package arrayssearch;

import java.util.Scanner;


public class ArraysSearch {

   
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner sc= new Scanner(System.in);
        System.out.println("Input row number");
        int row=sc.nextInt();
        System.out.println("Input col number");
        int cols=sc.nextInt();
        
        int numbers[][]=new int[row][cols];
        
        System.out.println("Input cell numbers");
        
        //input
        //rows
        for(int i = 0; i<row; i++){
            //cols
            for(int j=0; j<cols; j++){
                numbers[i][j]=sc.nextInt();
            }
        }
        System.out.println("Input finding number");
        int x=sc.nextInt();
        
        //finding the number
        for(int i=0; i<row;i++){
            //col
            for(int j=0; j<cols;j++){
                if(numbers[i][j]==x){
                    System.out.println("The number "+x+" is in ("+i+","+j+")"+" this cell");
                }
            }
        }
    }
    
}

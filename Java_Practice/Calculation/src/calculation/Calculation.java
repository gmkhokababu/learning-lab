
package calculation;

import java.util.Scanner;


public class Calculation {
    public static void printSum(int a, int b){
        int sum= a+b;
        System.out.println("Sum is: "+sum);
        return;
    }
    public static void printProduct(int a, int b){
        int product= a*b;
        System.out.println("Product is: "+ product);
        return;
    }
    public static void printFactorial(int a){
        int factorial=1;
        if(a<0){
            System.out.println("Invalid input, insurt positive number");
            return;
        }
//          else if(a>=0 && a<2){
//            System.out.println("Factorial of "+a+" is :"+factorial);
//        }else{
//            for(int i=2; i<=a; i++){
//                factorial=factorial*i;
//            }
//            System.out.println("Factorial of "+a+" is :"+factorial);
//        }
        for(int i=a; i>=1; i--){
            factorial=factorial*i;
           
        }
        System.out.println("Factorial of "+a+" is :"+factorial);
    }

    
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner sc= new Scanner(System.in);
        System.out.println("Which function you want"+"\nFor sum type s | For multiply type m | For factorial type f");
        String type=sc.next();
        if(type=="s" || type.equals("s")){
            System.out.println("Input first number:");
            int a=sc.nextInt();
            System.out.println("Input second number:");
            int b=sc.nextInt();
            printSum(a, b);
        }else if(type=="m" || type.equals("m")){
            System.out.println("Input first number:");
            int a=sc.nextInt();
            System.out.println("Input second number:");
            int b=sc.nextInt();
            printProduct(a, b);
        }else if(type=="f" || type.equals("f")){
            System.out.println("Input number:");
            int a=sc.nextInt();
            printFactorial(a);
        }
        
    }
    
}

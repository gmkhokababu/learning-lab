
package Student;
import java.util.Scanner;

public class Q_2 {
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);
        System.out.println("Enter a number"); 
        int n= sc.nextInt();
        int sum=0;
        while(n!=-5){
          sum=sum+n;
        System.out.println("Enter a number"); 
        n= sc.nextInt();
        }
        System.out.println("the result is = "+sum );
        
    }
   
}

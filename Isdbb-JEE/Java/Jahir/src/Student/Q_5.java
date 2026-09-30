
package Student;
import java.util.Scanner;
public class Q_5 {
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);
        System.out.println("Enter a number of value"); 
        int x= sc.nextInt();
        int p=1;
        if(x<=1){
            System.out.println(p); 
        } else{
            for(int i=2; i<=x; i++){
                p=p*i;
            }
           
        }
        System.out.println("the result is = "+p);
    }
  
}


package Student;
import java.util.Scanner;
public class Extra {
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);
        System.out.println("enter a value");
        int x=sc.nextInt();
        int a[]={5,0,8,14,12,3,12};
        int count=0;
        int position=0;
        for(int i=0; i<a.length; i++){
          if(x==a[i]){
            count++;
            position=i;
          }  
        }
        if(count>=1){
            System.out.println("Found"); 
            System.out.println(position); 
        } else{
            System.out.println("Not Found");
            System.out.println(position);
        }
    }
}


package exam;
import java.util.Scanner;

public class ResultSystem {
   public static void main (String[] args){
       Scanner x=new Scanner(System.in);
       System.out.println("Input Number Bangla");
       int ban=x.nextInt();
       System.out.println("Input Number English");
       int eng=x.nextInt();
       System.out.println("Input Number Math");
       int math=x.nextInt();
       System.out.println("Input Number Physics");
       int phy=x.nextInt();
       System.out.println("Input Number Chemistry");
       int chem=x.nextInt();
       int sum=(ban+eng+math+phy+chem);
       double avg=sum/5;
       System.out.println("Total Number = "+sum);
       System.out.println("AVG Number = "+avg);
   } 
}

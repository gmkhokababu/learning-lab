package exam;
import java.util.Scanner;

public class NextLn {
    public static void main(String[] args){
        Scanner a=new Scanner(System.in);
        
        /*Input Part*/
        System.out.println("Input Your Name");
        String name=a.nextLine();
        System.out.println("Input Your ID");
        int id=a.nextInt();
        System.out.println("Input Your Round");
        int round=a.nextInt();
        System.out.println("Input Your MCQ Number");
        double mcq=a.nextDouble();
        System.out.println("Input Your Evedince Number");
        double evedince=a.nextDouble();
        
        /*Calculation Part*/
        double sum=mcq+evedince;
        double avg=sum/2;
        
        /*Output Part*/
        System.out.println("My Name is "+name);
        System.out.println("My ID is "+id);
        System.out.println("My Round is "+round);
        System.out.println("My Total Number is "+sum);
        System.out.println("My Average Number is "+avg);
        
    }
    
}

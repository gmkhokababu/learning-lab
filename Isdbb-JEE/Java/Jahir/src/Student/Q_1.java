
package Student;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Q_1 {
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);
        System.out.println("Enter your email"); 
        String x= sc.nextLine();
        String y="^[a-z0-9]+\\@[a-z]+\\.[a-z]{2,3}$";
        Pattern p=Pattern.compile(y);
        Matcher m= p.matcher(x);
        if(m.matches()){
            System.out.println("Valid Email"); 
        } else{
            System.out.println("Invalid Email");
        }
    }
  
}

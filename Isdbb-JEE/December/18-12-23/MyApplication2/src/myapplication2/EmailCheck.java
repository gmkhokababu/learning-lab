
package myapplication2;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.Scanner;

public class EmailCheck {
    public static void main(String[] args){
        Scanner inputEmail = new Scanner(System.in);
        
        String x = "^[a-zA-Z0-9]+@[a-z]+.[a-z]{2,3}$";
        System.out.println("Enter your Email: ");
        String y = inputEmail.nextLine();
        
        
        Pattern p = Pattern.compile(x);
        Matcher m = p.matcher(y);
        
        Boolean b = m.matches();
//        System.out.println(b);
        if(b == true){
            System.out.println("valid Email");
        }else{
            System.out.println("Invalid Email");
        }
        
    }
}

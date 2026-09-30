
package printgivenname;

import java.util.Scanner;
import jdk.nashorn.internal.objects.NativeString;


public class PrintGivenName {
    public static void printMyName(String name){
        String myName=capitalizedFirstletter(name);
        System.out.println(myName);
    
    }
    public static String capitalizedFirstletter(String str){
        
        if(str == null || str.isEmpty()){
            return str;
        }
        
        return str.substring(0, 1).toUpperCase()+str.substring(1);
    }
  
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Input your name:");
        String name=sc.nextLine();
        printMyName(name);
        
    }
    
}

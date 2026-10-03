
package stringquestion1combindlength;

import java.util.Scanner;

public class StringQuestion1CombindLength {

  
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);
        System.out.println("Input array Size");
        int size= sc.nextInt();
        
        String Strings[]=new String[size];
        
        int totlength=0;
        System.out.println("Input Strings");
        for(int i=0; i<Strings.length;i++){
            Strings[i]=sc.next();
            totlength=totlength+Strings[i].length();
        }
        System.out.println(totlength);
    }
    
}

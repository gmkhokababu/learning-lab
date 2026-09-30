
package palindromicpattern;


public class PalindromicPattern {

    
    public static void main(String[] args) {
        // TODO code application logic here
        int n=5;
        for (int i = 1; i<=n; i++){
            //print space
            for ( int j = 1 ; j <= n-i ; j ++){
                System.out.print(" ");
            }
            //number print 1st part
            for ( int j=i; j>=1; j--){
                System.out.print(j);
            }
            
            // number print 2nd part
            for (int j=2; j<=i; j++){
                System.out.print(j);
            }
            System.out.println("");
        }
    }
    
}

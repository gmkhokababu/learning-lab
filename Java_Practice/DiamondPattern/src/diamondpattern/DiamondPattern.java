
package diamondpattern;


public class DiamondPattern {

  
    public static void main(String[] args) {
        // TODO code application logic here
        int n=4;
        for(int i = 1; i<=n; i++){
            //print space
            for(int j=1; j<=n-i; j++){
                System.out.print(" ");
            }
            // print star upper 1st half
            for(int j=i; j>=1; j--){
                System.out.print("*");
            }
            // print star upper 2nd half
            for(int j=2; j<=i; j++){
                System.out.print("*");
            }
            
            
            System.out.println("");
        }
        
        //lower part
        for(int i = n; i>=1; i--){
            //print space
            for(int j=1; j<=n-i; j++){
                System.out.print(" ");
            }
            // print star upper 1st half
            for(int j=i; j>=1; j--){
                System.out.print("*");
            }
            // print star upper 2nd half
            for(int j=2; j<=i; j++){
                System.out.print("*");
            }
            
            
            System.out.println("");
        }
    }
    
}

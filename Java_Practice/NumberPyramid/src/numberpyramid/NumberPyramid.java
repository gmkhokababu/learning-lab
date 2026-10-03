
package numberpyramid;

public class NumberPyramid {

    public static void main(String[] args) {
        
        int n=5;
        for(int i=1; i<=n; i++){
            //print space
            for(int j=1; j<=n-i;j++){
                System.out.print(" ");
            }
            //print number
            for(int j=1; j<=i; j++){
                System.out.print(i);
                System.out.print(" ");
            }
            System.out.println("");
        }
    }
    
}

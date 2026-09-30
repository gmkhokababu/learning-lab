
package diamondpatternv2;


public class DiamondPatternV2 {

    public static void main(String[] args) {
        int n=4;
        //upper half
        for(int i=1; i<=n; i++){
            //print space
            for(int j=1; j<=n-i;j++){
                System.out.print(" ");
            }
            //print star
            for(int j=1; j<=2*i-1; j++){
                System.out.print("*");
            }
            System.out.println("");
        }
        //lower half
        for(int i=n; i>=1; i--){
            //print space
            for(int j=1; j<=n-i;j++){
                System.out.print(" ");
            }
            //print star
            for(int j=1; j<=2*i-1; j++){
                System.out.print("*");
            }
            System.out.println("");
        }
    }
    
}

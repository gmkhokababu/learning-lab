
package halfpyramidwithnumber;

public class HalfPyramidWithNumber {

    public static void main(String[] args) {
        // TODO code application logic here
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=1; j<=i;j++){
                System.out.print(j+" ");
            }
            System.out.println("");
        }
    }
    
}

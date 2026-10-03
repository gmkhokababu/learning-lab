
package invertedhalfpyramid;

public class InvertedHalfPyramid {

  
    public static void main(String[] args) {
        // TODO code application logic here
        int n=4;
        for(int i=n; i>0; i--){
            for(int j=i; j>0; j--){
                System.out.print("*");
            }
            System.out.println("");
        }
    }
    
}


package printhalfpyramidpattern;

public class PrintHalfPyramidPattern {

  
    public static void main(String[] args) {
        int m=4;
        for(int i=0;i<m;i++){
//            inner loop => print space
            for(int j=0;j<m-i;j++){
                System.out.print(" ");
            }
            //            inner loop => print star

            for(int j=0;j<=i;j++){
                System.out.print("*");
            }
            System.out.println("");
        }
    }
    
}

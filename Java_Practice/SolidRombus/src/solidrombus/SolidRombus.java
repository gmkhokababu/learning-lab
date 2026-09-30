
package solidrombus;


public class SolidRombus {

    
    public static void main(String[] args) {
        // TODO code application logic here
        int n=5;
        for(int i=1; i<=n;i++){
            
            int space=n-i;
            //print space
            for(int j=1; j<=space; j++){
                System.out.print(" ");
            }
            for(int j=1; j<=n;j++){
                System.out.print("*");
            }
//            //last space
//            for(int j=1; j<=space; j++){
//                System.out.print(" ");
//            }
            System.out.println("");
        }
    }
    
}

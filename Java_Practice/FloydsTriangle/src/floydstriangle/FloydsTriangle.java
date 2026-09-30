
package floydstriangle;

public class FloydsTriangle {

  
    public static void main(String[] args) {
        // TODO code application logic here
        int n=5;
        int sum=0;
        for(int i=1; i<=n;i++){
            for(int j=1; j<=i; j++){
                sum=sum+1;
                System.out.print(sum+" ");
            }
            System.out.println("");
        }
    }
    
}

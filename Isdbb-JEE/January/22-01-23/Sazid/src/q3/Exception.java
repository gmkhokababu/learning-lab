
package q3;


public class Exception {
     public static void main(String[] args) {
         try {
            int[] arr = new int[5];
            System.out.println(arr[6]);
        }catch(ArrayIndexOutOfBoundsException e){
            System.out.println(e);
        }
        
        
        
        
    }
}

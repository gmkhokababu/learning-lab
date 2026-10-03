
package q3_exceptionHandling;

public class Q3_Exception {
    public static void main(String[] args) {
        int[] arr = new int[5];
        String s = null;
        try{
//            System.out.println(10/0);
//            System.out.println(arr[5]);
            System.out.println(s.length());
            
        }catch(ArithmeticException e){
            System.out.println(e);
        } catch(ArrayIndexOutOfBoundsException e){
            System.out.println(e);
        }catch(NullPointerException e){
            System.out.println(e);
        }catch(Exception e){
            System.out.println(e);
        }
        
        
        
        
    }
}

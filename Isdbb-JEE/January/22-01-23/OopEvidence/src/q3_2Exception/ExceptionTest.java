package q3_2Exception;
public class ExceptionTest {
    public static void main(String[] args) {

        try {
//            String s = null;
            int[] arr = new int[5];
//            System.out.println(9/0);
//            System.out.println(s.length());
//            System.out.println(arr[6]);
        }catch(ArithmeticException e){
            System.out.println(e);
        }
            catch(ArrayIndexOutOfBoundsException e){
            System.out.println(e);
        }catch(NullPointerException e){
            System.out.println(e);
        }catch (Exception e) {
            System.out.println(e);
        }
    }
}

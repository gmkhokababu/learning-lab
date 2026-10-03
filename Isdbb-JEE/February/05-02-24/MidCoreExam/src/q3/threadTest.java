
package q3;


public class threadTest {
    public static void main(String[] args) {
        Thread t1 = new Thread(() -> {
            for (int i = 0; i < 50; i++) {
                 System.out.println("Bangladesh");
            }
        });
        Thread t2 = new Thread(() -> {
            for (int i = 0; i < 50; i++) {
                System.out.println("India");
            }
        });
         Thread t3 = new Thread(() -> {
            for (int i = 0; i < 50; i++) {
                System.out.println("Pakistan");
            }
        });
        

        

        t1.start();
        t2.start();
        t3.start();

    }
}

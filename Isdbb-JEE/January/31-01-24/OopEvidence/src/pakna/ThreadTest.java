
package pakna;

public class ThreadTest {
    public static void main(String[] args) {
        Thread t1 = new Thread(
                ()->{for (int i = 0; i < 100; i++) {
                        System.out.println("Hello -1");
                    }
}
        );
        Thread t2 = new Thread(
                ()->{for (int i = 0; i < 100; i++) {
                        System.out.println("hlw -2");
                    }
}
        );
        
        t1.start();
        t2.start();
       
    }

}

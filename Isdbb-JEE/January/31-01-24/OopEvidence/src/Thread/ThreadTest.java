package Thread;

public class ThreadTest {

    public static void main(String[] args) {
        Thread t1 = new Thread(() -> {
            for (int i = 0; i < 100; i++) {
//                Thread.currentThread().setName("Sazid");
                 System.out.println(Thread.currentThread().getName());
//                Thread.currentThread().setName("Sazid");
//                System.out.println(Thread.currentThread().getName());
            }
        });
        Thread t2 = new Thread(() -> {
            for (int i = 0; i < 100; i++) {
//                System.out.println("Bangladesh");
                System.out.println(Thread.currentThread().getName());
            }
        });
        Thread t3 = new Thread(new Runnable() {

            @Override
            public void run() {
                for (int i = 0; i < 100; i++) {
//                    System.out.println("Hello");
                    System.out.println(Thread.currentThread().getName());
                }
            }
        });

        
//        t1.setName("Sazid");
        t1.start();
       
//        System.out.println(t1.getName());
        t2.start();
//        System.out.println(t2.getName());
        t3.start();
//        System.out.println(t3.getName());
    }
}

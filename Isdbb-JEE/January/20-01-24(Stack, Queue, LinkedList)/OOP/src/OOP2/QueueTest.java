package OOP2;

import java.util.PriorityQueue;

public class QueueTest {

    public static void main(String[] args) {
        PriorityQueue<String> queue1 = new PriorityQueue<>();

        queue1.offer("Sazid");
        queue1.offer("Mahmud");
        queue1.offer("Arif");
        queue1.offer("Sumon");
        queue1.offer("Sajib");
        queue1.offer("ema");

        System.out.println(queue1.poll());
//        System.out.println(queue1.peek());

    }
}

package Student;

import java.util.ArrayList;
import java.util.Scanner;

public class Q_4 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a number of value");
        int x = sc.nextInt();
        int a1 = 0;
        int a2 = 1;
        int sum = 0;
        ArrayList a = new ArrayList();
        if (x == 1) {
            a.add(a1);
        }
        if (x == 2) {
            a.add(a1);
            a.add(a2);
        }
        if (x > 2) {
            a.add(a1);
            a.add(a2);
            for (int i = 3; i <= x; i++) {
                sum = a1 + a2;
                a1 = a2;
                a2 = sum;
                a.add(sum);

            }
        }
        System.out.println("the result is = "+a);
    }

}

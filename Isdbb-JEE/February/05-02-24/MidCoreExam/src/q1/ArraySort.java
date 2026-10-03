package q1;

public class ArraySort {

    public static void main(String[] args) {
        int number[] = {52, 41, 54,15, 78, 63, 14, 21, 65, 17, 43, 99};
        int temp = 0;

        for (int j = 0; j < number.length; j++) {
            for (int i = 0; i < number.length - 1; i++) {
                if (number[i] > number[i + 1]) {
                    temp = number[i];
                    number[i] = number[i + 1];
                    number[i + 1] = temp;
                }
            }
        }

        for (int i = 0; i <= number.length - 1; i++) {
            System.out.print(number[i] + ",");
        }
        System.out.println();

    }
}

package com.exam;

public class sumOfSingleArray {

    public static void main(String[] args) {
        int number[] = {5, 2, 3, 9, 4, 1, 8};
        int sum = 0;

        for (int i = 0; i < number.length; i++) {
            sum = sum + number[i];
        }
        System.out.println(sum);
    }

}

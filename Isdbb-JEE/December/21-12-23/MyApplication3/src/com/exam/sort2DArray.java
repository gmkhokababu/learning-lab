package com.exam;

import java.util.Arrays;

public class sort2DArray {

    public static void main(String[] args) {
        int number[][] = {{5, 2, 1}, {12, 13, 14, 10}, {22, 23, 20, 19}};

        for (int k = 0; k < number.length; k++) {
            int singleArray[] = number[k];

            int temp = 0;
            for (int j = 0; j < singleArray.length; j++) {
                for (int i = 0; i < singleArray.length - 1; i++) {
                    if (singleArray[i] > singleArray[i + 1]) {
                        temp = singleArray[i];
                        singleArray[i] = singleArray[i + 1];
                        singleArray[i + 1] = temp;
                    }
                }

            }
            System.out.println(Arrays.toString(singleArray));
        }

    }
}

package stringcharecterchange;

import java.util.Scanner;

public class StringCharecterChange {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Input your Strings");
        String original = sc.nextLine();
        String result = "";

//        int size = 0;
//        String originalWord = "";
//        String resultWord = "";
//
//        for (int i = 0; i < original.length(); i++) {
//            if (original.charAt(i) == ' ') {
//                size++;
//            }
//        }
//        String Original[] = new String[size + 1];
//        String Result[] = new String[size + 1];
//
//        int j = 0;
        for (int i = 0; i < original.length(); i++) {
            if (original.charAt(i) == 'e') {
                result += 'i';
//                if (original.charAt(i) != ' ') {
//                    originalWord += 'e';
//                    resultWord += 'i';
//                }
            } else {
                result += original.charAt(i);
//                if (original.charAt(i) != ' ') {
//                    originalWord += original.charAt(i);
//                    resultWord += original.charAt(i);
//                }
            }
//            if (original.charAt(i) == ' ') {
//
//                Original[j] = originalWord;
//                Result[j] = resultWord;
//                j++;
//                originalWord = "";
//                resultWord = "";
//
//            }
        }
//        Original[j] = originalWord;
//        Result[j] = resultWord;

        String Original[] = original.split("\\s+");
        String Result[] = result.split("\\s+");
        System.out.println("The Original String is : " + original + "\nThe Result String is : " + result);
        String change = "";
        int count = 0;

        for (int i = 0; i < Original.length; i++) {
            if (!Original[i].equals(Result[i])) {
                change += Result[i] + ", ";
                count++;
            }
        }
        System.out.println("Total " + count + " changes." + "\nChanges are: " + change);
    }

}

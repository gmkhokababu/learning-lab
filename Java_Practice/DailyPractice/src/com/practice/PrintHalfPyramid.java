package com.practice;

public class PrintHalfPyramid {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n=4;
		for ( int i=1; i<=n; i++) {
			int j=1;
			while (j<=i) {
				System.out.print("*");
				j++;
			}
			System.out.println();
		}
	}

}

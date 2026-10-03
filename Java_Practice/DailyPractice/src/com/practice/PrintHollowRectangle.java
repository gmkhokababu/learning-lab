package com.practice;

import java.util.Scanner;

public class PrintHollowRectangle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Input Row number");
		int n=sc.nextInt();
		System.out.println("Input Col number");
		int m=sc.nextInt();
		
//		for(int i=1; i<=n;i++) {
//			if(i==1 || i==n) {
//			for(int j=1; j<=m;j++ ) {
//				
//					System.out.print("*");
//				}
//			}else {
//				for(int j=1; j<=m;j++ ) {
//					if(j==1 || j==m) {
//					System.out.print("*");
//					}else {
//						System.out.print(" ");
//					}
//				}
//			}
//			System.out.println();
//		}
		for(int i=1;i<=n;i++) {
			for(int j=1;j<=m;j++) {
				if(i==1 || j==1 || i==n ||j==m) {
					System.out.print("*");
				}else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}

	}

}

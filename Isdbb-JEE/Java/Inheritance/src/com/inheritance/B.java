
package com.inheritance;


public class B extends A {
    
    int p;
    int q;

    public B() {
    }

    public B(int p, int q) {
        this.p = p;
        this.q = q;
    }

    public B(int p, int q, int x, String y) {
        super(x, y);
        this.p = p;
        this.q = q;
    }
    
    
}

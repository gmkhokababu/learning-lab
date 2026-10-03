
package com.students;


public class BookName {
    String bookname;
    String writername;
    String publisher;
    String editor;
    int edition;
    double mrp;
    int publishyear;

    public BookName() {
    }

    public BookName(String bookname, String writername, String publisher, String editor, int edition, double mrp, int publishyear) {
        this.bookname = bookname;
        this.writername = writername;
        this.publisher = publisher;
        this.editor = editor;
        this.edition = edition;
        this.mrp = mrp;
        this.publishyear = publishyear;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getWritername() {
        return writername;
    }

    public void setWritername(String writername) {
        this.writername = writername;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getEditor() {
        return editor;
    }

    public void setEditor(String editor) {
        this.editor = editor;
    }

    public int getEdition() {
        return edition;
    }

    public void setEdition(int edition) {
        this.edition = edition;
    }

    public double getMrp() {
        return mrp;
    }

    public void setMrp(double mrp) {
        this.mrp = mrp;
    }

    public int getPublishyear() {
        return publishyear;
    }

    public void setPublishyear(int publishyear) {
        this.publishyear = publishyear;
    }

    @Override
    public String toString() {
        return "BookName{" + "bookname=" + bookname + ", writername=" + writername + ", publisher=" + publisher + ", editor=" + editor + ", edition=" + edition + ", mrp=" + mrp + ", publishyear=" + publishyear + '}';
    }
    
    
    
}

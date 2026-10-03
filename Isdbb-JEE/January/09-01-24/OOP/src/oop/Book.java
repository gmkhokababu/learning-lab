
package oop;

public class Book {
    String bookName;
    String writter;
    double price;
    String edition;

    public Book() {
    }

    public Book(String bookName, String writter, double price, String edition) {
        this.bookName = bookName;
        this.writter = writter;
        this.price = price;
        this.edition = edition;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getWritter() {
        return writter;
    }

    public void setWritter(String writter) {
        this.writter = writter;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    @Override
    public String toString() {
        return "Book{" + "bookName=" + bookName + ", writter=" + writter + ", price=" + price + ", edition=" + edition + '}';
    }
    
    
}


package q4.object.writing;

import java.io.*;
public class SavingAccount extends Account implements Serializable {
    int accNo;
    String accName;
    double balance;
    void withdrow(double amount){
        this.balance=this.balance-amount;
    }
    void deposit(double amount){
        this.balance=this.balance+amount;
    }
    void transfer(SavingAccount to,double amount){
        this.balance=this.balance-amount;
        to.balance=to.balance+amount;
    }

    public SavingAccount() {
    }

    public SavingAccount(int accNo, String accName, double balance) {
        this.accNo = accNo;
        this.accName = accName;
        this.balance = balance;
    }

    public int getAccNo() {
        return accNo;
    }

    public void setAccNo(int accNo) {
        this.accNo = accNo;
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "Account Number=" + accNo + "\t\t Account Name=" + accName + "\t\t Account Balance=" + balance;
    }
    
}

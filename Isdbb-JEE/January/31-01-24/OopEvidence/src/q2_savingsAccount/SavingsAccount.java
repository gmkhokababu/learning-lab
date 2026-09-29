package q2_savingsAccount;


public class SavingsAccount {
    int accNo;
    String accName;
    double balance;
    
    public void deposit(double amount){
        this.balance = balance + amount;
    }
    public void withdraw(double amount){
        this.balance = balance - amount;
    }
    
    
    public SavingsAccount(){
        
    }
    public SavingsAccount(int accNo, String accName, double balance){
        this.accNo = accNo;
        this.accName = accName;
        this.balance = balance;
    }
    
}

package q2_savingsAccount;
import java.util.ArrayList;


public class Test {
    public static void main(String[] args) {
        SavingsAccount sazid = new SavingsAccount(100101, "Sazid", 5000);
        SavingsAccount mahmud = new SavingsAccount(102, "mahmud", 4000);
        SavingsAccount rasel = new SavingsAccount(103, "Rasel", 4600);
        
//        System.out.println("Balance of Sazid: "+sazid.balance);
//        sazid.deposit(500);
//        System.out.println("After Deposit: "+sazid.balance);
//        sazid.withdraw(1300);
//        System.out.println("After Withdraw: "+ sazid.balance);
        
        ArrayList<SavingsAccount> list = new ArrayList<>();
        list.add(sazid);
        list.add(mahmud);
        list.add(rasel);
        System.out.println(sazid.balance);
        System.out.println(mahmud.balance);
        
    }
}

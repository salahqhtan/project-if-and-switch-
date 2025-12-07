class BankAccount{
  double accountnumper ;
  String accountName ;
  double  balance ;
  BankAccount(this.accountnumper,this.accountName,this.balance);
  bankAccount(){
     printAccountinfo();
  }
  double getBalance(){
    return balance;
  }
 void printAccountinfo(){
    print("accountnumper:$accountnumper");
    print("accountName:$accountName");
    print("balance:$balance");
  }

}
class SavingAccount extends BankAccount {
  double interestRate;
SavingAccount(super.accountnumper, super.accountName, super.balance,this.interestRate);
   
 // printSavinginfo(){
    savingAccount(){
      printSavinginfo();
    }
   double getinterest(){
    return interestRate;
  }
     void printSavinginfo() {
       super.printAccountinfo();
    print("interestRate:$interestRate");
    }
  }
  class CkecingAccount extends BankAccount{
    double amount; 
  CkecingAccount(super.accountnumper, super.accountName, super.balance,this.amount);
  
  void deposit( double depositAmount){
     balance += depositAmount;
     print("تم أداع:$depositAmount");
      print("balance after deposit:$balance");
  }

   bool withdraw(double withdrawAmount){
     if(balance >=  withdrawAmount){
      balance -=withdrawAmount;
      print("تم سحب:$withdrawAmount");
      print("balance after withdraw:$balance ");
           return true;
     }
     else{
      print("false withdraw");
            return false;
     }
  }
  void  printCkecinginfo(){
    super.printAccountinfo();
    print("amount:$amount");
  }
 
  }
  void main(){
    print("اختيار حساب جاري");
    CkecingAccount C1 = new CkecingAccount(331234567, "جاري", 12000.0, 5000);
    C1.printAccountinfo(); 
    //داله للأداع
    C1.deposit(5000.0);
    //داله السحب
    C1.withdraw(3000);
   C1.withdraw(30000.0);

    print("اختيار حساب توفير");
    SavingAccount s1 = SavingAccount(333312455," حساب توفير",10000.0,3000);
    s1.printSavinginfo();

  }
  
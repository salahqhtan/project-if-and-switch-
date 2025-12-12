import 'dart:io';
int MAX_DAILY_WITHDRAWALS = 3;
double MAX_PER_WITHDRAWAL = 500000.0;
double MAX_DAILY_AMOUNT = 120000.0;
int dailyWithdrawalCount =0;
double dailyWithdrawalTotal =0.0;
//داله عرض الرصيد
void showBalance( double balance){
     print("رصيدك هو:$balance");}

//داله لأيداع الأموال
double deposit(double balance){
  stdout.write("أدخل مبلغ الأداع:");
  double? depositAmount = double.tryParse(stdin.readLineSync()!);
  if(depositAmount != null && depositAmount>0){
    balance += depositAmount;
    print("Deposit:\$${depositAmount}");
    print("رصيدك الجديد هو:\$${balance}");
  }
  else{
    print("مبلغ الأداع غير صالح");
  }
  return balance;
}
// دالة لسحب الأموال
double withdraw(double balance) {
  if(dailyWithdrawalCount>=MAX_DAILY_WITHDRAWALS){
    print("تم الوصول الى حد عدد مرات السحب");
    return balance;
  }
  if(dailyWithdrawalTotal>=MAX_DAILY_AMOUNT){
    print("تم الوصول الى الحد اليومي لسحب");
    return balance;
  }
  stdout.write('أدخل مبلغ السحب: ');
  double? withdrawalAmount = double.tryParse(stdin.readLineSync()!);
  if (withdrawalAmount == null || withdrawalAmount <= 0 ) {
  print("مبلغ السحب غير صحيح");
  return balance;
  }
 if(withdrawalAmount> balance){
  print("مبلغ السحب اكبر من الرصيد");
  return balance;
 }
 if(withdrawalAmount>MAX_PER_WITHDRAWAL){
  print("اقصى مبلغ يمكن سحبه في العمليه الواحده هو 500000.0");
  return balance;
 }
 if((dailyWithdrawalTotal + withdrawalAmount)>MAX_DAILY_AMOUNT){
  double allowedLeft = MAX_DAILY_AMOUNT - dailyWithdrawalTotal;
  print("لا يمكن أكمال السحب لأن وصل الى الحد الأقصى لسحب");
  print("المتبقى لسحب اليومي:$allowedLeft");
  return balance;
 }
 balance -=withdrawalAmount;
 dailyWithdrawalCount +=1;
 dailyWithdrawalTotal += withdrawalAmount;
 print("تم سحب:$withdrawalAmount");
 print("رصيدك بعد السحب هو:$balance");
 print("عدد سحوبات اليوم هو:$dailyWithdrawalCount/$MAX_DAILY_WITHDRAWALS");
 print("مجموع السحب اليوم :$dailyWithdrawalTotal/$MAX_DAILY_AMOUNT");
 return balance;
}
// دالة للخروج من البرنامج
void exitProgram() {
  print('شكرا لك على استخدام خدمتنا!');
}

void main() {
  double balance = 0.0;

  while (true) {
    // عرض قائمة الخيارات
    print('PLZ select operation :');
    print('1. Show balance (عرض الرصيد)');
    print('2. Deposit (إيداع)');
    print('3. Withdraw (سحب)');
    print('4. Exit (خروج)');
    
    // طلب اختيار المستخدم
    stdout.write('أدخل أختيارك: ');
    String? choice = stdin.readLineSync();

    // تنفيذ العمليات بناءً على الاختيار
    if (choice == '1') {
      showBalance(balance);
    } else if (choice == '2') {
      balance = deposit(balance);
    } else if (choice == '3') {
      balance = withdraw(balance);
    } else if (choice == '4') {
      exitProgram();
      break;
    } else {
      print('أختيار غير صالح يرجى المحاوله مره اخرى.');
    }
  }
}
import 'dart:io';
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
  stdout.write('أدخل مبلغ السحب: ');
  double? withdrawalAmount = double.tryParse(stdin.readLineSync()!);
  if (withdrawalAmount != null && withdrawalAmount > 0 && withdrawalAmount <= balance) {
    balance -= withdrawalAmount;
    print('السحب: \$${withdrawalAmount}');
    print('رصيدك الجديد هو: \$${balance}');
  } else {
    print('مبلغ السحب غير صحيح أو رصيد غير كاف!');
  }
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
import 'dart:io';

void main(){
  // 1) قراءة المبلغ المالي
  print("ادخل المبلغ المالي:");
  double amount = double.parse(stdin.readLineSync()!);

  // 2) قراءة عدد الأشهر
  print("ادخل عدد الأشهر:");
  int months = int.parse(stdin.readLineSync()!);

  // 3) حساب الزكاة
  if (amount >= 955000 && months >= 12) {
    double zakah = amount * 0.025; // 2.5% من المبلغ
    double remaining = amount - zakah;

    // 4) طباعة الزكاة والمبلغ المتبقي
    print("\n----- تقرير الزكاة -----");
    print("المبلغ المالي: $amount");
    print("عدد الأشهر: $months");
    print("مقدار الزكاة: $zakah");
    print("المبلغ المتبقي بعد الزكاة: $remaining");
    print("------------------------");
  } else {
    print("Zakah No.");
  }
}

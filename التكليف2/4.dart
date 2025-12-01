import 'dart:io';

void main() {
  // 1) قراءة مبلغ الشراء
  print("ادخل مبلغ الشراء:");
  double purchaseAmount = double.parse(stdin.readLineSync()!);

  // 2) احتساب قيمة الخصم
  double discount = 0;

  if (purchaseAmount > 20000) {
    discount = purchaseAmount * 0.12; // 12% إذا كانت أكثر من 20 ألف
  } else if (purchaseAmount >= 10000) {
    discount = purchaseAmount * 0.07; // 7% إذا كانت >= 10 ألف
  }

  // حساب المبلغ الصافي بعد الخصم
  double netAmount = purchaseAmount - discount;

  // 3) طباعة النتائج
  print("\n----- فاتورة المشتريات -----");
  print("مبلغ الشراء: ${purchaseAmount.toStringAsFixed(2)}");
  print("قيمة الخصم: ${discount.toStringAsFixed(2)}");
  print("الصافي بعد الخصم: ${netAmount.toStringAsFixed(2)}");
  print("-----------------------------");
}

import 'dart:io';

void main() {
  // 1) قراءة الراتب الأساسي
  print("ادخل الراتب الأساسي:");
  double baseSalary = double.parse(stdin.readLineSync()!);

  // 2) قراءة عدد ساعات العمل الإضافية خلال الشهر
  print("ادخل عدد ساعات العمل الإضافية:");
  double extraHours = double.parse(stdin.readLineSync()!);

  // 3) حساب أجر الساعة الواحدة (2.1% من الراتب)
  double hourlyRate = baseSalary * 0.021;

  // 4) طباعة أجر الساعة
  print("\nأجر الساعة الواحدة: ${hourlyRate.toStringAsFixed(2)}");

  // 5) حساب صافي الراتب
  double extraPay = hourlyRate * extraHours;
  double netSalary = baseSalary + extraPay;

  // طباعة صافي الراتب
  print("صافي الراتب بعد ساعات العمل الإضافية: ${netSalary.toStringAsFixed(2)}");
}

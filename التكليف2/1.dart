
import 'dart:io';
void main(){
  print("ادخل اسم الطالب");
  String studentName = stdin.readLineSync()!;
  print("ادخل درجه الماده الأوله");
  double grade1 = double.parse(stdin.readLineSync()!);
   print("ادخل درجة المادة الثانية:");
  double grade2 = double.parse(stdin.readLineSync()!);

  print("ادخل درجة المادة الثالثة:");
  double grade3 = double.parse(stdin.readLineSync()!);

  // 2) حساب مجموع الدرجات والمتوسط
  double total = grade1 + grade2 + grade3;
  double average = total / 3;

  // 3) تحديد نتيجة الطالب
  String result;
  if (grade1 >= 50 && grade2 >= 50 && grade3 >= 50) {
    result = "ناجح ";
  } else {
    result = "راسب ";
  }

  // 4) طباعة التقرير
  print("\n----- تقرير الطالب -----");
  print("اسم الطالب: $studentName");
  print("مجموع الدرجات: $total");
  print("المعدل: ${average.toStringAsFixed(2)}");
  print("النتيجة: $result");
  print("------------------------");
}

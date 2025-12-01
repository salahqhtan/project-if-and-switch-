import 'dart:io';

void main() {
  // قراءة الرقم الأول
  print('أدخل الرقم الأول:');
  double num1 = double.parse(stdin.readLineSync()!);

  // قراءة الرقم الثاني
  print('أدخل الرقم الثاني:');
  double num2 = double.parse(stdin.readLineSync()!);

  // قراءة نوع العملية الحسابية
  print('أدخل العملية الحسابية (+, -, *, /):');
  String operation = stdin.readLineSync()!;

  // تنفيذ العملية الحسابية حسب المدخل
  double result;

  switch (operation) {
    case '+':
      result = num1 + num2;
      print('الناتج: $num1 + $num2 = $result');
      break;
    case '-':
      result = num1 - num2;
      print('الناتج: $num1 - $num2 = $result');
      break;
    case '*':
      result = num1 * num2;
      print('الناتج: $num1 * $num2 = $result');
      break;
    case '/':
      // التحقق من القسمة على صفر
      if (num2 == 0) {
        print('خطأ: لا يمكن القسمة على صفر');
      } else {
        result = num1 / num2;
        print('الناتج: $num1 / $num2 = $result');
      }
      break;
    default:
      print('خطأ: العملية غير صحيحة');
  }
}

import 'dart:io';

void main() {
  // طلب إدخال رقم الشهر
  print("ادخل رقم الشهر (1 - 12):");
  //يقرئ مدخلات المستخدم من الكيبورد//
  int month = int.parse(stdin.readLineSync()!);

  // استخدام switch لتحديد الفصل
  switch (month) {
    case 12:
    case 1:
    case 2:
      print("الفصل هو شتاء ");
      break;
    case 3:
    case 4:
    case 5:
      print("الفصل هو ربيع 🌸");
      break;
    case 6:
    case 7:
    case 8:
      print("الفصل هو صيف ☀️");
      break;
    case 9:
    case 10:
    case 11:
      print("الفصل هو خريف 🍂");
      break;
    default:
      print("رقم الشهر غير صحيح!");
  }
}

import 'dart:io'; 

List<String> movies = [
  'The Great Adventure',
  'Space Journey',
  'Love in Beirut'
];


List<List<bool>> seatsPerMovie = List.generate(3, (_) => List.filled(50, false));
void showMovies() {
  print('\n=== Available Movies ===');
  for (int i = 0; i < movies.length; i++) {
    int available = seatsPerMovie[i].where((s) => s == false).length;
    print('${i + 1}. ${movies[i]}  - Available seats: $available / 50');
  }
  print('========================\n');
}

void showSeatsLayout(int movieIndex) {
  print('\nSeats layout for "${movies[movieIndex]}" (1..50):');

  for (int rowStart = 0; rowStart < 50; rowStart += 10) {
    String line = '';
    for (int j = 0; j < 10; j++) {
      int seatNum = rowStart + j + 1;
      bool booked = seatsPerMovie[movieIndex][seatNum - 1];
      // نستخدم [X] للمحجوز و [NN] للمتاح حيث NN رقم المقعد
      line += booked ? '[X]' : '[${seatNum.toString().padLeft(2, ' ')}]';
      line += ' ';
    }
    print(line);
  }
  print('(X = محجوز)\n');
}
// وضعنا دالة منفصلة لعرض المخطط لأننا نريد أن يعرضها المستخدم قبل اختيار المقاعد.
// الدالة تأخذ index للفيلم لتحديد أي مصفوفة مقاعد تعرض.

/// دالة لحجز تذاكر
void bookTicket() {
  showMovies(); // نعرض الأفلام أولاً لتوجيه المستخدم لاختيار الفيلم

  // اختيار الفيلم
  stdout.write('Enter movie number to book: ');
  String? movieInput = stdin.readLineSync();
  int? movieIndex = int.tryParse(movieInput ?? '');
  if (movieIndex == null || movieIndex < 1 || movieIndex > movies.length) {
    // تحقق من صحة إدخال المستخدم — مهم لتفادي أخطاء النطاق أو مدخلات غير رقمية
    print('Invalid movie number!\n');
    return;
  }
  movieIndex -= 1; // تحويل إلى فهرس صفري داخلياً

  // حساب المقاعد المتاحة
  int available = seatsPerMovie[movieIndex].where((s) => s == false).length;
  if (available == 0) {
    // إذا لم يتبق أي مقاعد نعلم المستخدم مباشرة وننهي الدالة
    print('Sorry, no seats available for this movie.\n');
    return;
  }

  // عدد التذاكر للحجز
  stdout.write('Enter number of tickets to book (max 5): ');
  String? numInput = stdin.readLineSync();
  int? numTickets = int.tryParse(numInput ?? '');
  if (numTickets == null || numTickets < 1 || numTickets > 5) {
    // التحقق من شرط الحد الأقصى لكل حجز (قيد المشروع)
    print('Invalid number of tickets (must be 1..5).\n');
    return;
  }
  if (numTickets > available) {
    // لا يمكن حجز أكثر من المتاح
    print('Not enough available seats. Available: $available\n');
    return;
  }

  // عرض مخطط المقاعد لمساعدة المستخدم على اختيار المقاعد يدوياً
  showSeatsLayout(movieIndex);

  // جمع أرقام المقاعد من المستخدم
  List<int> chosenSeats = [];
  for (int i = 0; i < numTickets; i++) {
    stdout.write('Enter seat number #${i + 1} (1..50): ');
    String? seatInput = stdin.readLineSync();
    int? seatNum = int.tryParse(seatInput ?? '');
    if (seatNum == null || seatNum < 1 || seatNum > 50) {
      // تحقق من صحة رقم المقعد
      print('Invalid seat number! عملية الحجز ألغيت.\n');
      return;
    }
    if (seatsPerMovie[movieIndex][seatNum - 1]) {
      // التأكد أن المقعد غير محجوز فعلاً — شرط أساسي (لا يمكن حجز مقعد محجوز مسبقًا)
      print('Seat $seatNum is already booked! عملية الحجز ألغيت.\n');
      return;
    }
    if (chosenSeats.contains(seatNum)) {
      // التأكد من عدم تكرار اختيار نفس المقعد ضمن نفس عملية الحجز
      print('You already selected seat $seatNum in this booking. عملية الحجز ألغيت.\n');
      return;
    }
    chosenSeats.add(seatNum); // تخزين المقعد كخيار مؤقت
  }

  // تأكيد الحجز: تعليم المقاعد كمحجوزة
  for (int s in chosenSeats) {
    seatsPerMovie[movieIndex][s - 1] = true;
  }

  print('Booking successful for movie "${movies[movieIndex]}". Seats: ${chosenSeats.join(', ')}\n');
}
// سبب تقسيم الحجز بهذه الطريقة:
// - القيام بفحوصات صحة متسلسلة يقلل الأخطاء (عدد التذاكر، توفر المقاعد، أرقام صحيحة).
// - نلغي عملية الحجز بالكامل عند أي خطأ لتجنب حالات الجزئي (حجز بعض المقاعد وترك البعض).

/// دالة لإلغاء الحجز
void cancelBooking() {
  showMovies(); // نعرض الأفلام حتى يحدد المستخدم من أي فيلم يريد الإلغاء

  // اختيار الفيلم
  stdout.write('Enter movie number to cancel booking from: ');
  String? movieInput = stdin.readLineSync();
  int? movieIndex = int.tryParse(movieInput ?? '');
  if (movieIndex == null || movieIndex < 1 || movieIndex > movies.length) {
    print('Invalid movie number!\n');
    return;
  }
  movieIndex -= 1;

  // عرض مخطط المقاعد حتى يرى المستخدم المقاعد المحجوزة
  showSeatsLayout(movieIndex);

  // طلب عدد المقاعد للإلغاء
  stdout.write('Enter number of seats to cancel: ');
  String? numInput = stdin.readLineSync();
  int? numCancel = int.tryParse(numInput ?? '');
  if (numCancel == null || numCancel < 1) {
    print('Invalid number!\n');
    return;
  }

  // جمع أرقام المقاعد للإلغاء
  List<int> cancelSeats = [];
  for (int i = 0; i < numCancel; i++) {
    stdout.write('Enter seat number to cancel #${i + 1}: ');
    String? seatInput = stdin.readLineSync();
    int? seatNum = int.tryParse(seatInput ?? '');
    if (seatNum == null || seatNum < 1 || seatNum > 50) {
      print('Invalid seat number! عملية الإلغاء ألغيت.\n');
      return;
    }
    if (!seatsPerMovie[movieIndex][seatNum - 1]) {
      // إذا كان المقعد غير محجوز فلا يمكن إلغاءه
      print('Seat $seatNum is not currently booked! عملية الإلغاء ألغيت.\n');
      return;
    }
    if (cancelSeats.contains(seatNum)) {
      // منع إلغاء نفس المقعد أكثر من مرة ضمن نفس العملية
      print('You already chose seat $seatNum to cancel. عملية الإلغاء ألغيت.\n');
      return;
    }
    cancelSeats.add(seatNum);
  }

  // تنفيذ الإلغاء فعلياً بتعيين الحالة إلى false (متاح)
  for (int s in cancelSeats) {
    seatsPerMovie[movieIndex][s - 1] = false;
  }

  print('Cancellation successful for movie "${movies[movieIndex]}". Seats freed: ${cancelSeats.join(', ')}\n');
}
// إلغاء الحجز يحتوي على نفس فحوصات الصحة لضمان الاتساق ومنع أخطاء حالة السباق (race condition).

/// دالة الخروج
void exitProgram() {
  print('Thank you for using the cinema booking system!');
}
// دالة بسيطة منفصلة للحفاظ على بنية الدوال موحدة (كل خيار له دالته).

/// الدالة الرئيسية (واجهة المستخدم)
void main() {
  while (true) {
    print('=== Cinema Booking System ===');
    print('1. Show available movies');
    print('2. Book tickets');
    print('3. Cancel booking');
    print('4. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      showMovies();
    } else if (choice == '2') {
      bookTicket();
    } else if (choice == '3') {
      cancelBooking();
    } else if (choice == '4') {
      exitProgram();
      break; // الخروج من الحلقة الرئيسية وبالتالي إنهاء البرنامج
    } else {
      print('Invalid choice, please try again.\n');
    }
  }
}
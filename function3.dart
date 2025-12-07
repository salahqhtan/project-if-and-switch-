import 'dart:io';
//داله لتخزين المهام
List<String> tasks=[]; 
List <bool>taskStatus = [];
//داله عرض المهام
 void showTasks (){
  print("عرض المهام:");
  if(tasks.isEmpty){
   print("no tasks");
  }
  else{
    for(int i=0;i<tasks.length;i++){
      String Status = taskStatus[i]?"completed":"notcompleted";
      print("${i+1}..${tasks[i]} [$Status]");
    }
  }
}
 //adds stak(string){
  void addTask( )  {
 stdout.write("أدخل المهمه الجديده:");
 String? newTask = stdin.readLineSync();
    if(newTask != null && newTask.isNotEmpty){
    tasks.add(newTask);
    taskStatus.add(false);
    print("المهام الجديده:");
    }
   else if (tasks.length>=15){print("لايمكن اضافه اكثر من 15 مهمه"); }
    else{
    print(" مهمه غير صالحه")   ;
  }
  }
  //داله تحديث المهام



  void updateTaskstatus(){
    showTasks();
    if(tasks.isEmpty) return;
    stdout.write("ادخل رقم المهمه للتحديث:");
    int? index = int.tryParse(stdin.readLineSync()!);
    if(index == null || index<1 || index> tasks.length){
      print("رقم عير صالح");
      return ;
    }
    //يبديل الحاله
    int rasksindex = index-1;
    taskStatus[rasksindex] =!taskStatus[rasksindex];
    print("حاله المهمه المحدثه");
  }
  //داله الخروج
  void exitProgram() {
  print('شكرا لك على استخدام خدمتنا!');
}
 void main(){
   while (true) {
    // عرض قائمة الخيارات
    print('PLZ select operation :');
    print('1. Show staks (عرض المهام)');
    print('2. add stek new (اضافه مهمه جديده)');
    print('3. refresh (تحديث المهام)');
    print('4. Exit (خروج)');
        // طلب اختيار المستخدم
        //هاذا السطر يسمح للمستخد لاالأدخال من لوحه المفاتيح
    stdout.write('أدخل أختيارك: ');
    String? choice = stdin.readLineSync();

    if(choice == '1'){
       showTasks() ;
    }
    else if(choice == '2'){
      addTask();
    }
    else if(choice == '3'){
     updateTaskstatus();
    }
    else if (choice == '4') {
      exitProgram();
      break;}
      else{
        print(" الاختيار غير صالح اعد المحوله");
      }
          // viewstaks("learn""student") ;
          // newstak("reader");

      }}
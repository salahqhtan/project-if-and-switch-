import 'dart:io';
//ist<String> car=[]; 
class Car {
   String name;
   int Year;
   bool isElectric ;
      double Price ;
      int passengerCapacity;
   Car({
     required this.name,
    required this.Year ,
   required this.isElectric ,
   required this.Price ,
   required this.passengerCapacity,
 } );
 //تحقق هل السياره 
   bool chackElectric(){
    return isElectric;//
   }
   //داله تتحقق من الاصدار
   bool checkYear(){
    return Year>=1980 && Year<=2025;
    
    
  }
   //داله لحساب تكلفه الصيانه
   double Maintenance(){
    return Price*0.10;
   }
   void getCarinfo(){
    print("name:$name");
print("year:$Year");
print("isElectric:$isElectric");
print("Price:$Price");
print("passengerCapacity:$passengerCapacity");
print('Maintenance Cost (10%): ${Maintenance().toStringAsFixed(2)}');
    print('Year Valid: ${checkYear() ? "Valid (1980-2025)" : "Invalid"}');
    print('-----------------------------\n');
   }
}

void main(){
  Car car1= new Car(
   name:"prado",
    Year:2015 ,
    isElectric :false,
     Price :15000.0,
     passengerCapacity:10,
  );
car1.getCarinfo();
print('ادخل بيانات السيارة الثانية:');

  stdout.write('name: ');
  String name = stdin.readLineSync()!.trim();
  if(name.isEmpty)
  {print("Unknown");

  }

  stdout.write('Year): ');
  int checkYear = int.tryParse(stdin.readLineSync()!.trim()) ?? 0;
  if(checkYear>=1980 && checkYear<=2025){
      print("Year:$checkYear");}
    else{
      print("false year");
      
    }
  stdout.write('Is electric? (yes/no): ');
  String electricInput = stdin.readLineSync()!.trim().toLowerCase();
  bool isElectric = (electricInput == 'yes' || electricInput == 'y' || electricInput == 'نعم');

  stdout.write('Price  ');
  double price = double.tryParse(stdin.readLineSync()!.trim()) ?? 0.0;

  stdout.write('Passenger Capacity : ');
  int capacity = int.tryParse(stdin.readLineSync()!.trim()) ?? 0;

  Car car2 = Car(
    name: name.isEmpty ?'Unknown' : name,
    Year: checkYear,
    isElectric: isElectric,
    Price: price,
    passengerCapacity: capacity,
  );

  print('\nCar 2 (from user):');
  car2.getCarinfo();
}

class Car{
  int _carID;
  String _carName;
  String _carType ;
  double _carPrice;
  double _discount = 0.15; // الخصم الافتراضي 15%

  Car({
   required int id,
   required String name,
   required String type,
   required double price,
})   :_carID = id,
      _carName = name,
      _carType = type,
      _carPrice = price;

void getCarinfo(){
  print("car Id: $carID");
  print("Name:$carName");
  print("Tyep:$carType");
  print("discount:\$${carPrice.toStringAsFixed(2)}");
  print("discount:${(-discount *100)..toStringAsFixed(2)}}");
  print("Totalprice:\$${Totalprice.toStringAsFixed(2)}");

}
  int get carID => _carID;
   set carID(int id) =>_carID = id;
  
  String get carName => _carName;
   set carName(String name) => _carName=name;
    
   String get carType => _carType ;
  set carType (String type) => _carType=type;
  
  
  double get carPrice => _carPrice;
  set carPrice(double price)=> _carPrice=price;
    
  double get discount => _discount;
  set discount(double discountRate) => _discount = discountRate;
  
    
  double get Totalprice{
        return _carPrice-(_carPrice*_discount);
  }

}
void main(){
Car car1 = Car(
  id : 2,
  name : 'brado',
  type : 'toyota',
  price :50000.0,
  );
   print("بيانات الكائن الأول(car1)");
    car1.getCarinfo();
// car1.carID = 2;
 // car1.carName = 'BMW X5';
//car1.carType = 'SUV';
//car1.carPrice = 50000.0;
// car1.discount = 0.10;


 Car car2 = Car(
  id : 20,
  name : 'landcroser',
  type : 'toyota',
  price :70000.0,
 );
  print("بيانات الكائن الثاني\n(car1)");

     car2.getCarinfo();


//  عرض التفاصيل باستخدام دالة getCarInfo

}
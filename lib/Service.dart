import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class Foodlist{
  String dish_id;
  String dish_name;
  double dish_price;
  String dish_image;
  String dish_currency;
  String dish_calories;
  String dish_description;
  bool dish_Availability;
  int dish_Type;
  String nexturl;

  Foodlist({this.dish_Availability,this.dish_calories,this.dish_currency,this.dish_description,this.dish_id,
    this.dish_image,this.dish_name,this.dish_price,this.dish_Type,this.nexturl});
}


Future<List<Foodlist>> getdata() async {
  Response response = await http.get(Uri.parse("https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad"));
  List responseJson = json.decode(response.body.toString());
  List<Foodlist> list = createMultiShiftsListbydesignation(responseJson);

  print(list);
  return list;
}

List<Foodlist> createMultiShiftsListbydesignation(List data){
  List<Foodlist> list = new List();
  for(int i=0; i<data.length; i++) {
    String dish_id = data[i]['dish_id'];
    String dish_name = data[i]['dish_name'];
    double dish_price = data[i]['dish_price'];
    String dish_image = data[i]['dish_image'];
    String dish_currency = data[i]['dish_currency'];
    String dish_calories = data[i]['dish_calories'];
    String dish_description = data[i]['dish_description'];
    bool dish_Availability = data[i]['dish_Availability'];
    int dish_Type = data[i]['dish_Type'];
    String nexturl = data[i]['nexturl'];
    Foodlist row = new Foodlist(
      dish_id: dish_id,
      dish_name: dish_name,
      dish_price: dish_price,
      dish_image: dish_image,
      dish_currency: dish_currency,
      dish_calories: dish_calories,
      dish_description: dish_description,
      dish_Availability: dish_Availability,
      dish_Type: dish_Type,
      nexturl: nexturl,
    );
    list.add(row);
  }
  return list;
}


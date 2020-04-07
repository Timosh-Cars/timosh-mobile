import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:timosh_app/models/car.dart';
import 'package:timosh_app/models/repository.dart';

class CarsProvider {
  Repository<Car> cars;

  CarsProvider() {
    cars = Repository<Car>();

    init();
  }

  void init() async {
    cars.addRange(await fetchCars());
  }

  Future<List<Car>> fetchCars() async {
    const path = "https://timosh.com.ua/wp-json/wc/v2/products?consumer_key=ck_b49d2c9b0a4c65b3d2d72e3db1aba704773f4f4d&consumer_secret=cs_b0e5d0b6dc84aa35c24ee30e8356abde75754da3";

    final response = await http.get(path);

    if(response.statusCode != 200)
      throw Exception("Cannot load cars");

    var som = jsonDecode(response.body);
    var res = List<Car>();
    for(final car in som) {
      res.add(Car.fromJson(car));
    }

    return res;
  }
}